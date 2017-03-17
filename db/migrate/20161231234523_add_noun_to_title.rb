class AddNounToTitle < ActiveRecord::Migration
  def change
    add_column :titles, :noun, :string
  end
end
