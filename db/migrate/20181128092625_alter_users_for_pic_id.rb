class AlterUsersForPicId < ActiveRecord::Migration[5.1]
  def change
    add_column :users,:prof_pic_id, :integer
  end
end
