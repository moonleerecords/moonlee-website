# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Release do
  menu label: 'Releases', priority: 4
  config.sort_order = 'catalog_number_desc'
  permit_params :title,
                :cover,
                :catalog_number,
                :release_date,
                :description,
                :tracklist,
                :genre,
                :for_fans_of,
                :quote,
                :bandcamp_url,
                :bandcamp_id,
                :internal,
                artist_ids: [],
                release_types_attributes: [
                  :id,
                  :release,
                  :release_format,
                  :_destroy,
                  release_type_buy_links_attributes: [:id, :title, :source, :buy_url, :release_type, :_destroy]
                ]

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :artists,
              as: :select,
              multiple: true,
              required: true,
              collection: Artist.all
      f.input :title
      f.input :cover,
              as: :file,
              hint: (f.object.cover.present? ? image_tag(f.object.cover.url(:medium)) : content_tag(:span, ''))
      f.input :catalog_number
      f.input :release_date,
              as: :date_time_picker,
              picker_options: {
                timepicker: false,
                format: 'd.m.Y',
                value: (localize(f.object.release_date) if f.object.release_date)
              }
      f.input :description, as: :ckeditor
      f.input :tracklist, as: :ckeditor
      f.input :genre
      f.input :for_fans_of
      f.input :quote
      f.input :bandcamp_url
      f.input :bandcamp_id
      f.input :internal
      f.input :active
      f.has_many :release_types, heading: 'Formats', allow_destroy: true do |release_type|
        release_type.input :release_format,
                           as: :select,
                           collection: ReleaseType.allowed_formats.collect { |format| [translate(format), format] }
        release_type.has_many :release_type_buy_links,
                              heading: 'Buy links',
                              allow_destroy: true,
                              new_record: 'Add new buy link' do |buy_link|
          buy_link.input :title
          buy_link.input :source,
                         as: :select,
                         collection: ReleaseTypeBuyLink.allowed_sources.collect { |source| [translate(source), source ] }
          buy_link.input :buy_url
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row 'Artist(s)' do
        release.artists_names
      end
      row :title
      row :cover do
        image_tag(release.cover.url(:medium)) if release.cover.present?
      end
      row :catalog_number
      row :release_date
      row :description do
        # rubocop:disable Rails/OutputSafety
        release.description.html_safe
      end
      row :tracklist do
        release.tracklist.html_safe
      end
      row :genre
      row :for_fans_of
      row :quote
      row :bandcamp_url do
        link_to release.bandcamp_url, release.bandcamp_url, target: '_blank'
      end
      row :bandcamp_id
      row :internal
      row 'Formats' do
        release.release_types.each do |release_type|
          div translate(release_type.release_format) do
            ul do
              release_type.release_type_buy_links.each do |buy_link|
                li link_to "#{buy_link.source} (#{buy_link.title})", buy_link.buy_url, target: '_blank'
              end
            end
          end
        end
        nil
      end
      row 'Reviews' do
        ul do
          release.release_reviews.each do |release_type|
            li render_review(release_type)
          end
        end
      end
    end
  end

  index do
    selectable_column
    column 'Catalog number', :catalog_number, sortable: :catalog_number
    column 'Artist', :artists_names, sortable: 'artists.name'
    column 'Title', :title, sortable: :title
    column 'Release date', :release_date, sortable: :release_date
    column 'Internal', :internal, sortable: :internal
    column 'Active', :active, sortable: :active
    actions
  end

  # TODO: configure proper CSV, XML and JSON export
end
