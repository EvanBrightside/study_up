ActiveAdmin.register Student do
  menu priority: 3
  permit_params :name, :email, :student_group_id

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :student_group
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :student_group_id,
              as: :select,
              include_blank: false,
              collection: StudentGroup.find_each.collect { |u| [u.name, u.id] }
    end
    f.actions
  end

end
