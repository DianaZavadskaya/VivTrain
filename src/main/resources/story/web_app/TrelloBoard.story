Lifecycle:
Examples:
/tables/Trello.table

Scenario: initialize variables
Given I initialize STORY variable `BoardTitle` with value `Title of Board`
Given I initialize STORY variable `BoardPageTitle` with value `${BoardTitle} | Trello`
Given I initialize STORY variable `BoardPageUrl` with value `title-of-board`
Given I initialize STORY variable `ListTitle` with value `List`

Scenario: Log in
Given I am on the main application page
When I login with username `<user>` and password `<password>`

Scenario: create Board
When I create board with `${BoardTitle}`, '${BoardPageTitle}', '${BoardPageUrl}'

Scenario: add list
When I wait until element located by `By.xpath(//*[@class="open-add-list js-open-add-list"])` appears
When I click on element located by `By.xpath(//*[@class="open-add-list js-open-add-list"]/*[@class="placeholder"])`
When I wait until element located by `By.xpath(//*[@class="list-name-input"])` appears
When I enter `${ListTitle}` in field located by `By.xpath(//*[@class="list-name-input"])`
When I click on element located by `By.xpath(//*[@class="nch-button nch-button--primary mod-list-add-button js-save-edit"])`

Scenario: add card
When I click on element located by `By.xpath(//*[*[text()="${ListTitle}"]]//*[@class="list-header-extras-menu dark-hover js-open-list-menu icon-sm icon-overflow-menu-horizontal"])`
When I wait until element located by `By.xpath(//*[@class='js-add-card'])` appears
When I click on element located by `By.xpath(//*[@class='js-add-card'])`
When I wait until element located by `By.xpath(//*[@class="card-composer"])` appears
When I enter `<cardtext>` in field located by `By.xpath(//*[@class="list-card-composer-textarea js-card-title"])`
When I click on element located by `By.xpath(//*[@class="nch-button nch-button--primary confirm mod-compact js-add-card"])`
Then number of elements found by `By.xpath(//*[@class="list-card-details js-card-details"]//*[text()="<cardtext>"])` is EQUAL_TO `1`
Examples:
|cardtext|
|#{generate(regexify '[a-z]{3} [a-z]{2} [a-z]{7} [a-z]{13}')}|
|#{generate(regexify '[a-z]{9} [a-z]{1}, [a-z]{3} [a-z]{9}')}|

Scenario: visual check
When I COMPARE_AGAINST baseline with name `BoardWithIgnoredCards2` ignoring:
|ELEMENT                                                |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//span[@class="list-card-title js-card-name"])|1                         |

Scenario: delete board
When I delete board with `${BoardTitle}`

Scenario: logout
When I logout
