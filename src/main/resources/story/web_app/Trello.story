Lifecycle:
Examples:
/tables/Trello.table

Scenario: initialize variables
Given I initialize STORY variable `invaliduser` with value `invaliduser`
Given I initialize STORY variable `invalidpassword` with value `invalidpassword`
Given I initialize STORY variable `invalidusermessage` with value `There isn't an account for this username`
Given I initialize STORY variable `invalidpasswordmessage` with value `Incorrect email address and / or password. If you recently migrated your Trello account to an Atlassian account, you will need to use your Atlassian account password. Alternatively, you can get help`

Scenario: successful login/ logout
Given I am on a page with the URL 'https://trello.com/'
Then the text 'Log in' exists
When I login with correct user
When I logout

Scenario: failed login with incorrect email
Given I am on a page with the URL 'https://trello.com/home'
When I click on element located by `By.xpath(//a[text()="Log in"])`
When I enter `${invaliduser}` in field located `By.xpath(//input[@id="user"])`
When I click on element located by `By.xpath(//input[@id="login"])`
When I enter `${invalidpassword}` in field located by `By.xpath(//input[@id="password"])`
When I click on element located by `By.xpath(//input[@id="login"])`
Then number of elements found by `By.xpath(//p[@class="error-message"])` is EQUAL_TO `1`
Then the text '${invalidusermessage}' exists
Given I am on a page with the URL 'https://trello.com/'
When I click on element located by `By.xpath(//a[text()="Log in"])`
When I enter `zavadskayadziyana2@gmail.com` in field located `By.xpath(//input[@id="user"])`
When I click on element located by `By.xpath(//input[@id="login"])`
When I wait until an element with the tag 'input' and attribute 'id'='password' appears
Then number of elements found by `By.xpath(//input[@id="password"])` is EQUAL_TO `1`
Then number of elements found by `By.xpath(//button[@id="login-submit"])` is EQUAL_TO `1`
When I enter `${incorrectpassword}` in field located by `By.xpath(//input[@id="password"])`
When I click on element located by `By.xpath(//button[@id="login-submit"])`
When I wait until an element with the tag 'div' and attribute 'id'='login-error' appears
Then number of elements found by `By.xpath(//div[@id="login-error"])` is EQUAL_TO `1`
Then the text '${invalidpasswordmessage}' exists
