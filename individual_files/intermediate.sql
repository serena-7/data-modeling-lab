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