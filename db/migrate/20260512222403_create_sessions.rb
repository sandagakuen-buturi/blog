class CreateSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :sessions do |t|
      t.string :user
      t.string :key
      t.date :expire_at

      t.timestamps
    end
  end
end
