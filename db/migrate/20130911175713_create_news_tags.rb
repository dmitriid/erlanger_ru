class CreateNewsTags < ActiveRecord::Migration
  def change
    create_table :news_tags do |t|
      t.integer :news_id
      t.integer :tag_id

      t.index :news_id
      t.index :tag_id

      t.timestamps
    end
  end
end
