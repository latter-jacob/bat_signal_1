DROP TABLE IF EXISTS members;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  phonenumbers BIGINT NOT NULL UNIQUE,
  name VARCHAR(255)
);

INSERT INTO members (phonenumbers, name) VALUES (5183399563, 'Jake');
