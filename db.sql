-- Create the database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS movie_reviews_db;

-- Use the database
USE movie_reviews_db;

--1. Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE,
    password TEXT,
    mobile TEXT,
    birth DATE
);

--2. Table: movies
CREATE TABLE IF NOT EXISTS movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title TEXT,
    `release` DATE -- 'release' is a keyword, so backticks are safer
);

--3. Table: reviews
CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    review TEXT,
    rating INT,
    user_id INT,
    modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

--4. Table: shares
CREATE TABLE IF NOT EXISTS shares (
    review_id INT,
    user_id INT,
    PRIMARY KEY (review_id, user_id), -- Composite primary key
    FOREIGN KEY (review_id) REFERENCES reviews(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);