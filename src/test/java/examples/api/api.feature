Feature: Api Test Senaryosu

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def user_id = '316s7gmalqadz6tzvbgbmv342grm'
    * def token = 'Bearer BQAOvwaEI6ATRRq6JqeAzY7j2GsTeYjXoy1ixpkxbXfVCQWoEo2Q8kEPicZwMyA2X3fMO5RLgjkpWbT_5xdY2M-FreQOKhZwPBFKXBCTRj9xl32oQqikEPn--qkJQi1M9vVy9EhiGRjXiTyGHTGkZcfw5aS5kK69mTxjXhrEWPGTMFUUbSgo1D-7Wl_cGOgRUC8wHMDXE0L9XJDiJ4TVkMTy1GtT3I9BzOiVanRgoClgiYm8ETNxkB4WV-cMUX2i4vBX6ZFixss37tw'
    * def playlist =
    """
 {
  "name": "New Playlist",
  "description": "New playlist description",
  "public": false
  }
    """

    * def track =
    """
  {
  "uris": [
  "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ],
  "position": 0
  }
  """

  @Get
  Scenario: Get playlist user
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = token
    When method GET

   @Create
  Scenario: Create playlist
    Given url 'https://api.spotify.com/v1'
    And path '/users/'+user_id+'/playlists'
    And header Authorization = token
    And request playlist
    When method POST
    And def playlistid = response.id

   @Search
  Scenario: Search song
   Given url 'https://api.spotify.com/v1'
   And path '/search'
   And header Authorization = token
   And param q = 'Bohemian Rhapsody'
   And param type = 'track'
   When method GET

   @Item
  Scenario: Add items to playlist
    * def callresponse = call read('api.feature@Create')
    * def playlist_id = callresponse.playlistid
    Given url 'https://api.spotify.com/v1'
    And path '/playlists/'+playlist_id+'/tracks'
    And header Authorization = token
    And header Content-Type = 'application/json'
    And request track
    When method POST
