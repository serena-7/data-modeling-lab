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