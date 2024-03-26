--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

-- Setting various configurations
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Dropping existing database named "number_guess"
DROP DATABASE number_guess;

--
-- Creating a new database named "number_guess"
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

-- Altering ownership of the database
ALTER DATABASE number_guess OWNER TO freecodecamp;

-- Connecting to the "number_guess" database
\connect number_guess

-- Setting configurations for the connected database
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET default_table_access_method = heap;

--
-- Creating a new table named "users" in the public schema
--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);

-- Altering ownership of the "users" table
ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Creating a sequence named "users_user_id_seq" for the "user_id" column in the "users" table
--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Altering ownership of the sequence
ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

-- Setting the sequence to be owned by the "user_id" column
ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;

--
-- Setting default value for "user_id" column using the created sequence
--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);

--
-- Inserting data into the "users" table
--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.users VALUES (15, 'user_1697615521615', 2, 611);
INSERT INTO public.users VALUES (14, 'user_1697615521616', 5, 24);
INSERT INTO public.users VALUES (17, 'user_1697615678881', 2, 350);
INSERT INTO public.users VALUES (16, 'user_1697615678882', 5, 34);

--
-- Setting the sequence value to match the latest inserted user ID
--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);

--
-- Adding constraints to the "users" table
--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);

-- Adding a unique constraint to the "username" column
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);

--
-- PostgreSQL database dump complete
--

