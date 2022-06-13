Feature: login
  Background:
   * configure driver = { type:'chromedriver' , executable: 'src\\test\\resources\\chromedriver.exe'}
  Scenario:  spotify login
    Given driver "https://open.spotify.com/"
    When  click ("//button[@class='Button-qlcn5g-0 jvEinx']")
    Then match driver.url == 'https://accounts.spotify.com/tr/login?continue=https%3A%2F%2Fopen.spotify.com%2F'