class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :intro
      t.string :body
      t.integer :created_by

      t.timestamps
    end
  end
end
