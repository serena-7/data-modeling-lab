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