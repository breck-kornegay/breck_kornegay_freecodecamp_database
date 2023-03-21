--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (69, 2018, 'Final', 843, 844, 4, 2);
INSERT INTO public.games VALUES (70, 2018, 'Third Place', 845, 846, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Semi-Final', 844, 846, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Semi-Final', 843, 845, 1, 0);
INSERT INTO public.games VALUES (73, 2018, 'Quarter-Final', 844, 852, 3, 2);
INSERT INTO public.games VALUES (74, 2018, 'Quarter-Final', 846, 854, 2, 0);
INSERT INTO public.games VALUES (75, 2018, 'Quarter-Final', 845, 856, 2, 1);
INSERT INTO public.games VALUES (76, 2018, 'Quarter-Final', 843, 858, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 846, 860, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 854, 862, 1, 0);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 845, 864, 3, 2);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 856, 866, 2, 0);
INSERT INTO public.games VALUES (81, 2018, 'Eighth-Final', 844, 868, 2, 1);
INSERT INTO public.games VALUES (82, 2018, 'Eighth-Final', 852, 870, 2, 1);
INSERT INTO public.games VALUES (83, 2018, 'Eighth-Final', 858, 872, 2, 1);
INSERT INTO public.games VALUES (84, 2018, 'Eighth-Final', 843, 874, 4, 3);
INSERT INTO public.games VALUES (85, 2014, 'Final', 875, 874, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Third Place', 877, 856, 3, 0);
INSERT INTO public.games VALUES (87, 2014, 'Semi-Final', 874, 877, 1, 0);
INSERT INTO public.games VALUES (88, 2014, 'Semi-Final', 875, 856, 7, 1);
INSERT INTO public.games VALUES (89, 2014, 'Quarter-Final', 877, 884, 1, 0);
INSERT INTO public.games VALUES (90, 2014, 'Quarter-Final', 874, 845, 1, 0);
INSERT INTO public.games VALUES (91, 2014, 'Quarter-Final', 856, 860, 2, 1);
INSERT INTO public.games VALUES (92, 2014, 'Quarter-Final', 875, 843, 1, 0);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 856, 892, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 860, 858, 2, 0);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 843, 896, 2, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 875, 898, 2, 1);
INSERT INTO public.games VALUES (97, 2014, 'Eighth-Final', 877, 866, 2, 1);
INSERT INTO public.games VALUES (98, 2014, 'Eighth-Final', 884, 902, 2, 1);
INSERT INTO public.games VALUES (99, 2014, 'Eighth-Final', 874, 862, 1, 0);
INSERT INTO public.games VALUES (100, 2014, 'Eighth-Final', 845, 906, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (843, 'France');
INSERT INTO public.teams VALUES (844, 'Croatia');
INSERT INTO public.teams VALUES (845, 'Belgium');
INSERT INTO public.teams VALUES (846, 'England');
INSERT INTO public.teams VALUES (852, 'Russia');
INSERT INTO public.teams VALUES (854, 'Sweden');
INSERT INTO public.teams VALUES (856, 'Brazil');
INSERT INTO public.teams VALUES (858, 'Uruguay');
INSERT INTO public.teams VALUES (860, 'Colombia');
INSERT INTO public.teams VALUES (862, 'Switzerland');
INSERT INTO public.teams VALUES (864, 'Japan');
INSERT INTO public.teams VALUES (866, 'Mexico');
INSERT INTO public.teams VALUES (868, 'Denmark');
INSERT INTO public.teams VALUES (870, 'Spain');
INSERT INTO public.teams VALUES (872, 'Portugal');
INSERT INTO public.teams VALUES (874, 'Argentina');
INSERT INTO public.teams VALUES (875, 'Germany');
INSERT INTO public.teams VALUES (877, 'Netherlands');
INSERT INTO public.teams VALUES (884, 'Costa Rica');
INSERT INTO public.teams VALUES (892, 'Chile');
INSERT INTO public.teams VALUES (896, 'Nigeria');
INSERT INTO public.teams VALUES (898, 'Algeria');
INSERT INTO public.teams VALUES (902, 'Greece');
INSERT INTO public.teams VALUES (906, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 100, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 906, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

