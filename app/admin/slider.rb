ActiveAdmin.register Slider do
  menu label: 'Sliders', priority: 5
  config.sort_order = 'position_asc'
  permit_params :title,
                :image,
                :url,
                :position,
                :records,
                :booking,
                :active

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:small))
      f.input :url
      f.input :position
      f.input :records
      f.input :booking
      f.input :active
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :image do
        image_tag(slider.image.url(:small))
      end
      row :url
      row :position
      row :records
      row :booking
      row :active
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :title
    column :url
    column :records
    column :booking
    column :active
    actions
  end

  collection_action :sort, method: :post do
    params[:slider].each_with_index do |id, index|
      Slider.update(id, { position: index+1 })
    end
    render nothing: true
  end
end
