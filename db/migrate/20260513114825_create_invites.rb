class CreateInvites < ActiveRecord::Migration[7.2]
  def change
    create_table :invites do |t|
      t.string :token
      t.string :email

      t.timestamps
    end
  end
end
