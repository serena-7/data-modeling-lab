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