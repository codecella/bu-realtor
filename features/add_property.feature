Feature: Add property
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
    Given I am signed in with provider "Github"
    Then I should see "Add" header
    And I follow "Add Property"
    Then I should see "Add Property" header
    And I should see "Type" header
    And I should see "Price" header
    And I should see "Address" header
    And I should see "Description" header