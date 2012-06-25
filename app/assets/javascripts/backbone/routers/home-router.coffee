class App.Routers.HomeRouter extends Backbone.Router
  routes:
    "" : "index"
    "*path" : "notFound"

  initialize: =>
    @library = new App.Collections.Albums()

    @player = new App.Models.Player()
    @playlistView = new App.Views.PlaylistView(collection: @player.playlist, player: @player, library: @library)
    @libraryView = new App.Views.LibraryView(collection: @library)
    @library.fetch()

  index: ->
    $main = $('#main')
    $main.append @playlistView.render().el
    $main.append @libraryView.render().el


#  index: ->
#    $container = $('#contianer')
#    $container.empty()
#    $container.append(@playlistView.render().el)
#    $container.append(@libraryView.render().el)
    
