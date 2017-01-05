# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Slide do
  menu label: 'Sliders', priority: 5
  config.sort_order = 'position_asc'
  permit_params :title,
                :image,
                :url,
                :position,
                :records,
                :booking,
                :active

  scope 'Records', :on_records, default: true
  scope 'Booking', :on_booking

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :cover,
              as: :file,
              hint: (f.object.image.present? ? image_tag(f.object.image.url(:medium)) : content_tag(:span, ''))
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
        image_tag(slide.image.url(:medium)) if slide.image.present?
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
    column :active
    actions
  end

  collection_action :sort, method: :post do
    params[:slide].each_with_index do |id, index|
      Slide.update(id, position: index + 1)
    end
    render nothing: true
  end
end
