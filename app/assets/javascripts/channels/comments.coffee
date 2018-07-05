App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $('#comments')

  connected: ->
    setTimeout =>
      @followCurrentBook()
    ,    1000

  disconnected: ->


  followCurrentArticle: ->
    bookId = @collection().data('book-id')
    if bookId
      @perform 'follow', book_id: bookId
    else
      @perform 'unfollow'

  received: (data) ->
    @collection().append(data['comment'])

  speak: ->
    @perform 'speak'
