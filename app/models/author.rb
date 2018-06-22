#
# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :publications
  has_many :books, through: :publications
  has_many :comments, as: :commentable
  validates(
    :name,
    presence: true,
    format:{
      with: /\A[a-zA-Z]+\z/,
      message: "Only letters allowed"
    }
  )
  validates :bio, presence: true
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
