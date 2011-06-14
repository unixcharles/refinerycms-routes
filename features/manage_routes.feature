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
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @routes-valid @valid
  Scenario: Create Valid Route
    When I go to the list of routes
    And I follow "Add New Route"
    And I fill in "Url" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
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
    Given I have routes titled "A url"
    When I go to the list of routes
    And I follow "Edit this route" within ".actions"
    Then I fill in "Url" with "A different url"
    And I press "Save"
    Then I should see "'A different url' was successfully updated."
    And I should be on the list of routes
    And I should not see "A url"

  @routes-duplicate @duplicate
  Scenario: Create Duplicate Route
    Given I only have routes titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of routes
    And I follow "Add New Route"
    And I fill in "Url" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 routes

  @routes-delete @delete
  Scenario: Delete Route
    Given I only have routes titled UniqueTitleOne
    When I go to the list of routes
    And I follow "Remove this route forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 routes
 