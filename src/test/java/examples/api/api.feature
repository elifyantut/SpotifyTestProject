Feature: Api Test Senaryosu

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def user_id = '316s7gmalqadz6tzvbgbmv342grm'
    * def token = 'Bearer BQCxWke9qgbcx7lhvhgSibR9WJwO7pHXl9DjO15G8VqcUABJF5_L7hrfCgPHi7lAvYSOhIEg1Qqh3pV6sKFlWIFWdad7V5U-a4Vt7srX8mrXx-Kv4G94gslyaTN3j1Ou9PodlfrYvVAerGnk1GJy-uLjZYfvdrRONVbC8XkYlymCKVEIJZgu5DUQNWGj9up8yK_W1YveXNpZsLK14y9Z9_ciW7nda55I3UcWYnrER8LFUrvG6yOL5bqsECVD00aphqcqZs0I5sGvE58'
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
