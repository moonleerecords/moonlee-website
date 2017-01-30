ActiveAdmin.register Member do
  menu label: 'Members', parent: 'Other'
  config.sort_order = 'name_asc'
  permit_params :name,
                artist_ids: []

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :artists,
              as: :select,
              multiple: true,
              required: true,
              collection: Artist.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row 'Artist(s)' do
        member.artists.map(&:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :name
    column :artists do |member|
      member.artists.map(&:name).join(', ')
    end
    actions
  end
end
