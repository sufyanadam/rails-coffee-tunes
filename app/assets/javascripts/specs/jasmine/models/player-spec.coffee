describe "Player", ->
  player = null

  beforeEach ->
    player = new App.Models.Player()
    
  describe "play", ->
    it "sets the player state to 'play'", ->
      expect(player.get 'state').toEqual 'stop'
      player.play()
      expect(player.get 'state').toEqual 'play'
      
  describe "pause", ->
    it "sets the player state to 'pause'", ->
      expect(player.get 'state').toEqual 'stop'
      player.pause()
      expect(player.get 'state').toEqual 'pause'

  describe "currentlyPlaying", ->
    it "returns true if the current player state is 'play'", ->
      expect(player.currentlyPlaying()).toBeFalsy()

      player.play()
      expect(player.currentlyPlaying()).toBeTruthy()

  describe "currentlyStopped", ->
    it "returns true if the current player state is not 'play'", ->
      expect(player.currentlyStopped()).toBeTruthy()

      player.play()
      expect(player.currentlyStopped()).toBeFalsy()

  # describe "current album", ->
  #   it "returns the index of the current album", ->
     