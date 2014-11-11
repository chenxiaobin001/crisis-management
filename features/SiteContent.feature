Feature: Website content viewing

	As a user
	so that I can check the safety information
	I want to view the files and/or the users

	Scenario: View file list as a common user
		Given I'm a user with read-only permission
		When I'm on the homepage
		Then I should see a list of files shown as links

	Scenario: View file list as an editor
		Given I'm an editor with write permission
		When I'm on the homepage
		Then I should see a list of files shown as links with edit button

	Scenario: View file list and user list as an administrator
		Given I'm an administrator
		When I'm on the homepage
		Then I should see all the files with edit button
		And I should see a button redirecting to the user list
