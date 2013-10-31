Feature: Merge Articles
  As a blog administrator
  In order to combine articles on the same topic that say similar things
  I want to be able to merge two articles into one

Background:
  Given the blog is set up
  And I am logged into the admin panel
  And the article Foobar1 is set up with "Lorem ipsum"
  And the article Foobar2 is set up with "Dolor sit amet"
#  And Foobar1 has author "admin1"
#  And Foobar2 has author "admin2"
#  And Foobar1 has comment "consectetur adipisicing elit"
#  And Foobar2 has comment "sed do eiusmod tempor"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
  When I go to the admin page
  And I follow "All Articles"
  And I follow "Edit"
  And I fill in "merge_with" with "2"
  And I press "Merge"
  Then I should be on the admin content page
#  And the title of Foobar1 should be "Foobar1"
#  And the author of Foobar1 should be "admin1"
  When I go to the home page
  Then I should see "Foobar1"
  And I should not see "Foobar2"
  When I follow "Foobar1"
  Then I should see "Lorem ipsum"
  And I should see "Dolor sit amet"
#  And I should see "consectetur adipisicing elit"
#  And I should see "sed do eiusmod tempor"

