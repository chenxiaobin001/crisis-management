Feature: Website content displayed as lists on user homepage

	As a user
	so that I can check the safety information
	I want to view the list of files or the list of users
	I want to navigate to different parts of the whole list
	I want to search files or users via names
	I want to modify the content
	I want to switch to user list and back to file list

	Scenario: View homepage as a common user
		Given I'm a user with read-only permission
		When I'm on the homepage
		Then I should see lists of file links, open buttons
		And I should see a navigation bar
		And I should see a search bar

	Scenario: Redirect to content viewing page of a file
		Given I've logged in as a user
		Given I'm on the homepage
		When I hit the link or the open button of a file
		Then I should see a new page displaying the content of the file

	Scenario: Navigate to different part
		Given I'm a user
		Given I'm on the homepage
		When I hit the buttons on the navigation bar
		Then I should see different parts of the whole list of file

	Scenario: Search the files or users
		Given I'm a user
		Given I'm on the homepage
		When I enter something and hit search
		Then I should see relative results on a new page

	Scenario: View homepage as an editor
		Given I'm an editor with write permission
		When I'm on the homepage
		Then I should see lists of file links, open button
		And I should see a navigation bar
		And I should see a search bar

	Scenario: View homepage as an admin
		Given I'm an administrator
		When I'm on the homepage
		Then I should see lists of file links, open button
		And I should see a button of user list
		And I should see a navigation bar
		And I should see a search bar

	Scenario: Redirect to user list as an admin
		Given I'm an administrator
		Given I'm viewing file list
		When I hit the button of user list
		Then I should see the list of user links with open buttons
		And I should see a button of file list
		And I should see a navigation bar
		And I should see a search bar

	Scenario: Redirect to file list as an admin
		Given I'm an administrator
		Given I'm viewing user list
		When I hit the button of file list
		Then I should be on the original homepage
