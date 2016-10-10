ActiveAdmin.register Category do
  before_filter only: [:show, :edit, :destroy] do
    @category = Category.friendly.find(params[:id])
  end

  menu priority: 3
  permit_params :name, :description, :image, :image_file_name, :image_content_type,
                :image_file_size, :image_updated_at

  filter :name

  index do
    selectable_column
    column :id
    column :name
    column :description
    image_column :image, style: :thumb
    actions
  end

  form do |f|
    f.inputs 'Create category' do
      f.input :name
      f.input :image, as: :file, hint: f.object.image? ? image_tag(f.object.image.url, width: 200) : ''
      f.input :description
    end
    f.actions
  end

  show do
    h3 category.name

    attributes_table 'Category' do
      row :name
      row :description
      image_row :image, style: :thumb
    end
  end
end
