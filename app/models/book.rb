class Book < ApplicationRecord
	has_many :publications
	has_many :authors, through: :publications, source: :author
	has_many :comments, as: :commentable
end
