class RemoveExpireAtFromInvites < ActiveRecord::Migration[7.2]
  def change
    remove_column :invites, :expire_at, :date
  end
end
