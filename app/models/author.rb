class Author < ApplicationRecord
	has_many :publications
	has_many :books, through: :publications
	has_many :comments, as: :commentable
end
