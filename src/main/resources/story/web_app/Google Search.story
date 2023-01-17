
Scenario: first
Given I am on a page with the URL 'https://www.google.com/'
Then the page with the URL 'https://www.google.com/' is loaded

Scenario: - second
Given I am on a page with the URL 'https://www.google.com/'
Then the page with the URL 'https://www.google2.com/' is loaded
