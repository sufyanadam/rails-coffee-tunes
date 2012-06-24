App.Views.Home ?= {}

class App.Views.Home.IndexView extends Backbone.View
  template: JST["backbone/templates/home/index"]

  render: ->
    @$el.html @template()
    @
