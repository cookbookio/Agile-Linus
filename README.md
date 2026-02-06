# Recipe Cookbook - Ruby/Sinatra Edition

A recipe cookbook web application built with Ruby and the Sinatra framework, featuring a retro 90s-style interface and a RESTful API.

## Features

- Browse recipes with ingredients and tags
- View detailed recipe instructions
- RESTful API for recipes, ingredients, tags, and users
- SQLite database with full schema and seed data
- Retro 90s web design aesthetic

## Prerequisites

- Docker
- Docker Compose

## Running the Application

### Using Docker (Recommended):

1. Build and start the application:
```bash
docker compose up --build
```

2. The application will be available at: http://localhost:3000

3. To stop the application:
```bash
docker compose down
```

### Running in detached mode (background):
```bash
docker compose up -d
```

### View logs:
```bash
docker compose logs -f
```

## Project Structure

```
.
├── app.rb              # Main Sinatra application
├── config.ru           # Rack configuration
├── Gemfile             # Ruby dependencies
├── db/
│   ├── schema.sql      # Database schema
│   ├── seeds.sql       # Seed data
│   └── setup.rb        # Database setup script
├── views/
│   ├── layout.erb      # Base layout template
│   ├── home.erb        # Home page template
│   └── recipe_detail.erb  # Recipe detail template
└── static/
    └── style.css       # Stylesheet
```

## API Endpoints

### Web Routes
- `GET /` - Home page with all recipes
- `GET /recipes/:id/` - Recipe detail page

### API Routes

#### Users
- `POST /api/user/create/` - Create a new user
- `GET /api/user/me/` - Get current user
- `PUT /api/user/me/` - Update current user
- `PATCH /api/user/me/` - Partial update current user
- `POST /api/user/token/` - Create user token (login)

#### Recipes
- `GET /api/recipe/recipes/` - List all recipes
- `POST /api/recipe/recipes/` - Create a new recipe
- `GET /api/recipe/recipes/:id/` - Get a specific recipe
- `PUT /api/recipe/recipes/:id/` - Update a recipe
- `PATCH /api/recipe/recipes/:id/` - Partial update a recipe
- `DELETE /api/recipe/recipes/:id/` - Delete a recipe
- `POST /api/recipe/recipes/:id/upload-image/` - Upload recipe image

#### Ingredients
- `GET /api/recipe/ingredients/` - List all ingredients
- `PUT /api/recipe/ingredients/:id/` - Update an ingredient
- `PATCH /api/recipe/ingredients/:id/` - Partial update an ingredient
- `DELETE /api/recipe/ingredients/:id/` - Delete an ingredient

#### Tags
- `GET /api/recipe/tags/` - List all tags
- `PUT /api/recipe/tags/:id/` - Update a tag
- `PATCH /api/recipe/tags/:id/` - Partial update a tag
- `DELETE /api/recipe/tags/:id/` - Delete a tag

## Database Schema

The application uses SQLite3 with the following tables:
- `users` - User accounts
- `recipes` - Recipe information
- `ingredients` - Ingredient master list
- `tags` - Tag master list
- `recipe_ingredients` - Many-to-many relationship between recipes and ingredients
- `recipe_tags` - Many-to-many relationship between recipes and tags

## Development

The database is automatically set up when the Docker container starts. If you need to reset the database, restart the container:
```bash
docker compose down
docker compose up --build
```

## License

This project is for educational purposes.
