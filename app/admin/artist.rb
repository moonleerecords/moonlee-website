ActiveAdmin.register Artist do
  menu label: 'Artists', priority: 2
  permit_params :name,
                :description,
                :origin,
                :genre,
                :formed,
                :disbanded,
                :songkick_artist_id,
                :active,
                :booking

  index do
    selectable_column
    column :name
    column :origin
    column :genre
    column :active
    column :booking
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :origin
      f.input :genre
      f.input :formed
      f.input :disbanded
      f.input :songkick_artist_id, label: 'Songkick artist ID'
      f.input :booking, label: 'Available for booking'
      f.input :active, label: 'Actively playing'
    end
    f.actions
  end
end
