DROP TABLE IF EXISTS members;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  phonenumber BIGINT NOT NULL UNIQUE,
  name VARCHAR(255)
);

INSERT INTO members (phonenumber, name) VALUES (5183399563, 'Jake Latter');
INSERT INTO members (phonenumber, name) VALUES (2029997303, 'Jake Gibberson');
