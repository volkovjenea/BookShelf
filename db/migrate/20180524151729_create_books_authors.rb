class CreateBooksAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :books_authors do |t|
      
      t.timestamps
    end
  end
end
