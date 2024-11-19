-- Table: users
CREATE TABLE users (
    id_user UUID PRIMARY KEY,
    first_name VARCHAR(30),
    email VARCHAR(30),
    password VARCHAR(30)
);

-- Table: categories
CREATE TABLE categories (
    id_category UUID PRIMARY KEY,
    name VARCHAR(30)
);

-- Table: breweries
CREATE TABLE breweries (
    id_brewery UUID PRIMARY KEY,
    name VARCHAR(30),
    country VARCHAR(30)
);

-- Table: ingredients
CREATE TABLE ingredients (
    id_ingredient UUID PRIMARY KEY,
    type VARCHAR(30),
    name VARCHAR(30)
);

-- Table: beers
CREATE TABLE beers (
    id_beer UUID PRIMARY KEY,
    id_brewery UUID REFERENCES breweries(id_brewery),
    name VARCHAR(30),
    description VARCHAR(255),
    abv DECIMAL(3,1),
    price DECIMAL(5,2)
);

-- Table: photos
CREATE TABLE photos (
    id_photo UUID PRIMARY KEY,
    id_beer UUID REFERENCES beers(id_beer),
    url TEXT
);


-- Table: reviews
CREATE TABLE reviews (
    id_review UUID PRIMARY KEY,
    id_user UUID REFERENCES users(id_user),
    id_beer UUID REFERENCES beers(id_beer),
    message VARCHAR(255),
    rating SMALLINT
);

-- Table: favorites
CREATE TABLE favorites (
    id_favorite UUID PRIMARY KEY,
    id_user UUID REFERENCES users(id_user),
    id_beer UUID REFERENCES beers(id_beer)
);

-- Junction Table: beers_categories
CREATE TABLE beers_categories (
    id_beer UUID REFERENCES beers(id_beer),
    id_category UUID REFERENCES categories(id_category),
    PRIMARY KEY (id_beer, id_category)
);

-- Junction Table: beers_ingredients
CREATE TABLE beers_ingredients (
    id_beer UUID REFERENCES beers(id_beer),
    id_ingredient UUID REFERENCES ingredients(id_ingredient),
    PRIMARY KEY (id_beer, id_ingredient)
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";




