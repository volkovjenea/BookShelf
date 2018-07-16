class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "commentable_type:#{params['book_id'].to_i}:comments"
  end

  def unsubscribed

  end

  def speak(data)
    Comment.create text: data['comment']
  end
end
