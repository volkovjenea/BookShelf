#
# frozen_string_literal: true

class AddNameAndBioToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :name, :string
    add_column :authors, :bio, :text
  end
end
