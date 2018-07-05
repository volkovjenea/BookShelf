class CommentsChannel < ApplicationCable::Channel
  def subscribed(params)
    stop_all_streams
    stream_from "book:#{params['book_id'].to_i}:comments"
  end

  def unsubscribed
    stop_all_streams
  end
end
