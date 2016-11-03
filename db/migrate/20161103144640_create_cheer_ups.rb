class CreateCheerUps < ActiveRecord::Migration[5.0]
  def change
    create_table :cheer_ups do |t|
      t.string :title
      t.text :content
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
