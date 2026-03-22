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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth integer,
    age_in_millions_of_years numeric(8,1)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_date date,
    radius_km integer,
    orbital_period_days numeric(4,1),
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    moon_count integer,
    star_id integer NOT NULL,
    planet_types_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_special boolean,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(8,1),
    alias character varying(100),
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The barred spiral galaxy containing our Solar System.', 0, 13600.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest major galaxy to the Milky Way, also known as M31.', 2537000, 10000.0);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the constellation Triangulum, third largest in the Local Group.', 2730000, 10000.0);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy located in the constellation Canes Venatici.', 23000000, 400.5);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A lenticular galaxy in Virgo with a prominent dust lane and large central bulge.', 29300000, 13250.0);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'A spiral galaxy about 12 million light-years away in Ursa Major.', 11800000, 13000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', '1610-01-07', 1737, 27.3, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', '1877-08-18', 11, 0.3, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', '1877-08-12', 6, 1.3, 4);
INSERT INTO public.moon VALUES (4, 'Io', '1610-01-08', 1821, 1.8, 5);
INSERT INTO public.moon VALUES (5, 'Europa', '1610-01-08', 1560, 3.6, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', '1610-01-07', 2634, 7.2, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', '1610-01-07', 2410, 16.7, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', '1892-09-09', 83, 0.5, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', '1904-12-03', 85, 250.6, 5);
INSERT INTO public.moon VALUES (10, 'Titan', '1655-03-25', 2574, 15.9, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', '1672-12-23', 763, 4.5, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', '1671-10-25', 734, 79.3, 6);
INSERT INTO public.moon VALUES (13, 'Dione', '1684-03-21', 561, 2.7, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', '1684-03-21', 531, 1.9, 6);
INSERT INTO public.moon VALUES (15, 'Enceladus', '1789-08-28', 252, 1.4, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', '1789-09-17', 198, 0.9, 6);
INSERT INTO public.moon VALUES (17, 'Triton', '1846-10-10', 1353, 5.9, 12);
INSERT INTO public.moon VALUES (18, 'Nereid', '1949-05-01', 170, 360.1, 12);
INSERT INTO public.moon VALUES (19, 'Alpheratz Beta', '2021-05-14', 450, 12.5, 8);
INSERT INTO public.moon VALUES (20, 'Sombrero Alpha', '2019-11-02', 890, 45.0, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 0, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 95, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 146, 1, 2);
INSERT INTO public.planet VALUES (7, 'Proxima b', false, 0, 2, 1);
INSERT INTO public.planet VALUES (8, 'Alpheratz Prime', false, 3, 3, 4);
INSERT INTO public.planet VALUES (9, 'Alrescha Major', false, 1, 4, 6);
INSERT INTO public.planet VALUES (10, 'Whirlpool IX', false, 0, 5, 5);
INSERT INTO public.planet VALUES (11, 'Sombrero Minor', false, 12, 6, 4);
INSERT INTO public.planet VALUES (12, 'Neptune', false, 14, 1, 3);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', false, '(Rocky): Small, solid surfaces made of rock and metal (e.g: Mercury, Venus, Earth, Mars).');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', false, 'Massive planets mostly made of hydrogen and helium (e.g: Jupiter, Saturn).');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', false, 'Large planets containing "ices" like water, methane, and ammonia (e.g: Uranus, Neptune).');
INSERT INTO public.planet_types VALUES (4, 'Super-Earths', false, 'Larger than Earth but smaller than Neptune. Can be rocky or ocean-covered.');
INSERT INTO public.planet_types VALUES (5, 'Hot Jupiters', false, 'Gas giants that orbit extremely close to their stars, reaching scorching temperatures.');
INSERT INTO public.planet_types VALUES (6, 'Mini-Neptunes', false, 'Smaller than Neptune with thick, gassy atmospheres.');
INSERT INTO public.planet_types VALUES (7, 'Rogue Planets', false, '"Orphan" worlds that drift through space without orbiting a star.');
INSERT INTO public.planet_types VALUES (8, 'Dwarf Planets', true, 'Spherical bodies that havent cleared their orbital path (Pluto, Ceres).');
INSERT INTO public.planet_types VALUES (9, 'Carbon Planets', true, 'Theoretical worlds where carbon outweighs oxygen, potentially featuring layers of graphite or diamond.
');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603.0, 'Sol', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4850.0, 'Alpha Centauri C', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 70.0, 'Alpha Andromedae', 2);
INSERT INTO public.star VALUES (4, 'Alrescha', 400.0, 'Alpha Piscium', 3);
INSERT INTO public.star VALUES (5, 'Whirlpool Star A', 10.5, 'M51-V1', 4);
INSERT INTO public.star VALUES (6, 'Sombrero Center', 13000.0, 'M104-Nucleus', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

