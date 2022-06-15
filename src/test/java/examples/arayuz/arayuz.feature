Feature: Arayüz test senaryosu
  Background:
   * configure driver = { type:'chromedriver' , executable: 'src\\test\\resources\\chromedriver.exe'}
  Scenario:  Arayüz test senaryosu
    Given driver "https://open.spotify.com/"
    * maximize()
    When delay(2000)
    And click('.Button-qlcn5g-0.jvEinx')
    And delay(2000)
    And input("//input[@id='login-username']",'elifnur.yantut@testinium.com')
    And delay(2000)
    And input("//input[@id='login-password']",'Elif.123')
    And click("//p[@class='Type__TypeElement-goli3j-0 dmuHFl sc-hKwDye eKDPqH' and text()='Oturum Aç']")
    And waitFor("//p[@class='Type__TypeElement-goli3j-0 dmuHFl sc-hKwDye eKDPqH' and text()='Oturum Aç']")
    And click("//*[@class='Type__TypeElement-goli3j-0 eHCcSU J4xXuqyaJnnwS6s2p3ZB standalone-ellipsis-one-line']")
    And delay(2000)
    And click("//button[@class='T0anrkk_QA4IAQL29get']")
    And waitFor("//button[@class='T0anrkk_QA4IAQL29get']")
    And click("//span[@class='Type__TypeElement-goli3j-0 ebHsEf ellipsis-one-line PDPsYDh4ntfQE3B4duUI' and text()='Ayrıntıları düzenle']")
    And delay(2000)
    And click("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']")
    And clear("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']")
    And input("//input[@class='f0GjZQZc4c_bKpqdyKbq JaGLdeBa2UaUMBT44vqI']",'MentorLabs Challenge')
    And delay(3000)
    And click("//div[@class='ButtonInner-sc-14ud5tc-0 iebPZv encore-inverted-light-set']")
    And delay(3000)
    And input("//input[@class='Type__TypeElement-goli3j-0 ebHsEf l42JW4EP_5CU1Ba7jYIc']",'Daft Punk')
    And delay(3000)
    And click("button[data-testid=add-to-playlist-button]")
    And delay(2000)

