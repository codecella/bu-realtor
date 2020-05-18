Feature:
    As a User
    I want to successfully login in given valid EmailId and Password
    So I can see the Dashboard

Background: Following users exist
    Given the following users exist:
    | email            | id          |
    | preddyl1@binghamton.edu | 1    |

 Given the following property exist:
  | name             | apttype   | description  | price        |  address | status
  | Murray street 56    | Apartment        | Lorem ipsum |  200000 |   Lorem ipsum avenue 32, NY       | Leased

@omniauth_test
Scenario: See Login Page
    When I am on the BU Realtor login
    Then I should see "Log in" header
    Then I should see "Register or Log in with Github" header
    
@omniauth_test
Scenario: show property
  When I go to the show property page for "Murray street 56"
  And I should see "Apartment" header