Feature: User login

	As a user
	so that I can view the files
	I want to login the site

	Scenario: Login with invalid username
		Given I'm on the login page
		When I hit login button with invalid username
		Then I should see an error message on the page

	Scenario: Login with wrong password
		Given I'm on the login page
		When I hit login button with wrong password
		Then I should see an error message on the page

	Scenario: Login with correct information as readonly user
		Given I'm as a readonly user on the login page
		When I hit login button with correct information
		Then I should see the readonly home page showing the files

    Scenario: Login with correct information as writeable user
      Given I'm as a writeable user on the login page
      When I hit login button with correct information
      Then I should see the writeable home page showing the files

    Scenario: Login with correct information as admin user
      Given I'm as a admin user on the login page
      When I hit login button with correct information
      Then I should see the admin home page showing the files