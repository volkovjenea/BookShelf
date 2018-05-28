class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :book_id, index: true
      t.integer :author_id, index: true	
      t.timestamps
    end
  end
end
