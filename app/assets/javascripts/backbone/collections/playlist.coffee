class App.Collections.Playlist extends App.Collections.Albums

  isFirstAlbum: (index) ->
    index == 0

  isLastAlbum: (index) ->
    index == (@models.length - 1)
    