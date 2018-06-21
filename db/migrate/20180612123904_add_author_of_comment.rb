#
# frozen_string_literal: true

class AddAuthorOfComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :name, :string, index: true
  end
end
