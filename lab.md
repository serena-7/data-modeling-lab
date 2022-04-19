See individual files to view each section in its own file.

BRAINSTORMING:
Users:
- id
- email
- password
- first name
- last name

Ingredients:
- id
- name

Recipes:
- id
- name
- instructions
- ingredient ids
- Public/Private
- user id
- image
- source

Grocery Lists:
- id
- user id
- name
- ingredient ids
- recipe ids

Occasions:
- id
- name
- recipe ids
- user id

TABLE IDEAS:
* means foreign id

Users Table:
- user_id
- user_email
- user_password
- first_name
- last_name

Ingredients Table:
- ing_id
- ing_name

Recipes Table:
- recipe_id
- recipe_name
- instructions
- is_public
- user_id*
- image
- source

Grocery_List Table:
- list_id
- list_name
- user_id*

Occasions Table:
- occasion_id
- occasion_name
- user id*


RELATIONAL TABLES:
recipe_ingredients Table:
- rec_ing_id
- recipe_id*
- ing_id*

list_ingredients Table:
- list_ing_id
- list_id*
- ingr_id*

list_recipes Table:
- list_rec_id
- list_id*
- recipe_id*

recipe_occassions Table:
- rec_occ_id
- recipe_id*
- occassion_id*

RELATIONSHIPS:
One to One:

One to Many:
- user => recipes
because users can have multiple recipes but recipes only have one user
- user => grocery_lists
because users can have multiple grocery lists but grocery lists only have one user
- user => occasions
because users can have multiple occassions but occassions can only have one user

Many to Many:
- ingredients <=> recipes
because ingredients can have multiple recipes and recipes can have multiple ingredients
- ingredients <=> grocery_lists
because ingredients can be on multiple lists and lists can have multiple ingredients
- recipes <=> grocery_lists
because recipes can be on multiple lists and lists can have multiple recipes
- occassions <=> recipes
because occassions can be on multiple recipes and recipes can have multiple occassions

COLUMNS:
users columns:
- user_id SERIAL PRIMARY KEY
the user id will allow the user to login and to link its respecitive recipes, lists, and occassions to themselves.
the serial primary key allows it to increment everytime one is added.
- user_email VARCHAR(50) NOT NULL
the usere email will allow the user to login using their email
50 characters were chosen so that a string could not be too large
- user_password VARCHAR(500) NOT NULL
the user password will allow the user to login with a password
500 characters were chosen to allow for password hashing
- first_name VARCHAR(50)
the first name will allow user to have a first name
50 characters were chosen to limit space
- last_name VARCHAR(50)
the last name will allow user to have a last name
50 characters were chosen to limit space

ingredients columns:
- ing_id SERIAL PRIMARY KEY
ing_id will allow unique identifier for ingredients
the serial primary key allows it to increment everytime one is added.
- ing_name VARCHAR(100) NOT NULL
ing_name gives a textual name to the ingredient
100 characters were chosen to allow sufficient space for name

recipes columns:
- recipe_id SERIAL PRIMARY KEY,
allows unique identifier for recipes
data type will automatically increment everytime recipe is added
- recipe_name VARCHAR(100) NOT NULL,
gives a textual name to the recipe
100 characters gives sufficient space for name
- instructions VARCHAR(5000),
provides the instructions to complete the recipe
5000 characters to give sufficient but not unlimited space
- image VARCHAR(1000),
user can add an image in this column for visual appeal
1000 characters for a image url
- source VARCHAR(100),
user can provide a source where they found the recipe
1000 characters for url or other description
- is_public BOOLEAN,
will determine whether other users can view the recipe
boolean for a true or false answer
- user_id INT NOT NULL REFERENCES users(user_id)
will link a user to the recipe
references allows linking of user_id from users table

grocery_lists columns:
- list_id SERIAL PRIMARY KEY,
allows unique identifier for lists
data type will automatically increment everytime list is added
- list_name VARCHAR(100) NOT NULL,
gives a textual name to the list
100 characters provides sufficient space for name
- user_id INT NOT NULL REFERENCES users(user_id)
will link a user to the list
references allows linking of user_id from users table

occassions columns:
- occassion_id SERIAL PRIMARY KEY,
allows unique identifier for occassion
data type will automatically increment everytime occassion is added
- occassion_name VARCHAR(100) NOT NULL,
gives a textual name to the occassion
100 characters provides sufficient space for name
- user_id INT NOT NULL REFERENCES users(user_id)
will link user to the occassion
references allows linking of user_id from users table

recipe_ingredients columns:
- rec_ing_id SERIAL PRIMARY KEY,
allows unique identifier for recipe-ingredient item
data type will automatically increment everytime new relation is added
- recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
will link a recipe id to the relational item
references allows linking of recipe_id from recipes table
- ing_id INT NOT NULL REFERENCES ingredients(ing_id)
will link a ingredient id to the relational item
references allows linking of ing_id from ingredients table

list_ingredients columns:
- list_ing_id SERIAL PRIMARY KEY,
allows unique identifier for list-ingredient item
data type will automatically increment everytime new relation is added
- list_id INT NOT NULL REFERENCES grocery_lists(list_id),
will link list id to relational item
references allows linking of list_id from grocery_lists table
- ing_id INT NOT NULL REFERENCES ingredients(ing_id)
will link a ingredient id to the relational item
references allows linking of ing_id from ingredients table

list_recipes columns:
- list_rec_id SERIAL PRIMARY KEY,
allows unique identifier for list-recipe item
data type will automatically increment everytime new relation is added
- list_id INT NOT NULL REFERENCES grocery_lists(list_id),
will link list id to relational item
references allows linking of list_id from grocery_lists table
- recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
will link a recipe id to the relational item
references allows linking of recipe_id from recipes table

recipe_occassions columns:
- rec_occ_id SERIAL PRIMARY KEY,
allows unique identifier for recipe-occassions item
data type will automatically increment everytime new relation is added
- recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
will link a recipe id to the relational item
references allows linking of recipe_id from recipes table
- occassion_id INT NOT NULL REFERENCES occassions(occassion_id)
will link an occassion id to a relational item
references allows linnking of occasion_id from occassions table

TABLES SQL CODE:
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_email VARCHAR(50) NOT NULL,
  user_password VARCHAR(500) NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE ingredients (
  ing_id SERIAL PRIMARY KEY,
  ing_name VARCHAR(100) NOT NULL
);

CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  recipe_name VARCHAR(100) NOT NULL,
  instructions VARCHAR(5000),
  image VARCHAR(1000),
  source VARCHAR(1000),
  is_public BOOLEAN,
  user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE grocery_lists (
  list_id SERIAL PRIMARY KEY,
  list_name VARCHAR(100) NOT NULL,
  user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE occassions (
  occassion_id SERIAL PRIMARY KEY,
  occassion_name VARCHAR(100) NOT NULL,
  user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE recipe_ingredients (
  rec_ing_id SERIAL PRIMARY KEY,
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  ing_id INT NOT NULL REFERENCES ingredients(ing_id)
);

CREATE TABLE list_ingredients (
  list_ing_id SERIAL PRIMARY KEY,
  list_id INT NOT NULL REFERENCES grocery_lists(list_id),
  ing_id INT NOT NULL REFERENCES ingredients(ing_id)
);

CREATE TABLE list_recipes (
  list_rec_id SERIAL PRIMARY KEY,
  list_id INT NOT NULL REFERENCES grocery_lists(list_id),
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE recipe_occassions (
  rec_occ_id SERIAL PRIMARY KEY,
  recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
  occassion_id INT NOT NULL REFERENCES occassions(occassion_id)
);

INTERMEDIATE SQL CODE:
INSERT INTO users (user_email, user_password, first_name, last_name)
VALUES ('sally@mail.com', '123','Sally','Barnes'),
('bob@mail.com','456','Bob','Smith'),
('sue@mail.com','789','Sue','Johnson');

INSERT INTO recipes (recipe_name, instructions, image, source, is_public, user_id)
VALUES('Chicken and Broccoli','cook chicken cook broccoli and dish', NULL, NULL, true, 1);

INSERT INTO ingredients (ing_name)
VALUES('chicken breast'),
('broccoli');

INSERT INTO occassions (occassion_name, user_id)
VALUES('family dinner', 1);

INSERT INTO grocery_lists (list_name, user_id)
VALUES('main',1);

INSERT INTO recipe_ingredients(recipe_id, ing_id)
VALUES(1,1),
(1,2);

INSERT INTO list_ingredients(list_id,ing_id)
VALUES(1,1),
(1,2);

INSERT INTO list_recipes(list_id,recipe_id)
VALUES(1,1);

INSERT INTO recipe_occassions(recipe_id,occassion_id)
VALUES(1,1);