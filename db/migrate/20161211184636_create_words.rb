class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.integer :word_type
      t.string  :name
      t.timestamps null: false
    end
    add_index :words, :word_type
  end
end
