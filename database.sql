CREATE DATABASE cinema_booking;
USE cinema_booking;

CREATE TABLE movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE cinema (
    cinema_id INT PRIMARY KEY,
    cinema_name VARCHAR(100),
    zipcode VARCHAR(10),
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE ticket (
    ticket_id INT PRIMARY KEY,
    seat_number VARCHAR(10),
    price DECIMAL(5,2),
    movie_id INT,
    customer_id INT,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO movie VALUES
(1, 'Dark Knight', 'Action', 152),
(2, 'Inception', 'Sci-Fi', 148),
(3, 'Interstellar', 'Sci-Fi', 169),
(4, 'Joker', 'Drama', 122),
(5, 'Avengers', 'Action', 143),
(6, 'Frozen', 'Animation', 102),
(7, 'Titanic', 'Romance', 195),
(8, 'The Matrix', 'Sci-Fi', 136),
(9, 'Gladiator', 'Action', 155),
(10, 'The Godfather', 'Crime', 175);

INSERT INTO cinema VALUES
(1, 'Cinema One', '12345', 'Main Street', 'New York'),
(2, 'Cinema Two', '23456', 'Second Street', 'Los Angeles'),
(3, 'Cinema Three', '34567', 'Third Street', 'Chicago'),
(4, 'Cinema Four', '45678', 'Fourth Street', 'Houston'),
(5, 'Cinema Five', '56789', 'Fifth Street', 'Phoenix'),
(6, 'Cinema Six', '67890', 'Sixth Street', 'Philadelphia'),
(7, 'Cinema Seven', '78901', 'Seventh Street', 'San Antonio'),
(8, 'Cinema Eight', '89012', 'Eighth Street', 'San Diego'),
(9, 'Cinema Nine', '90123', 'Ninth Street', 'Dallas'),
(10, 'Cinema Ten', '01234', 'Tenth Street', 'San Jose');

INSERT INTO customer VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com'),
(3, 'Charlie', 'charlie@example.com'),
(4, 'David', 'david@example.com'),
(5, 'Eva', 'eva@example.com'),
(6, 'Frank', 'frank@example.com'),
(7, 'Grace', 'grace@example.com'),
(8, 'Helen', 'helen@example.com'),
(9, 'Ian', 'ian@example.com'),
(10, 'Jane', 'jane@example.com');

INSERT INTO ticket VALUES
(1, 'A1', 50.00, 1, 1),
(2, 'A2', 55.00, 2, 2),
(3, 'B1', 60.00, 3, 3),
(4, 'B2', 45.00, 4, 4),
(5, 'C1', 70.00, 5, 5),
(6, 'C2', 65.00, 6, 6),
(7, 'D1', 40.00, 7, 7),
(8, 'D2', 55.00, 8, 8),
(9, 'E1', 50.00, 9, 9),
(10,'E2', 75.00, 10, 10);

SELECT * FROM movie
WHERE title LIKE '%Dark%';

SELECT AVG(price) AS average_price FROM ticket;

SELECT * FROM movie
ORDER BY duration ASC;

SELECT c.name, m.title, t.seat_number, t.price
FROM ticket t
JOIN customer c ON t.customer_id = c.customer_id
JOIN movie m ON t.movie_id = m.movie_id;

SELECT * FROM ticket
WHERE price > 55;
