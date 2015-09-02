DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    phonenumber bigint NOT NULL,
    name character varying(255)
);
