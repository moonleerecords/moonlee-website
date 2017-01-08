# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Post do
  menu label: 'News', priority: 2
  config.sort_order = 'published_at_desc'
  permit_params :title,
                :youtube_video,
                :image,
                :body,
                :visibility,
                :records,
                :booking,
                :published_at,
                :tags_raw,
                { categories: [] }

  scope 'Records', :on_records, default: true
  scope 'Booking', :on_booking
  scope 'Hidden', :hidden

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :image,
              as: :file,
              hint: (f.object.image.present? ? image_tag(f.object.image.url(:medium)) : content_tag(:span, ''))
      f.input :youtube_video
      f.input :categories,
              multiple: true,
              as: :check_boxes,
              collection: Post.available_categories.collect { |category| [translate(category), category] }
      f.input :body, as: :ckeditor
      f.input :published_at,
              as: :date_time_picker,
              picker_options: {
                format: 'd.m.Y H:i',
                step: 30,
                value: (f.object.published_at.present? ? localize(f.object.published_at) : 'now')
              }
      f.input :visibility,
              as: :select,
              collection: Post.visibility_options.collect { |option| [translate(option), option] }
      f.input :tags_raw, label: 'Tags', as: :tags
      f.input :records,
              label: 'Publish at Records', as: :boolean
      f.input :booking, label: 'Publish at Booking', as: :boolean
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :youtube_video
      row :image do
        image_tag(post.image.url(:medium)) if post.image.present?
      end
      row :body do
        # rubocop:disable Rails/OutputSafety
        post.body.html_safe
      end
      row :visibility do
        translate(post.visibility)
      end
      row :records
      row :booking
      row :published_at do
        localize(post.published_at)
      end
      row :tags do
        post.tags_raw
      end
      row :categories do
        post.categories.map { |category| translate(category) }.join(', ')
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    column :title do |post|
      truncate(post.title, length: 60, separator: '...')
    end
    column :visibility do |post|
      translate(post.visibility)
    end
    column :published_at do |post|
      localize(post.published_at)
    end
    column :categories do |post|
      post.categories.map { |category| translate(category) }.join(', ')
    end
    column :tags do |post|
      post.tags.join(', ')
    end
    actions
  end
end
