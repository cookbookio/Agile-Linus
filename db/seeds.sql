-- Seed data for Recipe Cookbook Database

-- Insert sample ingredients
INSERT INTO ingredients (name) VALUES ('Spaghetti');
INSERT INTO ingredients (name) VALUES ('Eggs');
INSERT INTO ingredients (name) VALUES ('Pancetta');
INSERT INTO ingredients (name) VALUES ('Parmesan Cheese');
INSERT INTO ingredients (name) VALUES ('Black Pepper');
INSERT INTO ingredients (name) VALUES ('Salt');
INSERT INTO ingredients (name) VALUES ('Chicken Breast');
INSERT INTO ingredients (name) VALUES ('Breadcrumbs');
INSERT INTO ingredients (name) VALUES ('Mozzarella Cheese');
INSERT INTO ingredients (name) VALUES ('Tomato Sauce');
INSERT INTO ingredients (name) VALUES ('Olive Oil');
INSERT INTO ingredients (name) VALUES ('Garlic');
INSERT INTO ingredients (name) VALUES ('Penne Pasta');
INSERT INTO ingredients (name) VALUES ('Bell Peppers');
INSERT INTO ingredients (name) VALUES ('Zucchini');
INSERT INTO ingredients (name) VALUES ('Cherry Tomatoes');
INSERT INTO ingredients (name) VALUES ('Basil');
INSERT INTO ingredients (name) VALUES ('Butter');
INSERT INTO ingredients (name) VALUES ('Flour');
INSERT INTO ingredients (name) VALUES ('Salmon Fillet');
INSERT INTO ingredients (name) VALUES ('Lemon');
INSERT INTO ingredients (name) VALUES ('Dill');

-- Insert sample tags
INSERT INTO tags (name) VALUES ('Italian');
INSERT INTO tags (name) VALUES ('Pasta');
INSERT INTO tags (name) VALUES ('Quick');
INSERT INTO tags (name) VALUES ('Easy');
INSERT INTO tags (name) VALUES ('Vegetarian');
INSERT INTO tags (name) VALUES ('Chicken');
INSERT INTO tags (name) VALUES ('Seafood');
INSERT INTO tags (name) VALUES ('Healthy');
INSERT INTO tags (name) VALUES ('Comfort Food');

-- Insert sample recipes
INSERT INTO recipes (title, time_minutes, price, description, image) 
VALUES (
    'Classic Spaghetti Carbonara',
    30,
    '$12.00',
    'A traditional Italian pasta dish made with eggs, cheese, pancetta, and black pepper. Simple yet elegant.',
    'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400'
);

INSERT INTO recipes (title, time_minutes, price, description, image)
VALUES (
    'Chicken Parmesan',
    45,
    '$15.00',
    'Breaded chicken breast topped with tomato sauce and melted mozzarella cheese.',
    'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?w=400'
);

INSERT INTO recipes (title, time_minutes, price, description, image)
VALUES (
    'Vegetarian Penne Primavera',
    25,
    '$10.00',
    'Fresh seasonal vegetables sautéed with garlic and olive oil, tossed with penne pasta.',
    'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400'
);

INSERT INTO recipes (title, time_minutes, price, description, image)
VALUES (
    'Grilled Salmon with Lemon Dill',
    20,
    '$18.00',
    'Pan-seared salmon fillet with a fresh lemon and dill butter sauce.',
    'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400'
);

-- Link recipes to ingredients (recipe_id, ingredient_id, amount, unit)
-- Recipe 1: Spaghetti Carbonara
INSERT INTO recipe_ingredients VALUES (1, 1, '400', 'g');    -- Spaghetti
INSERT INTO recipe_ingredients VALUES (1, 2, '4', 'pieces'); -- Eggs
INSERT INTO recipe_ingredients VALUES (1, 3, '200', 'g');    -- Pancetta
INSERT INTO recipe_ingredients VALUES (1, 4, '100', 'g');    -- Parmesan Cheese
INSERT INTO recipe_ingredients VALUES (1, 5, '1', 'tsp');    -- Black Pepper
INSERT INTO recipe_ingredients VALUES (1, 6, '1', 'tsp');    -- Salt

-- Recipe 2: Chicken Parmesan
INSERT INTO recipe_ingredients VALUES (2, 7, '2', 'pieces'); -- Chicken Breast
INSERT INTO recipe_ingredients VALUES (2, 8, '1', 'cup');    -- Breadcrumbs
INSERT INTO recipe_ingredients VALUES (2, 9, '200', 'g');    -- Mozzarella Cheese
INSERT INTO recipe_ingredients VALUES (2, 10, '2', 'cups');  -- Tomato Sauce
INSERT INTO recipe_ingredients VALUES (2, 11, '3', 'tbsp');  -- Olive Oil
INSERT INTO recipe_ingredients VALUES (2, 4, '50', 'g');     -- Parmesan Cheese

-- Recipe 3: Vegetarian Penne Primavera
INSERT INTO recipe_ingredients VALUES (3, 13, '300', 'g');   -- Penne Pasta
INSERT INTO recipe_ingredients VALUES (3, 14, '2', 'pieces'); -- Bell Peppers
INSERT INTO recipe_ingredients VALUES (3, 15, '1', 'piece'); -- Zucchini
INSERT INTO recipe_ingredients VALUES (3, 16, '200', 'g');   -- Cherry Tomatoes
INSERT INTO recipe_ingredients VALUES (3, 12, '4', 'cloves'); -- Garlic
INSERT INTO recipe_ingredients VALUES (3, 11, '4', 'tbsp');  -- Olive Oil
INSERT INTO recipe_ingredients VALUES (3, 17, '1', 'handful'); -- Basil

-- Recipe 4: Grilled Salmon
INSERT INTO recipe_ingredients VALUES (4, 20, '2', 'pieces'); -- Salmon Fillet
INSERT INTO recipe_ingredients VALUES (4, 21, '1', 'piece');  -- Lemon
INSERT INTO recipe_ingredients VALUES (4, 22, '2', 'tbsp');   -- Dill
INSERT INTO recipe_ingredients VALUES (4, 18, '3', 'tbsp');   -- Butter
INSERT INTO recipe_ingredients VALUES (4, 6, '1', 'tsp');     -- Salt
INSERT INTO recipe_ingredients VALUES (4, 5, '1/2', 'tsp');   -- Black Pepper

-- Link recipes to tags
INSERT INTO recipe_tags VALUES (1, 1); -- Carbonara: Italian
INSERT INTO recipe_tags VALUES (1, 2); -- Carbonara: Pasta
INSERT INTO recipe_tags VALUES (1, 3); -- Carbonara: Quick

INSERT INTO recipe_tags VALUES (2, 1); -- Chicken Parmesan: Italian
INSERT INTO recipe_tags VALUES (2, 6); -- Chicken Parmesan: Chicken
INSERT INTO recipe_tags VALUES (2, 9); -- Chicken Parmesan: Comfort Food

INSERT INTO recipe_tags VALUES (3, 2); -- Primavera: Pasta
INSERT INTO recipe_tags VALUES (3, 3); -- Primavera: Quick
INSERT INTO recipe_tags VALUES (3, 4); -- Primavera: Easy
INSERT INTO recipe_tags VALUES (3, 5); -- Primavera: Vegetarian
INSERT INTO recipe_tags VALUES (3, 8); -- Primavera: Healthy

INSERT INTO recipe_tags VALUES (4, 7); -- Salmon: Seafood
INSERT INTO recipe_tags VALUES (4, 3); -- Salmon: Quick
INSERT INTO recipe_tags VALUES (4, 8); -- Salmon: Healthy
