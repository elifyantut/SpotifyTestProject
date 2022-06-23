Feature: Api and Ui Senaryosu
  Background:
    * configure driver = { type:'chromedriver' , executable: 'src\\test\\resources\\chromedriver.exe'}
    * def urlHome = 'https://open.spotify.com/'
    * def user_id = '316s7gmalqadz6tzvbgbmv342grm'
    * def s_id = { a :'7FldR5LCgIDhYlaG87NTAx'}
    * def token = 'Bearer BQAbULwTy5IQ8BYmZfpR2Un0rsgVsOcZLrCZ-SA6J4JtBAH_pGHmjFBnFUGy_2dw8-nFrFg0KiOI6eXP52ptqdCsWvPcyXpNpewAw9_VnFezvMW2oFJubzi5bdaGJDS4gI8LN5XJMY-tvsCz1cVWZ0UYMUwAUFOxoQMRQHp59F56D5abx0tqMPEJW_4vim9_uOClX82KBCs73Cl7maxGqbGN7eYpPDkyCzijJJn77KH6a6dBWoENFSFpRhrl35IDz3T0fVvDNUM7bg'
    * def playlist =
    """
 {
  "name": "MentorLabs Faz2",
  "description": "New playlist description",
  "public": false
  }
    """

    * def track =
    """
  {
  "uris": [
  "spotify:track:3MrRksHupTVEQ7YbA0FsZK"
  ],
  "position": 0
  }
  """





  Scenario: elif
      Given driver "https://open.spotify.com/"
      * maximize()
      When delay(2000)
      And click('.Button-qlcn5g-0.jvEinx')
      And delay(2000)
      And input("//input[@id='login-username']",'elifnur.yantut@testinium.com')
      And delay(2000)
      And input("//input[@id='login-password']",'Elif.123')
      And click("//p[@class='Type__TypeElement-goli3j-0 dmuHFl sc-hKwDye eKDPqH' and text()='Oturum Aç']")
      And delay(4000)
      Given url 'https://api.spotify.com/v1'
      And path '/users/'+user_id+'/playlists'
      And header Authorization = token
      And request playlist
      When method POST
      And def p_id = response.id
      And path '/playlists/'+p_id+'/tracks'
      And header Authorization = token
      And header Content-Type = 'application/json'
      And request track
      When method POST
      And refresh()
      And delay(4000)
      And click("//div[@class='AINMAUImkAYJd4ertQxy']")
      And delay(3000)
      And click("//div[@class='ButtonInner-sc-14ud5tc-0 gHYQaG encore-bright-accent-set']")
      And delay(2000)
      And url 'https://api.spotify.com/v1'
      And path 'me/player/currently-playing'
      And header Authorization = token
      And method get
      * def matchsong = karate.jsonPath(response,"$.['item'].['name']")
      And match matchsong == 'The Final Countdown'
      And print 'Song Matched'










