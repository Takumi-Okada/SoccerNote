class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.date :play_date
      t.string :contents
      t.string :good
      t.string :bad
      t.string :goal
      t.string :commenter
      t.string :comment

      t.timestamps
    end
  end
end
