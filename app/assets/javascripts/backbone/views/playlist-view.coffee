class App.Views.PlaylistView extends Backbone.View
  template: JST["backbone/templates/playlist"]

  tagName: 'section'
  className: 'playlist'

  events:
    'click .play' : 'play'
    'click .pause' : 'pause'
    'click .next' : 'nextTrack'
    'click .prev' : 'previousTrack'

  initialize: =>
    @collection.bind 'add', @renderAlbum, @

    @player = @options.player
    @player.bind 'change:state', @updateState, @
    @player.bind 'change:currentTrackIndex', @updateTrack, @

    @createAudio()

    @library = @options.library
    @library.bind 'select', @queueAlbum, @

  createAudio: =>
    @audio = new Audio()

  render: =>
    @$el.html @template @player.toJSON()

    @.$('button.play').toggle(@player.currentlyStopped())
    @.$('button.pause').toggle(@player.currentlyPlaying())

    @

  renderAlbum: (album) =>
    console.log 'rendering album!'
    view = new App.Views.PlaylistAlbumView( model: album, player: @player, playlist: @collection)

    @$('ul').append(view.render().el)

  updateState: =>
    @updateTrack()
    @$('button.play').toggle(@player.currentlyStopped())
    @$('button.pause').toggle(@player.currentlyPlaying())

  updateTrack: =>
    @audio.src = @player.currentTrackUrl()

    if (@player.get('state') == 'play' )
      @audio.play()
    else
      @audio.pause()

  queueAlbum: (album) =>
    console.log 'trying to queue!'
    console.log 'the album i was given', album
    @collection.add(album)

  play: =>
    @player.play()

  pause: =>
    @player.pause()

  nextTrack: =>
    @player.nextTrack()

  previousTrack: =>
    @player.previousTrack()