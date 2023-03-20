ActiveAdmin.register User do

  permit_params :manager, :admin, :email, :name, :password, :password_confirmation
  #
  # or
  #
  # permit_params do
  #   permitted = [:manager, :admin, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :name
    column :email
    column :created_at
    # column :encrypted_password
    actions
  end


  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end 
    f.actions
  end
end
