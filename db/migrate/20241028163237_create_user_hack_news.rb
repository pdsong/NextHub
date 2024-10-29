class CreateUserHackNews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_hack_news do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hack_news, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_hack_news, [:user_id, :hack_news_id], unique: true
  end
end
