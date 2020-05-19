Feature: Update property in a  portfolio
  
As a real estate agent
I want to edit my property
So that I can have updated information about it
  
Background:
  Given I am on the BU Realtor login
  
    Given the following users exist:
    | email            | id          | name |
    | preddyl1@binghamton.edu | 1    | pranitha |
  
  
  Given the following property exist:
  | name             | apttype    | description  | price   |  address                  | status |
  | Murray street 56 | Apartment  | Lorem ipsum  |  200000 | Lorem ipsum avenue 32, NY | Leased |
  

@omniauth_test
Scenario: 
 Given I am signed in with provider "Github"
 And  I follow "More about"
 Then I the should see show property page for "Murray street 56"
 When I press "Edit"
 And I should see "Edit Property" header
 Then I press "Update Property Details"
 And I should see "Murray street 56 was updated" header
 
 