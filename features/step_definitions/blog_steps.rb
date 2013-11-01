Given /I am not an admin/ do
  User.create!({login: 'qbert',
                password: 'qbert',
                email: 'q@bert.com',
                profile_id: 2,
                name: 'qbert',
                state: 'active'})
  visit '/accounts/login'
  fill_in 'user_login', with: 'qbert'
  fill_in 'user_password', with: 'qbert'
  click_button 'Login'
end

Given /the article (.*) is set up with "(.*)"/ do |title, content|
  step %Q{I go to the new article page}
  step %Q{I fill in "article_title" with "#{title}"}
  step %Q{I fill in "article__body_and_extended_editor" with "#{content}"}
  step %Q{I press "Publish"}
end

Given /(.*) has author "(.*)"/ do |article, author|
  a = Article.find_by_name(article)
  u = User.new(firstname: author)
  a.user = u
end

Given /(.*) has comment "(.*)"/ do |article, content|
  a = Article.find_by_name(article)
  c = Comment.new(article: a, body: content, author: "user1")
end

When /I follow the "(.*)" link for "(.*)"/ do |linkname, article|
  with_scope("/tr[td[a[text() = '#{article}']]]") {click_link "#{linkname}"}
end

Then /the title of (.*) should be "(.*)"/ do |article, title|
  Article.find_by_name(article).title.should == title
end

Then /the author of (.*) should be "(.*)"/ do |article, name|
  Article.find_by_name(article).user.firstname.should == name
end
