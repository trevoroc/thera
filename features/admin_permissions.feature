Feature: admin permissions
    as an admin I want to be able to manage volunteers
    so that I can maintain oversight
    
Scenario: Manage Volunteers
  Given all roles exist  
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Manage Volunteers"
  
Scenario: Manage Volunteers Visible
  Given all roles exist  
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  And I follow "Manage Volunteers"
  Then I should see "Listing Users"
  
Scenario: Volunteer Cannot Manage Volunteers
  Given all roles exist  
  And an admin exists with email "testVolunteerEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And I fill in "Email" with "testVolunteerEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should not see "Listing Users"