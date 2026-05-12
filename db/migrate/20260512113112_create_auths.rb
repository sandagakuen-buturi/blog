class CreateAuths < ActiveRecord::Migration[7.2]
  def change
    create_table :auths do |t|
      t.string :name
      t.string :id
      t.string :password_hashed
      t.string :icon
      t.string :email

      t.timestamps
    end
  end
end
