Feature: endtoend senaryosu
  Background:
    * configure driver = { type:'chromedriver' , executable: 'src\\test\\resources\\chromedriver.exe'}
    * def user_id = '316s7gmalqadz6tzvbgbmv342grm'
    * def token = 'Bearer BQAbULwTy5IQ8BYmZfpR2Un0rsgVsOcZLrCZ-SA6J4JtBAH_pGHmjFBnFUGy_2dw8-nFrFg0KiOI6eXP52ptqdCsWvPcyXpNpewAw9_VnFezvMW2oFJubzi5bdaGJDS4gI8LN5XJMY-tvsCz1cVWZ0UYMUwAUFOxoQMRQHp59F56D5abx0tqMPEJW_4vim9_uOClX82KBCs73Cl7maxGqbGN7eYpPDkyCzijJJn77KH6a6dBWoENFSFpRhrl35IDz3T0fVvDNUM7bg'

    * def playlist =
    """
 {
  "name": "Elif",
  "description": "New playlist description",
  "public": false
  }
    """


  Scenario: endtoend senaryosu
    Given driver "https://open.spotify.com/"
    * maximize()
    When delay(2000)
    And click(".Button-qlcn5g-0.jvEinx")
    And delay(2000)
    And input("//input[@id='login-username']",'elifnur.yantut@testinium.com')
    And delay(2000)
    And input("//input[@id='login-password']",'Elif.123')
    And click("//p[@class='Type__TypeElement-goli3j-0 dmuHFl sc-hKwDye eKDPqH' and text()='Oturum Aç']")
    And waitFor("//p[@class='Type__TypeElement-goli3j-0 dmuHFl sc-hKwDye eKDPqH' and text()='Oturum Aç']")
    Given url 'https://api.spotify.com/v1'
    And path '/users/'+user_id+'/playlists'
    And header Authorization = token
    And request playlist
    When method POST
    And refresh()
    And delay(4000)
    And click("//a[@href='/search']")
    And delay(3000)
    And input("//input[@class='Type__TypeElement-goli3j-0 ebHsEf QO9loc33XC50mMRUCIvf']",'The Weeknd')
    And delay(2000)
    And click("//div[@class='Type__TypeElement-goli3j-0 fQToy nk6UgB4GUYNoAcPtAQaG']")
    And delay(2000)
    And click("//button[@class='aAr9nYtPsG7P2LRzciXc']")
    And delay(2000)
    And click("//button[@data-testid='top-bar-back-button']")
    And delay(2000)
    And scroll("//div[@class='iCQtmPqY0QvkumAOuCjr']/div[@class='Type__TypeElement-goli3j-0 fCtMzo t_yrXoUO3qGsJS4Y6iXX standalone-ellipsis-one-line' and text()='Starboy']")
    And delay(2000)
    And click("//button[@class='Fm7C3gdh5Lsc9qSXrQwO tGKwoPuvNBNK3TzCS5OH']")
    And delay(2000)
    And click("//button[@class='odcjv30UQnjaTv4sylc0']")
    And delay(2000)
    And click("//span[@class='Type__TypeElement-goli3j-0 ebHsEf ellipsis-one-line PDPsYDh4ntfQE3B4duUI' and text()='Profil']")
    And delay(2000)
    And click("//span[@class='o4KVKZmeHsoRZ2Ltl078']")
    And delay(2000)
    And click("//input[@id='user-edit-name']")
    And delay(2000)
    And clear("//input[@id='user-edit-name']")
    And delay(2000)
    And input("//input[@id='user-edit-name']",'Elif N.Y')
    And delay(2000)
    And click("//div[@class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And delay(2000)
    And click("//button[@class='odcjv30UQnjaTv4sylc0']")
    And delay(2000)
    And click("//button[@data-testid='user-widget-dropdown-logout']")
    And delay(2000)




