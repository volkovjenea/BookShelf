#
# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :publications
  has_many :books, through: :publications
  has_many :comments, as: :commentable
  validates :name, presence: true
  validates :bio, presence: true
  has_one_attached :image
end
