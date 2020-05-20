Feature: show an property
  As a real estate agent
  I want to see a portfolio property profile
  So that I can explore the property details in real-time
  
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
 And I should see "Details of Murray street 56" on page
 And I should see "Apartment" on page