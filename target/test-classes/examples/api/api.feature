Feature: Api Test Senaryosu

  Background:
    * def urlHome = 'https://open.spotify.com/'
    * def userid = '316s7gmalqadz6tzvbgbmv342grm'
    * def playlist_id = '6mTvZb4397Rke74kffF4TS'
    * def requestbody =
    """
 {
  "name": "New Playlist",
  "description": "New playlist description",
  "public": false
  }
    """
    * def requestbody2 =
    """
  {
  "uris": [
  "spotify:track:4u7EnebtmKWzUH433cf5Qv"
  ],
  "position": 0
  }
  """


  Scenario: Get playlist user
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = 'Bearer BQAFaQvxwjQi0MdesBFmUteasubpc3lE2NTklKejS8davm5YwPjJKmhWLFUitmb8are5Q9pfH2WFzfGOTOXpvRjeQREmiOqfOmkwFQ9NlgKfncOxekcq91KqiBtn5PkjNcMeKoBpAPv60yohcbt-SkpEwpnkm_awVTWIxjjlpDfhcytKNb88wtjoEQ5EPcrQctx3jS1lTiLEvOQluO4gTuwz95nOKp9yq07Tc47o79G6a6uPJZU7_N0nZce1mUjvGujShWDmMGgoDWA'
    When method GET

  Scenario: Create Playlist
    Given url 'https://api.spotify.com/v1'
    And path '/users/'+userid+'/playlists'
    And header Authorization = 'Bearer BQAFaQvxwjQi0MdesBFmUteasubpc3lE2NTklKejS8davm5YwPjJKmhWLFUitmb8are5Q9pfH2WFzfGOTOXpvRjeQREmiOqfOmkwFQ9NlgKfncOxekcq91KqiBtn5PkjNcMeKoBpAPv60yohcbt-SkpEwpnkm_awVTWIxjjlpDfhcytKNb88wtjoEQ5EPcrQctx3jS1lTiLEvOQluO4gTuwz95nOKp9yq07Tc47o79G6a6uPJZU7_N0nZce1mUjvGujShWDmMGgoDWA'
    And request requestbody
    When method post

 Scenario: Search song
   Given url 'https://api.spotify.com/v1'
   And path '/search'
   And header Authorization = 'Bearer BQCSYcqovIM5u-RTAz_UMtVRjEtiWVcYghhSOYW6tZBYWmh7tmqmSjrXYnGwXdB5Lt_y12AbHlUWlPRYo6pFXUrG6ek8TTjOtY52-p_2IwyOtbG4AI9BsHJ9yqg3fNU0fHN_55r1MzPckeLlNa1fFJUsI9oxhJgxFtgVZMTAqmkkejeHSE9PpT0wpAy_o4pkettLDPk0TJHF_lNJta3bkjcTz5fq5OYJlKILBwJkeaG-4RBqp-k3Lb3gono18MOlL0z0wjQA_sKWGMo'
   And param q = 'Bohemian Rhapsody'
   And param type = 'track'
   When method GET

 Scenario: Add items to playlist
   Given url 'https://api.spotify.com/v1'
   And path '/playlists/'+playlist_id+'/tracks'
   And header Authorization = 'Bearer BQBt2Up5b5OP5M7UScCdl8cvDfpMzTB6-Cf_D9lH-ay6Qm8sEtny8GKJPLdP3rqVebFvSIwKFRtAdNzMsY_VjSHX29jZbIevJgPw3PRIbbv0HAV0ZKjGvNRaHA9mtpJpP6CPJwt5SkhX3_nFUg4vFVElHM3J2n_hS6TvWo0J9PhT6X8hvxBAdZ2U7k_DuqlX-g74b9zs3iHj3VJoaSr8r7KxPRqKwbR0d-UzovHDJxowWTVug1ZxtMB0wDpm95MbMcHgfnp3sOG-Zfw'
   And header Content-Type = 'application/json'
   And request requestbody2
   When method post
