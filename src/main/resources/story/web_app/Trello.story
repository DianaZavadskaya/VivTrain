Lifecycle:
Examples:
/tables/Trello.table

Scenario: initialize variables
Given I initialize STORY variable `invaliduser` with value `invaliduser`
Given I initialize STORY variable `invalidpassword` with value `invalidpassword`
Given I initialize STORY variable `invalidusermessage` with value `There isn't an account for this username`
Given I initialize STORY variable `invalidpasswordmessage` with value `Incorrect email address and / or password. If you recently migrated your Trello account to an Atlassian account, you will need to use your Atlassian account password. Alternatively, you can get help`

Scenario: successful login/ logout
Given I am on the main application page
Then the text 'Log in' exists
When I login with username `<user>` and password `<password>`
When I wait until an element with the tag 'button' and attribute 'data-testid'='header-member-menu-button' appears
Then the page with the URL 'https://trello.com/u/dzx541/boards' is loaded
When I logout

Scenario: failed login with incorrect email
Given I am on the main application page
When I login with username `${invaliduser}` and password `<password>`
Then number of elements found by `By.xpath(//p[@class="error-message"])` is EQUAL_TO `1`
Then the text '${invalidusermessage}' exists
Given I am on the main application page
When I login with username `<user>` and password `${invalidpassword}`
When I wait until an element with the tag 'div' and attribute 'id'='login-error' appears
Then number of elements found by `By.xpath(//div[@id="login-error"])` is EQUAL_TO `1`
Then the text '${invalidpasswordmessage}' exists
