class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :num
      t.string :title
      t.boolean :required
      t.integer :professor_id
      t.integer :category_id

      t.timestamps
    end
  end
end
