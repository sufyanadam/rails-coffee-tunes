class App.Views.LibraryAlbumView extends App.Views.AlbumView

  events:
    'click .queue.add' : 'select'

  select: =>
    @collection.trigger 'select', @model