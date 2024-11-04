class AddTypeToHackNews < ActiveRecord::Migration[7.0]
  # rails generate migration AddTypeToHackNews type:integer
  def change
    add_column :hack_news, :type, :integer, null: false, default: 0
  end
end
