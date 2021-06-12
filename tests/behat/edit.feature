@qtype @qtype_wq @qtype_multichoicewiris @qtype_multichoicewiris_edit
Feature: Test editing a Match wiris question
  As a teacher
  In order to be able to update my match wiris question
  I need to edit them

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | T1        | Teacher1 | teacher1@example.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
    And the following "question categories" exist:
      | contextlevel | reference | name           |
      | Course       | C1        | Test questions |
    And the following "questions" exist:
      | questioncategory | qtype      | name                        | template |
      | Test questions   | matchwiris | match-wiris-001 for editing | foursubq |
    And I log in as "teacher1"
    And I am on "Course 1" course homepage
    And I navigate to "Question bank" in current page administration

  @javascript @_switch_window
  Scenario: Edit a match wiris question
    When I choose "Edit question" action for "match-wiris-001" in the question bank
    And I set the following fields to these values:
      | Question name | |
    And I press "id_submitbutton"
    Then I should see "You must supply a value here."
    When I set the following fields to these values:
      | Question name | Edited match-wiris-001 name |
    And I press "id_submitbutton"
    Then I should see "Edited match-wiris-001 name"
    When I choose "Edit question" action for "Edited match-wiris-001" in the question bank
    And I press "Blanks for 3 more questions"
    Then I set the following fields to these values:      
      | id_subquestions_4 | Five |
      | id_subanswers_4   | 5   |
    Then I press "id_submitbutton"   
    Then I should see "Edited match-wiris-001 name"
    When I choose "Preview" action for "Edited match-wiris-001" in the question bank
    And I switch to "questionpreview" window
    And I should see "Match the numbers."
