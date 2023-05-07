Feature: User management
  Scenario: List users
    When I list all "users"
    Then I should have response "OK"
     And following "users" list:
       |              id                      | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | a35ce12d-d52b-4a07-63ap-68e985b7a85z | De Monredon | Simon     | 2000-09-25 | 13 rue de Vibraye          | 0786189288 | simon@gmail.com | 
       | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 | Leroux      | Valentin  | 2001-07-22 | Chateau de glaix Cherreau | 0123456789 | valou@gmail.com |
   
   Scenario: Get a user
    When I get the "user" having id "a35ce12d-d52b-4a07-63ap-68e985b7a85z"
    Then I should have response "OK"
     And following "user" item:
       |              id                      | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | a35ce12d-d52b-4a07-63ap-68e985b7a85z | De Monredon | Simon     | 2000-09-25 | 13 rue de Vibraye          | 0786189288 | simon@gmail.com | 

  Scenario: Get an inexistant user
    When I get the "user" having id "1"
    Then I should have response "NOT_FOUND"
     And following error : "User with id 1 not found"

  Scenario: Create a user
    When I create the following "user":
       | lastName | firstName | birthDate  | address             | phone        | email              |
       | Vesin    | Philippe  | 1991-02-25 | 92 Quai de la Fosse | 018754213692 | philippe@gmail.com | 
    Then I should have response "CREATED"
     And following new "user" item:
       | lastName | firstName | birthDate  | address             | phone        | email              |
       | Vesin    | Philippe  | 1991-02-25 | 92 Quai de la Fosse | 018754213692 | philippe@gmail.com | 

  Scenario: Update a user
    When I update the "user" having id "a35ce12d-d52b-4a07-63ap-68e985b7a85z" with following data:
       |              id                      | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | a35ce12d-d52b-4a07-63ap-68e985b7a85z | De Monredon | Simon     | 2000-09-25 | 13 rue de Vibraye, LFB     | 0786189288 | simon@gmail.com | 
    Then I should have response "OK"
     And following "order" item:
       |              id                      | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | a35ce12d-d52b-4a07-63ap-68e985b7a85z | De Monredon | Simon     | 2000-09-25 | 13 rue de Vibraye, LFB     | 0786189288 | simon@gmail.com | 

  Scenario: Update an inexistant user
    When I update the "user" having id "2" with following data:
       | id | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | 2  | De Patricka | Alban     | 1980-08-25 | 13 rue de Vibraye, LFB     | 0123548796 | alban@gmail.com | 
    Then I should have response "NOT_FOUND"
     And following error : "User with id 2 not found"

  Scenario: Delete a user
    When I delete the "user" having id "a35ce12d-d52b-4a07-63ap-68e985b7a85z"
    Then I should have response "OK"
     And following deleted "user" item:
       |              id                      | lastName    | firstName | birthDate  | address                    | phone      | email           |
       | a35ce12d-d52b-4a07-63ap-68e985b7a85z | De Monredon | Simon     | 2000-09-25 | 13 rue de Vibraye, LFB          | 0786189288 | simon@gmail.com | 


  Scenario: Delete an inexistant user
    When I delete the "user" having id "99999"
    Then I should have response "NOT_FOUND"
     And following error : "User with id 99999 not found"
