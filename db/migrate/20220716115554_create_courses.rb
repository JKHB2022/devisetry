class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.boolean :ongoing_status, default: true
      t.boolean :completed_status, default: false

      t.timestamps
    end
  end
end
