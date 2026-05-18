class AddExpireAtToInvites < ActiveRecord::Migration[7.2]
  def change
    add_column :invites, :expire_at, :date
  end
end
