Feature: Api Test Senaryosu

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def user_id = '316s7gmalqadz6tzvbgbmv342grm'
    * def token = 'Bearer BQB2WJ2pSR55lpxC5XAQ9EN0U_mfYPsqSldSWJBfilL4fKb-f7O0trMRJkeb3Zy0eg979RNd3GKdnNPjpMGp_hmovOjnEVzJEP6GLT_rnesI8RWIdKw6Q_Cztm_5Z0m7KGaPr0V3jwxg69GwCqyy4v-sTZNKo7XglWAxfSv380w7ix6Jhm-N_I3ovU_FcNvqrf_5GgCoo9eoElFBEJ2ZcQ_BxuwKDSyCXbwKG4Q043J-_tIhjFsX-axgqTWAAFYFc6aLvQLHaQSefQ'
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

  @ignore
  @Get
  Scenario: Get playlist user
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = token
    When method GET


  @ignore
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
   And param q = 'Blinding Lights'
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

