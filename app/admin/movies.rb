ActiveAdmin.register Movie do

  index do
    selectable_column
    id_column
    column :image do |movie|
      image_tag movie.image_url(:thumb) if movie.image
    end
    column :title
    column :description
    column :category

    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :title
      f.input :description
      f.input :image, as: :file
    end

    f.actions
  end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :category_id, :title, :description, :image

  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :title, :description, :image_data]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
