# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Artist do
  menu label: 'Artists', priority: 3
  config.sort_order = 'name_asc'
  permit_params :name,
                :image,
                :description,
                :origin,
                :formed,
                :disbanded,
                :booking_agent,
                :quote,
                :songkick_id,
                :active,
                :records,
                :booking,
                external_links_attributes: [
                  :id,
                  :url_type,
                  :url
                ],
                artist_members_attributes: [
                  :id,
                  :role,
                  :active,
                  :_destroy
                ]

  scope 'Records', :on_records, default: true
  scope 'Booking', :on_booking
  scope 'Hidden', :hidden

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :image,
              as: :file,
              hint: (f.object.image.present? ? image_tag(f.object.image.url(:medium)) : content_tag(:span, ''))
      f.input :description, as: :ckeditor
      f.input :origin
      f.input :formed
      f.input :disbanded
      f.input :booking_agent
      f.input :quote
      f.input :songkick_id, label: 'Songkick artist ID'
      f.input :records, label: 'Under the Moonlee records'
      f.input :booking, label: 'Under the Moonlee booking'
      f.input :active, label: 'Actively playing'
      f.has_many :external_links, heading: 'Links', allow_destroy: true do |external_link|
        external_link.input :url_type,
                            as: :select,
                            collection: ExternalLink.allowed_url_types.collect { |type| [translate(type), type] }
        external_link.input :url
      end
      f.has_many :artist_members, heading: 'Members', allow_destroy: true do |artist_member|
        artist_member.input :member,
                            as: :select,
                            collection: Member.all.collect { |member| [member.name, member.id] }
        artist_member.input :role
        artist_member.input :active
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :image do
        link_to(image_tag(artist.image.url(:medium)), artist.image.url(:original), target: '_blank', title: 'Click to open original image') if artist.image.present?
      end
      row :description do
        # rubocop:disable Rails/OutputSafety
        artist.description.html_safe if artist.description
      end
      row :origin
      row :formed
      row :disbanded
      row :songkick_id
      row :records
      row :booking
      row :active
      if artist.external_links.count > 0
        panel 'Links' do
          ul do
            artist.external_links.each do |external_link|
              li link_to(external_link.url_type, external_link.url, target: '_blank') unless external_link.url_type == ''
            end
          end
        end
      end
      if artist.artist_members.active_members.count > 0
        panel 'Active members' do
          ul do
            artist.artist_members.active_members.each do |artist_member|
              li do
                "#{artist_member.member.name} - #{artist_member.role}"
              end
            end
          end
        end
      end
      if artist.artist_members.former_members.count > 0
        panel 'Past members' do
          ul do
            artist.artist_members.former_members.each do |artist_member|
              li do
                "#{artist_member.member.name} - #{artist_member.role}"
              end
            end
          end
        end
      end
      panel 'Releases' do
        artist.releases.each do |release|
          table_for release do
            column :catalog_number do
              link_to release.catalog_number, edit_admin_release_url(release)
            end
            column :title
            column :release_date
            column :internal
          end
        end
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :name
    column :origin
    column :active
    actions
  end
end
