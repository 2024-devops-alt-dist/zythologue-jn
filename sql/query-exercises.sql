-- list beers by alcohol content (ABV) from the lightest to the strongest
SELECT 
    name AS beer_name,
    abv AS alcohol_by_volume
FROM 
    beers
ORDER BY 
    abv ASC;

-- display the number of beers per category
SELECT 
    c.name AS category_name,
    COUNT(bc.id_beer) AS beer_count
FROM 
    categories c
LEFT JOIN 
    beers_categories bc ON c.id_category = bc.id_category
GROUP BY 
    c.id_category, c.name
ORDER BY 
    beer_count DESC;

-- find all beers from a specific brewery
SELECT 
    b.name AS beer_name,
    b.description,
    b.abv AS alcohol_by_volume,
    b.price
FROM 
    beers b
INNER JOIN 
    breweries br ON b.id_brewery = br.id_brewery
WHERE 
    br.name = 'Brewery A';

-- list users and the number of beers they have added to their favorites
SELECT 
    u.first_name AS user_name,
    COUNT(f.id_beer) AS favorite_beer_count
FROM 
    users u
LEFT JOIN 
    favorites f ON u.id_user = f.id_user
GROUP BY 
    u.id_user, u.first_name
ORDER BY 
    favorite_beer_count DESC;

-- add a new beer to the database and return the inserted values
INSERT INTO beers (id_beer, id_brewery, name, description, abv, price)
VALUES (
    uuid_generate_v4(), -- Automatically generates a new UUID for the beer
    'caaa1111-aaaa-1111-aaaa-111111111111',
    'New Beer Name',
    'This is a description of the new beer.',
    5.5,
    3.99
)
RETURNING id_beer, name, description, abv, price;

-- display beers along with their breweries, ordered by the country of the brewery
SELECT 
    b.name AS beer_name,
    br.name AS brewery_name,
    br.country AS brewery_country
FROM 
    beers b
INNER JOIN 
    breweries br ON b.id_brewery = br.id_brewery
ORDER BY 
    br.country ASC, -- Orders by the country in ascending order
    br.name ASC; -- Secondary order by the brewery name

-- list beers along with their ingredients
SELECT 
    b.name AS beer_name,
    i.name AS ingredient_name,
    i.type AS ingredient_type
FROM 
    beers b
INNER JOIN 
    beers_ingredients bi ON b.id_beer = bi.id_beer
INNER JOIN 
    ingredients i ON bi.id_ingredient = i.id_ingredient
ORDER BY 
    b.name ASC, -- Orders the results alphabetically by beer name
    i.type ASC; -- Orders the ingredients by type within each beer

--  display breweries and the number of beers they produce, filtering only those with more than 5 beers
SELECT 
    br.name AS brewery_name,
    COUNT(b.id_beer) AS beer_count
FROM 
    breweries br
INNER JOIN 
    beers b ON br.id_brewery = b.id_brewery
GROUP BY 
    br.id_brewery, br.name
HAVING 
    COUNT(b.id_beer) > 5
ORDER BY 
    beer_count DESC;

-- list beers that haven't been added to any user's favorites
SELECT 
    b.name AS beer_name,
    b.description,
    b.abv AS alcohol_by_volume,
    b.price
FROM 
    beers b
LEFT JOIN 
    favorites f ON b.id_beer = f.id_beer
WHERE 
    f.id_beer IS NULL
ORDER BY 
    b.name ASC;

-- find beers that are common favorites between two users
SELECT 
    b.name AS beer_name,
    b.description,
    b.abv AS alcohol_by_volume,
    b.price
FROM 
    favorites f1
INNER JOIN 
    favorites f2 ON f1.id_beer = f2.id_beer
INNER JOIN 
    beers b ON f1.id_beer = b.id_beer
WHERE 
    f1.id_user = '11111111-1111-1111-1111-111111111111' AND f2.id_user = '22222222-2222-2222-2222-222222222222'
ORDER BY 
    b.name ASC;

-- display breweries where their beers have an average rating higher than value of 2
SELECT 
    br.name AS brewery_name,
    AVG(r.rating) AS average_rating
FROM 
    breweries br
INNER JOIN 
    beers b ON br.id_brewery = b.id_brewery
INNER JOIN 
    reviews r ON b.id_beer = r.id_beer
GROUP BY 
    br.id_brewery, br.name
HAVING 
    AVG(r.rating) > 2
ORDER BY 
    average_rating DESC;

-- update the information of a brewery in the database and return the updated values
UPDATE breweries
SET 
    name = 'Updated Brewery Name',
    country = 'Updated Country'
WHERE 
    id_brewery = 'bbbb2222-bbbb-2222-bbbb-222222222222'
RETURNING name, country;

-- delete all photos associated with a specific beer
DELETE FROM photos
WHERE id_beer = 'b0000018-bbbb-0018-bbbb-bbbbbbbbbbbb'
RETURNING id_photo, id_beer, url;

-- the procedure will check if the user has already rated the beer. If so, it updates the rating; otherwise, it inserts a new record
CREATE OR REPLACE FUNCTION rate_beer(
    p_user_id UUID,      -- The ID of the user
    p_beer_id UUID,      -- The ID of the beer
    p_rating SMALLINT,   -- The rating provided by the user
    p_message TEXT DEFAULT NULL -- Optional review message
) RETURNS VOID AS $$
BEGIN
    -- Check if the user has already rated this beer
    IF EXISTS (
        SELECT 1 
        FROM reviews 
        WHERE id_user = p_user_id AND id_beer = p_beer_id
    ) THEN
        -- Update the existing rating
        UPDATE reviews
        SET rating = p_rating,
            message = COALESCE(p_message, message) -- Update message only if provided
            -- ,updated_at = NOW() -- Optional: Add a timestamp column for updates
        WHERE id_user = p_user_id AND id_beer = p_beer_id;
    ELSE
        -- Insert a new rating
        INSERT INTO reviews (id_review, id_user, id_beer, message, rating 
            -- ,created_at
        )
        VALUES (
            uuid_generate_v4(), -- Generate a new UUID for the review
            p_user_id,
            p_beer_id,
            p_message,
            p_rating
            -- ,NOW() -- Optional: Add a created timestamp
        );
    END IF;
END;
$$ LANGUAGE plpgsql;

-- call the procedure using SELECT
SELECT rate_beer(
    '22222222-2222-2222-2222-222222222222'::UUID, -- User UUID
    'b0000020-bbbb-0020-bbbb-bbbbbbbbbbbb'::UUID, -- Beer UUID
    3::SMALLINT, -- Rating
    'Updated message!' -- Review message (optional)
);

-- the Trigger function will check the abv value and raise an error if it is outside the valid range
CREATE OR REPLACE FUNCTION check_abv()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if ABV is within the allowed range
    IF NEW.abv < 0.0 OR NEW.abv > 20.0 THEN
        RAISE EXCEPTION 'ABV (Alcohol By Volume) must be between 0 and 20. Provided value: %', NEW.abv;
    END IF;

    -- If the check passes, allow the operation
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- attach the trigger function to the beers table to execute before any INSERT operation
CREATE TRIGGER trigger_check_abv
BEFORE INSERT ON beers
FOR EACH ROW
EXECUTE FUNCTION check_abv();

-- test trigger function with valid insert
INSERT INTO beers (id_beer, id_brewery, name, description, abv, price)
VALUES (
    uuid_generate_v4(),
    'caaa1111-aaaa-1111-aaaa-111111111111',
    'Golden Ale',
    'A smooth golden ale.',
    5.5, -- Valid ABV
    3.99
)
RETURNING id_beer, name, description, abv, price;

-- test trigger function with invalid insert
INSERT INTO beers (id_beer, id_brewery, name, description, abv, price)
VALUES (
    uuid_generate_v4(),
    'caaa1111-aaaa-1111-aaaa-111111111111',
    'Strong Beer',
    'An extremely strong beer.',
    25.0, -- Invalid ABV
    4.99
)
RETURNING id_beer, name, description, abv, price;