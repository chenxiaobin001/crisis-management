Feature: Website content displayed as lists on user homepage

	As a user
	so that I can check the safety information
	I want to view the list of files or the list of users

	Scenario: View file list as a common user
		Given I'm a user with read-only permission
		When I'm on the homepage
		Then I should see the list of file links with open buttons
		When I hit the link or the open button of a file
		Then I should see a new page displaying the content of the file

	Scenario: View file list as an editor
		Given I'm an editor with write permission
		When I'm on the homepage
		Then I should see the list of file links with open and edit button
		When I hit the link or the open button of a file
                Then I should see a new page displaying the content of the file
		When I hit the edit button of a file
                Then I should see a new page displaying an edit frame of the file

	Scenario: View file list as an administrator
		Given I'm an administrator
		When I'm on the homepage
		Then I should see the list of file links with open and edit button
		And I should see a button redirecting to the page showing the user list
                When I hit the link or the open button of a file
                Then I should see a new page displaying the content of the file
                When I hit the edit button of a file
                Then I should see a new page displaying an edit frame of the file


	Scenario: View User list as an administrator
		Given I'm an administrator
		When I'm on the page showing the user list
		Then I should see the list of user links with open and edit button
		And I should see a button redirecting the page to the homepage
                When I hit the link or the open button of a user
                Then I should see a new page displaying the information of the user
                When I hit the edit button of a user
                Then I should see a new page displaying an edit frame of the user

