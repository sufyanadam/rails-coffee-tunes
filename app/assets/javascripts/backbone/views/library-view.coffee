class App.Views.LibraryView extends Backbone.View
  tagName: 'section'
  className: 'library'

  template: JST["backbone/templates/library"]

  initialize: =>
    @collection.bind 'reset', @collectionGotReset, @

  collectionGotReset: =>
    console.log 'collection got reset!'
    @render()

  render: =>
    albums = collection = @collection
    @$el.html(@template)
    $albums = @.$ '.albums'
    collection.each (album) =>
      view = new App.Views.LibraryAlbumView(model: album, collection: collection)
      $albums.append(view.render().el)

    @

  

    
    