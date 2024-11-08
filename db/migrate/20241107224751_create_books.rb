class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :synopsis
      t.date :published_at

      t.timestamps
    end
  end
end
