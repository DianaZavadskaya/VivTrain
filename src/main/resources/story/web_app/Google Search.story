Description: Test one

Scenario: first
Given I am on a page with the URL 'https://www.google.com/'
Then the page with the URL 'https://www.google.com/' is loaded


Scenario: second
Given I am on a page with the URL 'https://www.deepl.com/translator'
Then the page with the URL 'https://www.deepl.com/translator' is loaded
Then the text 'DeepL Pro' exists



Scenario:  Third
Given I am on a page with the URL 'https://www.google.com/'
Then the page with the URL 'https://www.google_fail.com/' is loaded
