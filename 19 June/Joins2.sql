CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    post_text TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    comment_text TEXT,
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

INSERT INTO users (user_id, username) VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO posts (post_id, user_id, post_text) VALUES 
    (1, 1, 'First post by Alice'),
    (2, 2, 'Second post by Bob'),
    (3, 1, 'Another post by Alice');

INSERT INTO comments (comment_id, post_id, comment_text) VALUES 
    (1, 1, 'Comment on Alice''s first post'),
    (2, 3, 'Comment on Alice''s another post'),
    (3, 2, 'Comment on Bob''s second post');

SELECT users.username, posts.post_text
FROM users
INNER JOIN posts ON users.user_id = posts.user_id;

SELECT users.username, posts.post_text
FROM users
LEFT JOIN posts ON users.user_id = posts.user_id;

SELECT users.username, posts.post_text
FROM users
RIGHT JOIN posts ON users.user_id = posts.user_id;

SELECT users.username, posts.post_text
FROM users
FULL OUTER JOIN posts ON users.user_id = posts.user_id;

SELECT users.username, posts.post_text, comments.comment_text
FROM users
INNER JOIN posts ON users.user_id = posts.user_id
LEFT JOIN comments ON posts.post_id = comments.post_id;

SELECT u1.username AS user1, u2.username AS user2
FROM users u1
INNER JOIN users u2 ON u1.user_id != u2.user_id;

SELECT users.username, posts.post_text
FROM users
CROSS JOIN posts;
