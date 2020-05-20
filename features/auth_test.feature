Feature: Login feature
    As a User
    I want to successfully login in given valid EmailId and Password
    So I can see the Dashboard

Background: Following users exist
    Given the following users exist:
    | email            | id          | name |
    | preddyl1@binghamton.edu | 1    | pranitha |

 Given the following property exist:
  | name             | apttype   | description  | price        |  address | status
  | Murray street 56    | Apartment        | Lorem ipsum |  200000 |   Lorem ipsum avenue 32, NY       | Leased

@omniauth_test
Scenario: See Login Page
    When I am on the BU Realtor login
    Then I should see "Log in" on page
    Then I should see "Register or Log in with Github" on page
    
@omniauth_test
Scenario: Successfully Log in
    Given I am signed in with provider "Github"
    Then I should see "BU Realtor" on page
    Then I should see "List of properties" on page
