class CreateHackNews < ActiveRecord::Migration[7.0]
  def change
    create_table :hack_news do |t|
      t.string :en_title
      t.string :cn_title
      t.string :link
      t.datetime :in_time

      t.timestamps
    end
  end
end
