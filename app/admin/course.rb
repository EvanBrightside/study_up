ActiveAdmin.register Course do
  menu priority: 1
  permit_params :name, :start_date, student_groups: [:id, :name, :start_date, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :start_date
    column :created_at
    actions
  end

  filter :name
  filter :start_date
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :start_date
    end
    f.actions
  end
end
