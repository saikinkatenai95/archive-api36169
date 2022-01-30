class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.references :category,        null: false, foreign_key: true
      t.text :body,                  null: false
      t.timestamps
    end
  end
end
