class BroadcastCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "commentable_type:#{comment.commentable_id}:comments", foo: render_comment(comment)
  end

  private

  def render_comment(comment)
    ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
