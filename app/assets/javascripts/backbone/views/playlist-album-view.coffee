class App.Views.PlaylistAlbumView extends App.Views.AlbumView

  events:
    'click .queue.remove' : 'removeFromPlaylist'

  initialize: =>
    @player = @options.player
    @model = @options.model

    @player.bind 'change:state', @updateState, @
    @player.bind 'change:currentTrackIndex', @updateTrack, @

    @model.bind 'remove', @remove, @

  render: =>
    $(@el).html @template model: @model
    @updateTrack()
    @

  updateState: =>
    isAlbumCurrent = @player.currentAlbum() == @model

    $(@el).toggleClass 'current', isAlbumCurrent

  updateTrack: =>
     isAlbumCurrent = @player.currentAlbum() == @model

     if (isAlbumCurrent)
       currentTrackIndex = @player.get 'currentTrackIndex'

       @$("li").each (index, el) ->
         $(el).toggleClass('current', index == currentTrackIndex)

       @updateState()


  removeFromPlaylist: =>
     @options.playlist.remove(@model)
     @player.reset()
