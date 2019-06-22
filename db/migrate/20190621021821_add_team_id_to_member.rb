class AddTeamIdToMember < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM members;'
    add_reference :members,:team,null: false,index: true
  end

  def down
    remove_reference :members,:team,index: true
  end
end
