App.Views.Home ?= {}

class App.Views.Home.IndexView extends Backbone.View
  template: JST["backbone/templates/home/index"]

  render: ->
    console.log 'home view', @template()
    @$el.html @template()
    @
