--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    score integer DEFAULT 0 NOT NULL,
    user_id integer,
    game_num integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: participants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.participants (
    username character varying(22) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.participants OWNER TO freecodecamp;

--
-- Name: participants_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.participants_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participants_user_id_seq OWNER TO freecodecamp;

--
-- Name: participants_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.participants_user_id_seq OWNED BY public.participants.user_id;


--
-- Name: participants user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.participants ALTER COLUMN user_id SET DEFAULT nextval('public.participants_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (115, 209, 1);
INSERT INTO public.games VALUES (460, 209, 0);
INSERT INTO public.games VALUES (53, 208, 4);
INSERT INTO public.games VALUES (866, 208, 3);
INSERT INTO public.games VALUES (457, 208, 2);
INSERT INTO public.games VALUES (209, 208, 1);
INSERT INTO public.games VALUES (647, 208, 0);
INSERT INTO public.games VALUES (4, 210, 0);
INSERT INTO public.games VALUES (2, 211, 0);
INSERT INTO public.games VALUES (5, 207, 1);
INSERT INTO public.games VALUES (2, 207, 0);
INSERT INTO public.games VALUES (566, 213, 1);
INSERT INTO public.games VALUES (471, 213, 0);
INSERT INTO public.games VALUES (649, 212, 4);
INSERT INTO public.games VALUES (970, 212, 3);
INSERT INTO public.games VALUES (743, 212, 2);
INSERT INTO public.games VALUES (831, 212, 1);
INSERT INTO public.games VALUES (523, 212, 0);


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.participants VALUES ('Neil', 207);
INSERT INTO public.participants VALUES ('user_1785632352856', 208);
INSERT INTO public.participants VALUES ('user_1785632352855', 209);
INSERT INTO public.participants VALUES ('Anna', 210);
INSERT INTO public.participants VALUES ('Bob', 211);
INSERT INTO public.participants VALUES ('user_1785632609085', 212);
INSERT INTO public.participants VALUES ('user_1785632609084', 213);


--
-- Name: participants_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.participants_user_id_seq', 213, true);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (user_id);


--
-- Name: participants participants_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.participants(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

