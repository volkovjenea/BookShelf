#
# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :publications
  has_many :authors, through: :publications, source: :author
  has_many :comments, as: :commentable
  validates :title, presence: true
  validates :description, presence: true
  validates :isbn, presence: true, uniqueness: true
end
