Feature: File viewing

	As a user
	so that I can check the safety information
	I want to view the files

	Scenario: View files as a common user
		Given I'm a user with read-only permission
		When I'm on the file viewing page
		Then I should see the files that I can access

	Scenario: View files as an editor
		Given I'm a user with write permission
		When I'm on the file viewing page
		Then I should see the files and the button for editing page

	Scenario: View files 
