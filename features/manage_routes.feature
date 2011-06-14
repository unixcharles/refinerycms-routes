@routes
Feature: Routes
  In order to have routes on my website
  As an administrator
  I want to manage routes

  Background:
    Given I am a logged in refinery user
    And I have no routes

  @routes-list @list
  Scenario: Routes List
   Given I have routes titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of routes
   Then I should see "unique_one"
   And I should see "unique_two"

  @routes-valid @valid
  Scenario: Create Valid Route
    When I go to the list of routes
    And I follow "Add New Route"
    And I fill in "Url" with "a-first-url"
    And I press "Save"
    Then I should see "'a-first-url' was successfully added."
    And I should have 1 route

  @routes-invalid @invalid
  Scenario: Create Invalid Route (without url)
    When I go to the list of routes
    And I follow "Add New Route"
    And I press "Save"
    Then I should see "Url can't be blank"
    And I should have 0 routes

  @routes-edit @edit
  Scenario: Edit Existing Route
    Given I have routes titled "about-us"
    When I go to the list of routes
    And I follow "Edit this route" within ".actions"
    Then I fill in "Url" with "about"
    And I press "Save"
    Then I should see "'about' was successfully updated."
    And I should be on the list of routes
    And I should not see "about-us"

  @routes-duplicate @duplicate
  Scenario: Create Duplicate Route
    Given I only have routes titled uniqueone, uniquetwo
    When I go to the list of routes
    And I follow "Add New Route"
    And I fill in "Url" with "uniqueone"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 routes

  @routes-delete @delete
  Scenario: Delete Route
    Given I only have routes titled uniqueone
    When I go to the list of routes
    And I follow "Remove this route forever"
    Then I should see "'uniqueone' was successfully removed."
    And I should have 0 routes
 