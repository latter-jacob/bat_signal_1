--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: members; Type: TABLE; Schema: public; Owner: jacoblatter; Tablespace:
--

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    phonenumber bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE members OWNER TO jacoblatter;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: jacoblatter
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE members_id_seq OWNER TO jacoblatter;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacoblatter
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jacoblatter
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: members_phonenumber_key; Type: CONSTRAINT; Schema: public; Owner: jacoblatter; Tablespace:
--

-- ALTER TABLE ONLY members
--     ADD CONSTRAINT members_phonenumber_key UNIQUE (phonenumber);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: jacoblatter; Tablespace:
--

-- ALTER TABLE ONLY members
--     ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: jacoblatter
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jacoblatter;
GRANT ALL ON SCHEMA public TO jacoblatter;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
