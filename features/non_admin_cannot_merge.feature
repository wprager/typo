Feature: Merging articles can only be done by admins
  As an ordinary blog user
  In order to not overstep my power as a non-admin
  I want to not be able to merge articles

Background:
  Given the blog is set up

Scenario: A non-admin cannot merge two articles
  Given I am not an admin
  When I go to the admin page
  And I follow "All Articles"
  And I follow "Edit"
  Then I should not see "Merge"

