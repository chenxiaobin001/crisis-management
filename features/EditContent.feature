Featue: File content or user information editing

	As a user
	so that I can change the safety information
	I want to edit the content of a file or the permission given to a user

	Scenario: Edit file content as an editor
		Given I'm a user with write permission
		When I'm on the page displaying an edit frame of a file
		Then I should be able to change the content of the file
		And I should see a save button, a discard button and a quit button
		When I hit save button
		Then I should see the file is temporarily saved
		And I should see a link containing the email address of an admin
		And I should be asked to write an email to an administrator
		When I hit cancel button
		Then I should see the modification discarded
		When I hit quit button
		Then I should see the file content viewing page

	Scenario: Edit file content as an admin
		Given I'm an administrator
		When I'm on the page displaying an edit frame of a file
                Then I should be able to change the content of the file
                And I should see a save button, a discard button and a quit button
                When I hit save button
                Then I should see the file is saved
		When I hit cancel button
                Then I should see the modification discarded
                When I hit quit button
                Then I should see the file content viewing page
