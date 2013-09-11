class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :country
      t.string :city
      t.string :url
      t.string :info

      t.timestamps
    end
  end
end
