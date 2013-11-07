Feature: Create and edit categories
  As a blog administrator
  In order to categorize articles
  I want to be able to create and edit categories that articles can be classified as

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And I go to the category page

Scenario: Create new category
  When I fill in "category_name" with "Random"
  And I press "Save"
  Then I should see "Random no articles"

Scenario: Edit a category
  Then I should see "General"
  When I follow "Edit"
  And I fill in "category_name" with "Stuff"
  And I press "Save"
  Then I should see "Stuff"
  And I should not see "General"
