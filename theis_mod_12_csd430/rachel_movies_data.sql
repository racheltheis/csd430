/* 
 Rachel Theis
 CSD 430
 7.13.25
*/

DROP TABLE IF EXISTS rachel_movies_data;

CREATE TABLE rachel_movies_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year_released INT,
    genre VARCHAR(100),
    director VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO rachel_movies_data (title, year_released, genre, director, rating) VALUES
('Fargo', 1996, 'Dark Comedy', 'The Coen Brothers', 8.1),
('The Silence of the Lambs', 1991, 'Horror', 'Jonathan Demme', 8.6),
('Pride and Prejudice', 2005, 'Historical Romance', 'Joe Wright', 7.8),
('Pulp Fiction', 1994, 'Crime', 'Quentin Tarantino', 8.8),
('Paris, Texas', 1984, 'Road', 'Wim Wenders', 8.1),
('Matilda', 1996, 'Childrens', 'Danny DeVito', 7.0),
('Dinner in America', 2020, 'Romance', 'Adam Rehmeier', 7.5),
('Scott Pilgrim vs. the World', 2010, 'Romantic Comedy', 'Edgar Wright', 7.5),
('Holes', 2003, 'Childrens', 'Andrew Davis', 7.0),
('Walk the Line', 2005, 'Biographical', 'James Mangold', 7.8),
('The Holdovers', 2023, 'Comedy Drama', 'Alexander Payne', 7.9),
('The Hunger Games', 2012, 'Dysopian Action', 'Gary Ross', 7.2);
