-- 1
CREATE TABLE friends (id INTEGER, name TEXT, birthday DATE);
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30'),
    (2, 'Crisbel Enobay', '2000-11-27'),
    (3, 'Francheska Ancheta', '2000-08-09');
UPDATE friends
SET name = 'Storm'
WHERE name = 'Ororo Munroe';
-- 2
ALTER TABLE friends
ADD COLUMN email TEXT;
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE name = 'Storm';
-- 3
UPDATE friends
SET email = 'cenobay9@codecademy.com'
WHERE name = 'Crisbel Enobay';
UPDATE friends
SET email = 'fancheta09@codecademy.com'
WHERE name = 'Francheska Ancheta';
-- 4
DELETE FROM friends
WHERE name = 'Storm';
-- 5
INSERT INTO friends (id, name, birthday, email)
VALUES (
        4,
        'May Silvano',
        '2001-05-15',
        'msilvano15@codecademy.com'
    ),
    (
        5,
        'Nyzel Baydo',
        '2001-06-12',
        'nbaydo12@codecademy.com'
    ),
    (
        6,
        'Regine Arnez',
        '2000-09-21',
        'rarnez21@codecademy.com'
    );
-- 6
SELECT *
FROM friends;