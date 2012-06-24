#= require_self
#= require_tree ./routers
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./models
#= require_tree ./collections


window.App ?= {}
window.App.Routers = {}
window.App.Views = {}
window.App.Models = {}
window.App.Collections = {}

$ ->
  HomeRouter = new App.Routers.HomeRouter()
  Backbone.history.start()