#
# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :publications
  has_many :authors, through: :publications, source: :author
  has_many :comments, as: :commentable
  validates :title, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "Only letters allowed" }
  validates :description, presence: true
  validates :isbn, presence: true, uniqueness: true, isbn_format: { with: :isbn13, message: "Isbn number incorrect format" }
  has_one_attached :image
  validate :image_validation

  def image_validation
    if image.attached?
      if image.blob.byte_size > 100_000_0
        image.purge
        errors[:base] << 'Image size is too big'
      elsif !image.blob.content_type.starts_with?('image/')
        image.purge
        errors[:base] << 'Wrong image format'
      end
    end
  end

end
