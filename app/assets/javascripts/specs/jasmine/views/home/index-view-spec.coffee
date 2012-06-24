describe "Home index view", ->
  it "displays 'hello world' ", ->
    view = new App.Views.Home.IndexView()
    view.render()
    expect(view.$el.html()).toContain 'Hello'