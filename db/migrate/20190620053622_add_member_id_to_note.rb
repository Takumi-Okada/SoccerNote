class AddMemberIdToNote < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM notes;'
    add_reference :notes,:member,null: false,index: true
  end

  def down
    remove_reference :notes,:member,index: true
  end
end
