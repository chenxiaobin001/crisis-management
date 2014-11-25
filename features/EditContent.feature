Feature: File content or user information editing

	As a user
	so that I can change the safety information
	I want to edit the content of a file or the privilege assigned to a user
	I want to save or discard the change of content I've made
	I want to quit the frame and go back to view the content

	Scenario: View edit frame as an editor
		Given I'm a user with write permission
		When I'm on the page displaying an edit frame of a file
		Then I should be able to change the content of the file
		And I should see a save button, a discard button and a quit button

	Scenario: Edit file content as an editor and save it
		Given I'm a user with write permission
		Given I'm on the page displaying an edit frame of a file
		When I hit save button
		Then I should see the file is temporarily saved
		And I should see a link of email address of an admin
		And I should be asked to write an email to an administrator

	Scenario: Edit file content as an editor but cancel it
		Given I'm a user with write permission
		Given I'm on the page displaying an edit frame of a file
		When I hit cancel button
		Then I should see the modification discarded

	Scenario: Quit after editing file content as an editor
		Given I'm a user with write permission
		Given I'm on the page displaying an edit frame of a file
		When I hit quit button
		Then I should see the file content viewing page

	Scenario: View edit frame as an admin
		Given I'm an administrator
		When I'm on the page displaying an edit frame of a file
		Then I should be able to change the content of the file
		And I should see a save button, a discard button and a quit button

	Scenario: Edit file content as an admin and save it
		Given I'm an administrator
		Given I'm on the page displaying an edit frame of a file
		When I hit save button
		Then I should see the file is saved

	Scenario: Edit file content as an admin but cancel it
		Given I'm an administrator
		Given I'm on the page displaying an edit frame of a file
		When I hit cancel button
		Then I should see the modification discarded

	Scenario: Quit after editing file content as an admin
		Given I'm an administrator
		Given I'm on the page displaying an edit frame of a file
		When I hit quit button
		Then I should see the file content viewing page
