ActiveAdmin.register Release do
  menu label: 'Releases', priority: 4
  decorate_with ReleaseDecorator
  config.sort_order = 'catalog_number_asc'
  permit_params :title,
                :cover,
                :catalog_number,
                :release_date,
                :description,
                :tracklist,
                :for_fans_of,
                :bandcamp_url,
                :bandcamp_player,
                :internal,
                artist_ids: [],
                release_types_attributes: [
                  :id,
                  :release,
                  :format,
                  :_destroy,
                  release_type_main_buy_links_attributes: [:id, :buy_url, :release_type, :_destroy],
                  release_type_other_buy_links_attributes: [:id, :title, :buy_url, :release_type, :_destroy]
                ]

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :artists,
              as: :select,
              multiple: true,
              required: true,
              collection: Artist.order(:name)
      f.input :title
      f.input :cover, as: :file, hint: image_tag(f.object.cover.url(:small))
      f.input :catalog_number
      f.input :release_date,
              as: :date_time_picker,
              picker_options: {
                timepicker: false,
                format: 'd.m.Y',
                value: localize(f.object.release_date)
              }
      f.input :description, as: :ckeditor
      f.input :tracklist, as: :ckeditor
      f.input :for_fans_of
      f.input :bandcamp_url
      f.input :bandcamp_player
      f.input :internal
      f.input :active
      # TODO: custom add button label
      f.has_many :release_types, heading: 'Formats', allow_destroy: true do |release_type|
        release_type.input :release_format,
                           as: :select,
                           collection: ReleaseType.allowed_formats.collect { |format| [translate(format), format] }
        release_type.has_many :release_type_main_buy_links,
                              heading: 'Main buy link',
                              allow_destroy: true do |main_buy_link|
          main_buy_link.input :buy_url
        end
        release_type.has_many :release_type_other_buy_links,
                              heading: 'Other buy links',
                              allow_destroy: true do |other_buy_link|
          other_buy_link.input :title
          other_buy_link.input :buy_url
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
        image_tag(release.cover.url(:small))
      end
      row :catalog_number
      row :release_date
      row :description do
        raw release.description
      end
      row :tracklist do
        raw release.tracklist
      end
      row :for_fans_of
      row :bandcamp_url do
        link_to release.bandcamp_url, release.bandcamp_url, target: '_blank'
      end
      row :bandcamp_player
      row :internal
      row 'Formats' do
        release.release_types.each do |release_type|
          div translate(release_type.release_format) do
            ul do
              release_type.release_type_main_buy_links.each do |main_buy_link|
                li link_to 'Internal store', main_buy_link.buy_url, target: '_blank'
              end
              release_type.release_type_other_buy_links.each do |other_buy_link|
                li link_to other_buy_link.title, other_buy_link.buy_url, target: '_blank'
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
