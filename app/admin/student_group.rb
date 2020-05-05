ActiveAdmin.register StudentGroup do
  menu priority: 2
  permit_params :name, :course_id,
                student: [:id, :name, :email, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :course
    column :created_at
    actions
  end

  filter :name
  filter :course
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :course_id,
              as: :select,
              include_blank: false,
              collection: Course.find_each.collect { |u| [u.name, u.id] }
    end
    f.actions
  end

end
