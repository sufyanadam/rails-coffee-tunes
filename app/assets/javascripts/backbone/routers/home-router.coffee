class App.Routers.HomeRouter extends Backbone.Router
  routes:
    "" : "index"
    "*path" : "notFound"

  index: ->
    view = new App.Views.Home.IndexView()
    $('#main').html view.render().el

