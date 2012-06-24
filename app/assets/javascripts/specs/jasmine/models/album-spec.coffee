describe "Album", ->
  albums =
    [
      { "title" : "Album A", "artist" : "Artist A", "tracks" : [{"title" : "Track A", "url" : "/music/Album A Track A.mp3"}, {"title" : "Track B", "url" : "/music/Album A Track B.mp3" } ] },
      {"title" : "Album B", "artist" : "Artist B", "tracks" : [{"title" : "Track A", "url" : "/music/Album B Track A.mp3"}, {"title": "Tracl B", "url" : "/music/Album B Track B.mp3"} ] }
    ]

  model = null

  beforeEach ->
    model = new App.Models.Album()
    model.set albums[0]

  describe "isFirstTrack", ->
    it "returns true if the index argument passed in matches the index of the first track", ->
      expect(model.isFirstTrack(0)).toBeTruthy()

  describe "isLastTrack", ->
    it "returns true if the argument value is the same as the index of the last track", ->
      expect(model.isLastTrack((model.get 'tracks').length)).toBeTruthy()