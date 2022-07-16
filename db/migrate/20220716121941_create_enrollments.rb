class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :ongoing_status
      t.boolean :completed_status


      t.timestamps
    end
  end
end
