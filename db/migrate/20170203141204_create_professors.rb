class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :lastname
      t.string :firstname
      t.string :status

      t.timestamps
    end
  end
end
