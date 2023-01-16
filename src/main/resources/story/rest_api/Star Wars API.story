
Scenario: first

When I create file with content `viva created file` at path `C:\Users\Dziyana_Zavadskaya\ALL\Vividus\VivTrain\output.txt`
Then `aaa` matches `aaa`

Scenario: second
When I create file with content `viva created file2` at path `C:\Users\Dziyana_Zavadskaya\ALL\Vividus\VivTrain\output2.txt`
Then `aaa2` matches `aaa2`

Scenario: therd
Given I am on a page with the URL 'https://www.google.com/'
Then the page with the URL 'https://www.google.com/' is loaded
