class App.Views.AlbumView extends Backbone.View
  template: JST["backbone/templates/album"]

  tagName: 'li'

  className: 'album'

  initialize: =>
    @model.bind 'change', @render, @

  render: ->
    renderedContent = @template(model: @model)
    $(@el).html(renderedContent)
    @

