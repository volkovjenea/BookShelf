#
# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true
  after_create_commit { BroadcastCommentJob.perform_later self }
end
