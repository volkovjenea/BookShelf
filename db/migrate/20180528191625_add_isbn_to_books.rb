class AddIsbnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :isbn, :string, index: true
  end
end
