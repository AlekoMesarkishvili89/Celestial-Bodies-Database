--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    number_of_stars integer NOT NULL,
    number_of_planets integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: joins; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.joins (
    joins_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number integer
);


ALTER TABLE public.joins OWNER TO freecodecamp;

--
-- Name: joins_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.joins_joins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joins_joins_id_seq OWNER TO freecodecamp;

--
-- Name: joins_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.joins_joins_id_seq OWNED BY public.joins.joins_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    moon_type character varying(40) NOT NULL,
    is_a_satellite boolean,
    moon_diameter numeric(10,2),
    distance_from_earth numeric(10,2),
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(40) NOT NULL,
    number_of_satellites integer NOT NULL,
    has_life boolean,
    planet_diameter numeric(10,2),
    description text,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(40) NOT NULL,
    number_of_satellites integer NOT NULL,
    description text,
    star_diameter numeric(10,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: joins joins_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joins ALTER COLUMN joins_id SET DEFAULT nextval('public.joins_joins_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Sprial galaxy', 30000, 345000, 'Where is located our earth');
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 'Sprial galaxy', 4530000, 345000, '');
INSERT INTO public.galaxy VALUES (3, 'Ring Star', 'Ring galaxy', 23412, 34212, 'where discover by me');
INSERT INTO public.galaxy VALUES (4, 'Whirpool Galaxy', 'Spiral galaxy', 23412, 34212, 'Null');
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', 'Eliptical galaxy', 2213412, 4334212, 'Located 600 millions light-years from Earth');
INSERT INTO public.galaxy VALUES (6, 'Hercules A', 'Eliptical galaxy', 221341, 4334212, 'The galaxy, 3C 348, is a supergiant elliptical galaxy');


--
-- Data for Name: joins; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.joins VALUES (1, 'pp', 5);
INSERT INTO public.joins VALUES (2, 'ppr', 3);
INSERT INTO public.joins VALUES (3, 'pprt', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'regular moon', true, 3400.00, 2346934.98, 'Moon is earth nutural satellite', 1);
INSERT INTO public.moon VALUES (2, 'Moonka', 'regular moon', true, 4675.00, 3423454.98, 'No info', 7);
INSERT INTO public.moon VALUES (3, 'Papas', 'regular moon', true, 7675.00, 342344.98, 'No info', 7);
INSERT INTO public.moon VALUES (4, 'Kalima', 'regular moon', true, 10675.00, 34244.98, 'No info', 7);
INSERT INTO public.moon VALUES (5, 'Kilimanjaro', 'regular moon', true, 10875.00, 34244.98, 'No info', 7);
INSERT INTO public.moon VALUES (6, 'Baiden', 'iregular moon', false, 110875.00, 34244.98, 'No info', 10);
INSERT INTO public.moon VALUES (7, 'Pelos', 'iregular moon', true, 875.00, 34244.98, 'No info', 10);
INSERT INTO public.moon VALUES (8, 'Malazonia', 'regular moon', true, 1875.00, 4244.98, 'No info', 8);
INSERT INTO public.moon VALUES (9, 'Ma', 'regular moon', true, 12875.00, 421244.98, 'No info', 5);
INSERT INTO public.moon VALUES (10, 'Manonu', 'regular moon', true, 12875.00, 21244.98, 'No info', 5);
INSERT INTO public.moon VALUES (11, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (12, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (13, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (14, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (15, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (16, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (17, 'Fellows', 'regular moon', true, 128475.00, 1221244.98, 'No info', 5);
INSERT INTO public.moon VALUES (18, 'Kilo', 'regular moon', true, 128475.00, 1221244.98, 'No info', 3);
INSERT INTO public.moon VALUES (19, 'Kilo', 'regular moon', true, 128475.00, 1221244.98, 'No info', 3);
INSERT INTO public.moon VALUES (20, 'Kilo', 'regular moon', true, 128475.00, 1221244.98, 'No info', 3);
INSERT INTO public.moon VALUES (21, 'Kilo', 'regular moon', true, 128475.00, 1221244.98, 'No info', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Silicate Planet', 1, true, 12756.00, 'only here is life', 1, 2);
INSERT INTO public.planet VALUES (2, 'Babajana', 'Silicate Planet', 1, true, 12756.00, 'only here is life', 2, 2);
INSERT INTO public.planet VALUES (3, 'Merkuri', 'Silicate Planet', 0, false, 4789.00, 'First plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (4, 'Merkuri', 'Silicate Planet', 0, false, 4789.00, 'First plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (5, 'Venus', 'Silicate Planet', 0, false, 120109.00, 'Second plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (6, 'Mars', 'Silicate Planet', 0, false, 6789.00, 'Frouth plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Gas Planet', 12, false, 58789.00, 'Six plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Gas Planet', 16, false, 658789.00, 'Sevens plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (9, 'Uran', 'Gas Planet', 8, false, 59789.00, 'Eight plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (10, 'Pluton', 'Gas Planet', 0, false, 389.00, 'Never plent in sun system', 1, 2);
INSERT INTO public.planet VALUES (11, 'Arion', 'Gas Planet', 0, false, 12389.00, 'Never plent in sun system', 3, 4);
INSERT INTO public.planet VALUES (12, 'Grakus', 'Gas Planet', 2, false, 12389.00, 'Never plent in sun system', 5, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Kornephoros', 'Giant Star', 0, 'Giant star varieble', 345645.45, 6);
INSERT INTO public.star VALUES (2, 'Sun', 'Medium Size Giant', 9, 'Sattelies are planets for stars', 435000.00, 1);
INSERT INTO public.star VALUES (4, 'RTE34', 'Red Giant', 5, 'No info', 34589.89, 2);
INSERT INTO public.star VALUES (5, 'RTE14', 'Red Giant', 5, 'No info', 34589.89, 3);
INSERT INTO public.star VALUES (6, 'RERTE14', 'Blue Giant', 8, 'No info', 34589.89, 4);
INSERT INTO public.star VALUES (7, 'Pikolo', 'Blue Giant', 8, 'Null', 34589.89, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: joins_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.joins_joins_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: joins joins_joins_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joins
    ADD CONSTRAINT joins_joins_id_key UNIQUE (joins_id);


--
-- Name: joins joins_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.joins
    ADD CONSTRAINT joins_pkey PRIMARY KEY (joins_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
