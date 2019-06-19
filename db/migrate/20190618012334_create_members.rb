class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.string :position

      t.timestamps
    end
  end
end
