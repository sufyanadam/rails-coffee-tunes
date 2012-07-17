class App.Models.Player extends Backbone.Model

  defaults:
    currentAlbumIndex: 0
    currentTrackIndex: 0
    state            : 'stop'


  initialize: =>
    @playlist = new App.Collections.Playlist()

  reset: =>
    @set currentAlbumIndex: 0, currentTrackIndex: 0, state: 'stop'

  play: =>
    @set state: 'play'
    @trigger 'change:currentTrackIndex'
    @logCurrentAlbumAndTrack()

  pause: =>
    @set state: 'pause'

  currentlyPlaying: =>
    (@get 'state') == 'play'

  currentlyStopped: =>
    not @currentlyPlaying()

  currentAlbum: =>
    @playlist.at(@get('currentAlbumIndex'))

  currentTrackUrl: =>
    album = @currentAlbum()

    if album
      album.trackUrlAtIndex(@get 'currentTrackIndex')
    else
      null

  nextTrack: =>
    currentTrackIndex = @get 'currentTrackIndex'
    currentAlbumIndex = @get 'currentAlbumIndex'


    if @currentAlbum().isLastTrack(currentTrackIndex)
      if @playlist.isLastAlbum(currentAlbumIndex)
        @set currentAlbumIndex: 0
        @set currentTrackIndex: 0
      else
        @set currentAlbumIndex: currentAlbumIndex + 1
        @set currentTrackIndex: 0
    else
      @set currentTrackIndex: currentTrackIndex + 1

    @logCurrentAlbumAndTrack()

  previousTrack: =>
    currentTrackIndex = @get 'currentTrackIndex'
    currentAlbumIndex = @get 'currentAlbumIndex'
    lastmodelIndex = 0;

    if (@currentAlbum().isFirstTrack(currentTrackIndex))
      if (@playlist.isFirstAlbum(currentAlbumIndex))
        lastmodelIndex = @playlist.models.length - 1
        @set currentAlbumIndex: lastmodelIndex
      else
        @set currentAlbumIndex: currentAlbumIndex - 1

        lastTrackIndex = @currentAlbum().get('tracks').length - 1
        @set currentTrackIndex: lastTrackIndex
    else
      @set currentTrackIndex: currentTrackIndex - 1

    @logCurrentAlbumAndTrack()

  logCurrentAlbumAndTrack: =>
    console.log "Player #{@get 'currentAlbumIndex'}: #{@get 'currentTrackIndex'}#{@}"