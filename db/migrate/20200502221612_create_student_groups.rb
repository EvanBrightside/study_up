class CreateStudentGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :student_groups do |t|
      t.string      :name
      t.references  :course

      t.timestamps
    end
  end
end
