class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.boolean :ongoing_status
      t.boolean :completed_status

      t.timestamps
    end
  end
end
