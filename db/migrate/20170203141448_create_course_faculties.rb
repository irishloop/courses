class CreateCourseFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :course_faculties do |t|
      t.integer :course_id
      t.integer :professor_id

      t.timestamps
    end
  end
end
