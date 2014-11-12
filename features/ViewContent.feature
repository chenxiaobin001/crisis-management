Feature: File content or user information viewing

	As a user
	so that I can check the safety information
	I want to view the content of a file or the information of a user

	Scenario: View file content as a common user
		Given I'm a user with read-only permission
		When I'm on the file content page
		Then I should see the content of a file

	Scenario: View file content as an editor
		Given I'm a user with write permission
		When I'm on the file content page
		Then I should see the content of a file
		And I should see a tag of file status and an edit button

	Scenario: Redirect to file editing page as an editor
		Given I'm an editor with write permission
		Given the file is not under modification
		When I hit the edit button
		Then I should see an editing frame of the file

	Scenario: View file content as an administrator
		Given I'm an administrator
		When I'm on the file content page
		Then I should see the content of a file
		And I should see a tag of file status
		And I should see a review button and an edit button
		And I should see a button redirecting to the user list
		When I hit the button to the user list
		Then I should be back to the page of the user list

	Scenario: Redirect to file editing page as an admin
		Given I'm an administrator
                Given the file is not under modification
                When I hit the edit button
                Then I should see an editing frame of the file

	Scenario: Review the temporarily modified file as an admin
		Given I'm an administrator
		Given the file is tagged as modified by an editor
		When I hit review button
		Then I should see a page showing the file content
		And I should see a approve button and a disapprove button

	Scenario: Decide to approve the modification or not as an admin
		Given I'm an administrator
		When I hit approve button
		Then the file should be tagged back to not being modified
		And the file content should be saved permanently
		When I hit disapprove button
		Then the file content should roll back to the former version
		And the file should be tagged as not being modified
