Feature: Orders management
  Scenario: List orders
    When I list all "orders"
    Then I should have response "OK"
     And following "orders" list:
       |id                                   | orderDate  | recipeId                             | quantity | userId                               |
       |e8620a90-e4ff-11ed-b5ea-0242ac120002 | 2023-04-27 | a35ce12d-d52b-4a07-90ad-68e985b779e7 | 10       | a35ce12d-d52b-4a07-63ap-68e985b7a85z |
       |f71d7844-e4ff-11ed-b5ea-0242ac120002 | 2023-03-12 | dc466424-4297-481a-a8de-aa0898852da1 | 5        | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |

  Scenario: Get an order
    When I get the "order" having id "f71d7844-e4ff-11ed-b5ea-0242ac120002"
    Then I should have response "OK"
     And following "order" item:
        | id                                   | orderDate  | recipeId                             | quantity | userId                               |
        | f71d7844-e4ff-11ed-b5ea-0242ac120002 | 2023-03-12 | dc466424-4297-481a-a8de-aa0898852da1 | 5        | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |

  Scenario: Get an inexistant order
    When I get the "order" having id "999"
    Then I should have response "NOT_FOUND"
     And following error : "Order with id 999 not found"

  Scenario: Create a order
    When I create the following "order":
       | orderDate  | recipeId                             | quantity | userId                               |
       | 2021-12-20 | dc466424-4297-481a-a8de-aa0898852da1 | 1        | a35ce12d-d52b-4a07-63ap-68e985b7a85z |
    Then I should have response "CREATED"
     And following new "order" item:
       | orderDate  | recipeId                             | quantity | userId                               |
       | 2021-12-20 | dc466424-4297-481a-a8de-aa0898852da1 | 1        | a35ce12d-d52b-4a07-63ap-68e985b7a85z |

  Scenario: Update a order
    When I update the "order" having id "f71d7844-e4ff-11ed-b5ea-0242ac120002" with following data:
      | id                                   | orderDate  | recipeId                             | quantity   | userId                               |
      | f71d7844-e4ff-11ed-b5ea-0242ac120002 | 2023-03-12 | dc466424-4297-481a-a8de-aa0898852da1 | 100        | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |
    Then I should have response "OK"
     And following "order" item:
      | id                                   | orderDate  | recipeId                             | quantity   | userId                               |
      | f71d7844-e4ff-11ed-b5ea-0242ac120002 | 2023-03-12 | dc466424-4297-481a-a8de-aa0898852da1 | 100        | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |

  Scenario: Update an inexistant order
    When I update the "order" having id "999" with following data:
      | id  | orderDate  | recipeId                             | quantity   | userId                               |
      | 999 | 2021-01-01 | dc466424-4297-481a-a8de-aa0898852da1 | 2        | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |
    Then I should have response "NOT_FOUND"
     And following error : "Order with id 999 not found"

  Scenario: Delete an order
    When I delete the "order" having id "f71d7844-e4ff-11ed-b5ea-0242ac120002"
    Then I should have response "OK"
     And following deleted "order" item:
      | id                                   | orderDate  | recipeId                             | quantity | userId                               |
      | f71d7844-e4ff-11ed-b5ea-0242ac120002 | 2023-03-12 | dc466424-4297-481a-a8de-aa0898852da1 | 100      | a35ce12d-dmqb-43a7-6q9p-681a5s4a8z36 |

  Scenario: Delete an inexistant order
    When I delete the "order" having id "99999"
    Then I should have response "NOT_FOUND"
     And following error : "Order with id 99999 not found"


  