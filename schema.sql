-- Active: 1694642626594@@127.0.0.1@3306@base
CREATE DATABASE todo_App;

USE todo_App;

CREATE TABLE
    users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(250),
        email VARCHAR(250) UNIQUE NOT NULL,
        password VARCHAR(250)
    );

CREATE TABLE
    todos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(250),
        completed BOOLEAN DEFAULT false,
        user_id INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
    );

CREATE TABLE
    shared_todos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        todo_id INT,
        user_id INT,
        shared_with_id INT,
        FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
        FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
    );

INSERT INTO
    users (name, email, password)
VALUES (
        'David',
        'user1@example.com',
        'password1'
    );

INSERT INTO
    users (name, email, password)
VALUES (
        'Juan',
        'user2@example.com',
        'password2'
    );

INSERT INTO
    todos (title, user_id)
    VALUES 
    ("Go to run in the morning 🏃‍♂️", 1 ), 
    ("🏢 work on project", 1),
    ("Read a book on college way 📖", 1 ), 
    ("🍝 cook dinner for family", 1 ),
    ("Listen to a podcast of Thecommit show 🎧", 1 ),
    ("Clean my house 🧹", 1);

INSERT INTO shared_todos (
  todo_id, user_id, shared_with_id)
  VALUES 
  (1, 1, 2);

