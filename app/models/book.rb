class Book < ApplicationRecord
	has_many :authors, through: :books_authors
end
