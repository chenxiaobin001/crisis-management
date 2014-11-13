#---------------------- EditContent.feature starts from here-------------------

Given(/^I'm a user with write permission$/) do
  visit '/document/writeable'
  assert page.has_text?('Writeable user')
end

When(/^I'm on the page displaying an edit frame of a file$/) do
  assert page.has_css?('div.field_with_editor')
end

Then(/^I should be able to change the content of the file$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a save button, a discard button and a quit button$/) do
  assert page.has_css?('button')
  assert find(:text, 'Save')
  assert find(:text, 'Cancel')
  assert find(:text, 'Quit')
end

When(/^I hit save button$/) do
  click_button('Save')
end

Then(/^I should see the file is temporarily saved$/) do
  assert page.has_content?('File is temporarily saved.')
end

Then(/^I should see a link containing the email address of an admin$/) do
  assert page.has_css?('href')
  assert page.has_content?('mailto:')
end

Then(/^I should be asked to write an email to an administrator$/) do
  assert page.has_content?('Please contact admin for review of change.')
end

When(/^I hit cancel button$/) do
  click_button('Cancel')
end

Then(/^I should see the modification discarded$/) do
  assert page.has_content?('Modification is cancelled.')
end

When(/^I hit quit button$/) do
  click_button('Quit')
  visit '/homepage'
end

Then(/^I should see the file content viewing page$/) do
  assert page.has_content?('/[pdf||document]/')
end

Given(/^I'm an administrator$/) do
  visit '/document/admin'
  assert page.has_text?('Admin user')
end

Then(/^I should see the file is saved$/) do
  assert page.has_content?('File is saved.')
end

#---------------------- HompageDisplay.feature starts from here-------------------

Given(/^I'm a user with read\-only permission$/) do
  visit '/document/readonly'
  assert page.has_text?('Readonly user')
end

When(/^I'm on the homepage$/) do
  visit '/user/homepage'
end

Then(/^I should see lists of file links, open buttons$/) do
  assert page.has_css?('div.links')
  assert page.has_content?('open')
  assert page.has_content?('page 1')
end

Then(/^I should see a navigation bar$/) do
  assert page.has_css?('button.navigation')
end

Then(/^I should see a search bar$/) do
  assert page.has_css?('input.search')
  assert page.has_css?('button.search')
end

When(/^I hit the link or the open button of a file$/) do
  click_link '/(.*)pdf(.*)/'
  click_button 'open'
end

Then(/^I should see a new page displaying the content of the file$/) do
  assert page.has_content?('/[pdf||document]/')
end

When(/^I hit the buttons on the navigation bar$/) do
  visit '/user/homepage'
  click_button ('next page')
end

Then(/^I should see different parts of the whole list of file$/) do
  assert page.has_content?('page 1')
end

When(/^I hit search and enter something$/) do
  visit '/user/homepage'
  fill_in('document', :with => 'document1')
  click_button 'search'
end

Then(/^I should see relative results on the page$/) do
  assert page.has_content?('result')
  assert page.has_css?('ul li');
end

Given(/^I'm an editor with write permission$/) do
  visit '/user/homepage'
  assert locate('authority#level').value == 1;
end

Then(/^I should see lists of file links, open and edit buttons$/) do
  assert page.has_css?('div.links')
  assert page.has_content?('open')
  assert page.has_content?('page 1')
  assert page.has_css?('button')
  assert page.has_content?('edit')
end

When(/^I hit the edit button of a file$/) do
  click_button 'edit'
end

Then(/^I should see a new page displaying an edit frame of the file$/) do
  assert page.has_content?('edit')
  assert page.has_content?('documents')
end

Then(/^I should see the list of file links with open and edit button$/) do
  assert page.has_css?('div.links')
  assert page.has_content?('open')
  assert page.has_content?('page 1')
  assert page.has_css?('button')
  assert page.has_content?('edit')
end

Then(/^I should see a button redirecting to the page showing the user list$/) do
  assert page.has_css?('div.links')
  assert page.has_content?('user list')
end

When(/^I'm on the page showing the user list$/) do
  visit 'user/list'
end

Then(/^I should see the list of user links with open and edit button$/) do
  assert page.has_css?('ul li')
  assert page.has_content?('user list')
  assert page.has_css?('a href')
  assert page.has_css?('button.open')
  assert page.has_css?('button.edit')
end

Then(/^I should see a button redirecting the page to the homepage$/) do
  assert page.has_css?('button.home')
end

When(/^I hit the link or the open button of a user$/) do
  click_button 'open'
end

Then(/^I should see a new page displaying the information of the user$/) do
  assert page.has_content?('account information')
  assert page.has_css?('table')
end

When(/^I hit the edit button of a user$/) do
  click_button 'edit'
end

Then(/^I should see a new page displaying an edit frame of the user$/) do
  assert page.has_content?('edit')
  assert page.has_content?('users')
end

#------------------------UserLogin.feature starts from here-------------------------------

Given(/^I'm on the login page$/) do
  visit '/log_in'
end

When(/^I hit login button with invalid username$/) do
  fill_in 'pennkey', :with => 'Obama'
  fill_in 'password', :with => 'iampresident'
  click_button 'Login'
end

Then(/^I should see an error message on the page$/) do
  # assert page.has_css?('div')
  # assert page.has_content?('Invalid pennkey or password')
  assert page.has_css?('form')
end

When(/^I hit login button with wrong password$/) do
  fill_in 'pennkey', :with => 'hansong'
  fill_in 'password', :with => 'hansongpeng'
  click_button 'Login'
end

When(/^I hit login button with correct information$/) do
  fill_in 'pennkey', :with => 'hansong'
  fill_in 'password', :with => '1234'
  click_button 'Login'
end

Then(/^I should see the page showing the files$/) do
  visit '/document'
end

Given(/^I'm as a readonly user on the login page$/) do
  visit '/log_in'
end

When(/^I hit login button with correct readonly user information$/) do
  fill_in 'pennkey', :with => 'cxb'
  fill_in 'password', :with => '123'
  click_button 'Login'
end

Then(/^I should see the readonly home page showing the files$/) do
  assert page.has_text?('Readonly user homepage')
end

Given(/^I'm as a writeable user on the login page$/) do
  visit '/log_in'
end

When(/^I hit login button with correct writeable user information$/) do
  fill_in 'pennkey', :with => 'cxb1'
  fill_in 'password', :with => '123'
  click_button 'Login'
end

Then(/^I should see the writeable home page showing the files$/) do
  assert page.has_text?('Writeable user homepage')
end

Given(/^I'm as a admin user on the login page$/) do
  visit '/log_in'
end

When(/^I hit login button with correct admin information$/) do
  fill_in 'pennkey', :with => 'cxb2'
  fill_in 'password', :with => '123'
  click_button 'Login'
end

Then(/^I should see the admin home page showing the files$/) do
  assert page.has_text?('Admin user homepage')
end



#---------------------ViewContent.feature starts from here-----------------------

When(/^I'm on the file content page$/) do
  visit '/document\/+d/'
end

Then(/^I should see the content of a file$/) do
  assert page.has_content?('pdf reader')
  assert page.has_content?('document')
end

Then(/^I should see a tag of file status and an edit button$/) do
  assert page.has_css?('button.edit')
  assert page.has_content?('request update?')
  assert page.has_css?('span.updated')
end

Given(/^the file is not under modification$/) do
  assert page.locate('span.updated').string == '0'
end

When(/^I hit the edit button$/) do
  click_button 'edit'
end

Then(/^I should see an editing frame of the file$/) do
  assert page.has_content?('edit')
  assert page.has_content?('document')
end

Then(/^I should see a tag of file status$/) do
  assert page.has_content?('request update?')
  assert page.has_css?('span.updated')
end

Then(/^I should see a review button and an edit button$/) do
  assert page.has_css?('button.review')
  assert page.has_css?('button.edit')
end

Then(/^I should see a button redirecting to the user list$/) do
  assert page.has_css?('button.back')
  assert page.has_content?('back to user list')
end

When(/^I hit the button to the user list$/) do
  click_button 'back'
end

Then(/^I should be back to the page of the user list$/) do
  assert page.has_css?('ul li')
  assert page.has_content?('user list')
  assert page.has_css?('a href')
  assert page.has_css?('button.open')
  assert page.has_css?('button.edit')
end

Given(/^the file is tagged as modified by an editor$/) do
  assert page.locate('span.updated').string == '1'
end

When(/^I hit review button$/) do
  click_button 'review'
end

Then(/^I should see a page showing the file content$/) do
  assert page.has_content?('document')
  assert page.has_content?('pdf')
end

Then(/^I should see a approve button and a disapprove button$/) do
  assert page.has_css?('button.approve')
  assert page.has_css?('button.reject')
end

When(/^I hit approve button$/) do
  click_button 'aprove'
end

Then(/^the file should be tagged back to not being modified$/) do
  assert page.locate('spane.updated').string == '0'
end

Then(/^the file content should be saved permanently$/) do
  assert page.has_content?('saved successfully.')
end

When(/^I hit disapprove button$/) do
  click_button 'reject'
end

Then(/^the file content should roll back to the former version$/) do
  assert page.has_content?('original version')
end

Then(/^the file should be tagged as not being modified$/) do
  assert page.locate('spane.updated').string == '0'
end