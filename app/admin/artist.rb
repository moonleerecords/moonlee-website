ActiveAdmin.register Artist do
  menu label: 'Artists', priority: 3
  config.sort_order = 'name_asc'
  permit_params :name,
                :description,
                :origin,
                :genre,
                :formed,
                :disbanded,
                :songkick_id,
                :active,
                :booking,
                artist_members_attributes: [
                  :id,
                  :role,
                  :active,
                  :_destroy
                ]

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :origin
      f.input :genre
      f.input :formed
      f.input :disbanded
      f.input :songkick_id, label: 'Songkick artist ID'
      f.input :booking, label: 'Under the Moonlee booking'
      f.input :active, label: 'Actively playing'
      f.has_many :external_links, heading: 'Links', allow_destroy: true do |external_link|
        external_link.input :url_type,
                            as: :select,
                            collection: ExternalLink.allowed_url_types.collect { |type| [translate(type), type] }
        external_link.input :url
      end
      f.has_many :artist_members, heading: 'Members', allow_destroy: true do |artist_member|
        # TODO: possibility to additional members (new ones)
        # TODO: either "add new below dropdown", either redirect to separate page for adding
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
      row :description do
        raw artist.description
      end
      row :origin
      row :genre
      row :formed
      row :disbanded
      row :songkick_id
      row :active
      row :booking
      if artist.external_links.count > 0
        panel 'Links' do
          ul do
            artist.external_links.each do |external_link|
              li linked_icon(external_link)
            end
          end
        end
      end
      if artist.artist_members.active.count > 0
        panel 'Active members' do
          ul do
            artist.artist_members.active.each do |artist_member|
              li do
                "#{artist_member.member.name} - #{artist_member.role}"
              end
            end
          end
        end
      end
      if artist.artist_members.former.count > 0
        panel 'Past members' do
          ul do
            artist.artist_members.former.each do |artist_member|
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
            column :internal_release
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
    column :genre
    column :active
    column :booking
    actions
  end
end
