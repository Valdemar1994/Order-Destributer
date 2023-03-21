ActiveAdmin.register User do

  permit_params :manager, :distributor, :email, :name, :password, :password_confirmation

  index do
    id_column
    column :name
    column :email
    column :created_at
    column :manager
    column :distributor
    actions
  end

  filter :name
  filter :manager
  filter :distributor
  filter :created_at
  
  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.inputs 'Role' do
        f.input :manager
        f.input :distributor
      end
    end 
    f.actions
  end
end
