-- Insert into users
INSERT INTO users (id_user, first_name, email, password) VALUES
    ('11111111-1111-1111-1111-111111111111', 'John', 'john.doe1@example.com', 'password1'),
    ('22222222-2222-2222-2222-222222222222', 'Jane', 'jane.doe2@example.com', 'password2'),
    ('33333333-3333-3333-3333-333333333333', 'Alice', 'alice@example.com', 'password3'),
    ('44444444-4444-4444-4444-444444444444', 'Bob', 'bob@example.com', 'password4'),
    ('55555555-5555-5555-5555-555555555555', 'Charlie', 'charlie@example.com', 'password5'),
    ('66666666-6666-6666-6666-666666666666', 'Diana', 'diana@example.com', 'password6'),
    ('77777777-7777-7777-7777-777777777777', 'Eve', 'eve@example.com', 'password7'),
    ('88888888-8888-8888-8888-888888888888', 'Frank', 'frank@example.com', 'password8'),
    ('99999999-9999-9999-9999-999999999999', 'Grace', 'grace@example.com', 'password9'),
    ('10101010-1010-1010-1010-101010101010', 'Hank', 'hank@example.com', 'password10'),
    ('12121212-1212-1212-1212-121212121212', 'Ivy', 'ivy@example.com', 'password11'),
    ('13131313-1313-1313-1313-131313131313', 'Jack', 'jack@example.com', 'password12'),
    ('14141414-1414-1414-1414-141414141414', 'Kara', 'kara@example.com', 'password13'),
    ('15151515-1515-1515-1515-151515151515', 'Leo', 'leo@example.com', 'password14'),
    ('16161616-1616-1616-1616-161616161616', 'Mia', 'mia@example.com', 'password15'),
    ('17171717-1717-1717-1717-171717171717', 'Nina', 'nina@example.com', 'password16'),
    ('18181818-1818-1818-1818-181818181818', 'Oscar', 'oscar@example.com', 'password17'),
    ('19191919-1919-1919-1919-191919191919', 'Paul', 'paul@example.com', 'password18'),
    ('20202020-2020-2020-2020-202020202020', 'Quinn', 'quinn@example.com', 'password19'),
    ('21212121-2121-2121-2121-212121212121', 'Rita', 'rita@example.com', 'password20');

-- Insert into breweries
INSERT INTO breweries (id_brewery, name, country) VALUES
    ('aaaa1111-aaaa-1111-aaaa-111111111111', 'Brewery A', 'USA'),
    ('baaa1111-aaaa-1111-aaaa-111111111111', 'Brewery B', 'France'),
    ('caaa1111-aaaa-1111-aaaa-111111111111', 'Brewery C', 'Germany'),
    ('bbbb2222-bbbb-2222-bbbb-222222222222', 'Brewery D', 'Belgium');

-- Insert into beers
INSERT INTO beers (id_beer, id_brewery, name, description, abv, price) VALUES
    ('b0000001-bbbb-0001-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Light Lager', 'A refreshing lager.', 4.2, 2.99),
    ('b0000002-bbbb-0002-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Dark Stout', 'Rich and creamy stout.', 6.8, 4.49),
    ('33333333-3333-3333-3333-333333333333', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Pale Ale', 'A light and hoppy ale.', 5.0, 3.49),
    ('b0000004-bbbb-0004-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Amber Ale', 'A malty amber ale.', 5.5, 3.99),
    ('b0000005-bbbb-0005-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'IPA', 'Intensely hoppy IPA.', 7.0, 4.99),
    ('b0000006-bbbb-0006-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Hefeweizen', 'A classic wheat beer.', 4.5, 3.29),
    ('b0000007-bbbb-0007-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Pilsner', 'A crisp pilsner.', 4.8, 2.79),
    ('b0000008-bbbb-0008-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Porter', 'A robust porter.', 6.5, 4.29),
    ('b0000009-bbbb-0009-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Blonde Ale', 'A golden and smooth ale.', 4.3, 3.19),
    ('b0000010-bbbb-0010-bbbb-bbbbbbbbbbbb', 'baaa1111-aaaa-1111-aaaa-111111111111', 'Saison', 'A spicy farmhouse ale.', 6.0, 4.39),
    ('b0000011-bbbb-0011-bbbb-bbbbbbbbbbbb', 'baaa1111-aaaa-1111-aaaa-111111111111', 'Barleywine', 'Strong and malty beer.', 9.5, 5.99),
    ('b0000012-bbbb-0012-bbbb-bbbbbbbbbbbb', 'baaa1111-aaaa-1111-aaaa-111111111111', 'Bock', 'A dark German lager.', 6.6, 4.59),
    ('b0000013-bbbb-0013-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Tripel', 'Belgian-style strong ale.', 8.0, 5.49),
    ('b0000014-bbbb-0014-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Dubbel', 'Dark and complex ale.', 7.2, 5.29),
    ('b0000015-bbbb-0015-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Lambic', 'Fruity and sour beer.', 5.2, 5.19),
    ('b0000016-bbbb-0016-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Gose', 'Tart and salty beer.', 4.6, 4.89),
    ('b0000017-bbbb-0017-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-1111-aaaa-111111111111', 'Cider', 'Fresh apple cider.', 4.0, 3.79),
    ('b0000018-bbbb-0018-bbbb-bbbbbbbbbbbb', 'caaa1111-aaaa-1111-aaaa-111111111111', 'Kolsch', 'Hybrid ale-lager style.', 4.7, 3.49),
    ('b0000019-bbbb-0019-bbbb-bbbbbbbbbbbb', 'caaa1111-aaaa-1111-aaaa-111111111111', 'American Pale Ale', 'Classic APA.', 5.6, 4.59),
    ('b0000020-bbbb-0020-bbbb-bbbbbbbbbbbb', 'caaa1111-aaaa-1111-aaaa-111111111111', 'Belgian Witbier', 'Spiced wheat beer.', 4.5, 3.69);

-- Insert into categories
INSERT INTO categories (id_category, name) VALUES
    ('c0000001-cccc-0001-cccc-cccccccccccc', 'Ale'),
    ('c0000002-cccc-0002-cccc-cccccccccccc', 'Lager'),
    ('c0000003-cccc-0003-cccc-cccccccccccc', 'Sour'),
    ('c0000004-cccc-0004-cccc-cccccccccccc', 'Hybrid');

-- Insert into beers_categories
INSERT INTO beers_categories (id_beer, id_category) VALUES
    ('b0000001-bbbb-0001-bbbb-bbbbbbbbbbbb', 'c0000001-cccc-0001-cccc-cccccccccccc'),
    ('b0000018-bbbb-0018-bbbb-bbbbbbbbbbbb', 'c0000004-cccc-0004-cccc-cccccccccccc');

-- Insert into ingredients
INSERT INTO ingredients (id_ingredient, type, name) VALUES
    ('77777777-7777-7777-7777-777777777777', 'Malt', 'Pale Malt'),
    ('88888888-8888-8888-8888-888888888888', 'Hops', 'Cascade');

-- Insert into beers_ingredients
INSERT INTO beers_ingredients (id_beer, id_ingredient) VALUES
    ('33333333-3333-3333-3333-333333333333', '77777777-7777-7777-7777-777777777777'),
    ('b0000010-bbbb-0010-bbbb-bbbbbbbbbbbb', '88888888-8888-8888-8888-888888888888');

-- Insert into photos
INSERT INTO photos (id_photo, id_beer, url) VALUES
    ('99999999-9999-9999-9999-999999999999', '33333333-3333-3333-3333-333333333333', 'https://example.com/lager.jpg'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'b0000018-bbbb-0018-bbbb-bbbbbbbbbbbb', 'https://example.com/ipa.jpg');

-- Insert into reviews
INSERT INTO reviews (id_review, id_user, id_beer, message, rating) VALUES
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Loved this Lager!', 1),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'b0000016-bbbb-0016-bbbb-bbbbbbbbbbbb', 'IPA is too bitter for me.', 2),
    ('1ccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'b0000017-bbbb-0017-bbbb-bbbbbbbbbbbb', 'IPA is too bitter for me.', 3),
    ('2ccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'b0000018-bbbb-0018-bbbb-bbbbbbbbbbbb', 'IPA is too bitter for me.', 4),
    ('3ccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'b0000020-bbbb-0020-bbbb-bbbbbbbbbbbb', 'IPA is too bitter for me.', 5);

-- Insert into favorites
INSERT INTO favorites (id_favorite, id_user, id_beer) VALUES
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333'),
    ('2ddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', 'b0000001-bbbb-0001-bbbb-bbbbbbbbbbbb'),
    ('3ddddddd-dddd-dddd-dddd-dddddddddddd', '11111111-1111-1111-1111-111111111111', 'b0000002-bbbb-0002-bbbb-bbbbbbbbbbbb'),
    ('4eeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', 'b0000001-bbbb-0001-bbbb-bbbbbbbbbbbb'),
    ('5eeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', 'b0000002-bbbb-0002-bbbb-bbbbbbbbbbbb'),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', 'b0000016-bbbb-0016-bbbb-bbbbbbbbbbbb');