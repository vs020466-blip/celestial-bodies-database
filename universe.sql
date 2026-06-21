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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(128) NOT NULL,
    galaxy_id integer NOT NULL,
    is_periodic boolean NOT NULL,
    tail_length_km numeric(12,2) NOT NULL,
    nucleus_diameter_km numeric(10,3) NOT NULL,
    discovered_year integer NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(128) NOT NULL,
    galaxy_types character varying(64) NOT NULL,
    distance_from_earth numeric(16,2) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    stars_count integer NOT NULL,
    discovered_year integer NOT NULL
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
    name character varying(128) NOT NULL,
    planet_id integer NOT NULL,
    is_habitable boolean NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    mass numeric(12,6) NOT NULL,
    description text
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
    name character varying(128) NOT NULL,
    star_id integer NOT NULL,
    planet_types character varying(64) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    radius_km numeric(12,2) NOT NULL,
    description text
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
    name character varying(128) NOT NULL,
    galaxy_id integer NOT NULL,
    star_types character varying(64) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(10,4) NOT NULL,
    is_supernova boolean NOT NULL,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 1, true, 240000.00, 15.000, 1758, 'A famous periodic comet visible from Earth every 76 years.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, false, 350000.00, 60.000, 1995, 'A bright non-periodic comet seen in 1997.');
INSERT INTO public.comet VALUES (3, 'Comet Encke', 1, true, 160000.00, 4.800, 1786, 'A short-period comet within the Solar System.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, true, 'Home galaxy with a barred spiral structure.', 250000000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000.00, false, 'Nearest large spiral galaxy to the Milky Way.', 1000000000, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2737000.00, false, 'A smaller spiral galaxy in the Local Group.', 40000000, 1764);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 53000000.00, false, 'A giant elliptical galaxy with a supermassive black hole.', 2000000000, 1781);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29000000.00, false, 'A bright spiral galaxy with a large central bulge.', 80000000, 1781);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000.00, false, 'A nearby irregular satellite galaxy.', 10000000, 1751);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, true, 27, 0.073460, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 0, 0.000000, 'One of Mars'' two small moons.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 1, 0.000000, 'The smaller, outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, false, false, 1, 0.089000, 'A volcanic moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, false, 3, 0.048000, 'Icy moon of Jupiter with a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, false, 7, 0.148000, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, false, 17, 0.107000, 'Heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, false, false, 16, 0.134000, 'Large moon of Saturn with an atmosphere.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, false, false, 1, 0.000018, 'Icy Saturn moon with water geysers.');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, false, false, 1, 0.000004, 'Small moon of Saturn with a large crater.');
INSERT INTO public.moon VALUES (11, 'Oberon', 7, false, false, 13, 0.000350, 'One of Uranus'' moons.');
INSERT INTO public.moon VALUES (12, 'Titania', 7, false, false, 8, 0.000350, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (13, 'Triton', 8, false, false, 6, 0.022000, 'Large moon of Neptune with retrograde orbit.');
INSERT INTO public.moon VALUES (14, 'Charon', 3, false, false, 6, 0.001586, 'A large moon in a dwarf planet system.');
INSERT INTO public.moon VALUES (15, 'Europa II', 9, true, false, 5, 0.000200, 'A hypothetical moon around Kepler-186f.');
INSERT INTO public.moon VALUES (16, 'Proxima Moon A', 10, false, false, 11, 0.000900, 'A moon orbiting Proxima b.');
INSERT INTO public.moon VALUES (17, 'Rigel Moon Alpha', 11, false, false, 4, 0.004500, 'A moon orbiting the gas giant around Rigel.');
INSERT INTO public.moon VALUES (18, 'Triangulum Moon One', 12, false, false, 10, 0.002000, 'A moon orbiting a Triangulum galaxy planet.');
INSERT INTO public.moon VALUES (19, 'Triangulum Moon Two', 12, false, false, 12, 0.003000, 'A second moon in Triangulum Terra system.');
INSERT INTO public.moon VALUES (20, 'Kepler Moon 2', 9, false, false, 9, 0.001200, 'Another moon around Kepler-186f.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, true, 4500, 2440.00, 'Closest planet to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, true, 4500, 6052.00, 'Second planet with thick clouds and volcanic surface.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 4500, 6371.00, 'The home world of humanity.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, true, 4500, 3389.50, 'Red planet with polar ice caps.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 4600, 69911.00, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 4600, 58232.00, 'Ringed gas giant.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 4500, 25362.00, 'Ice giant with a tilted axis.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 4500, 24622.00, 'Blue ice giant far from the Sun.');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, 'Terrestrial', true, true, 4000, 11300.00, 'An exoplanet in the habitable zone of Kepler-186.');
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 'Terrestrial', false, true, 4500, 7100.00, 'A rocky exoplanet around Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'Rigel Planet 1', 2, 'Gas Giant', false, true, 3000, 70000.00, 'A gas giant orbiting Rigel.');
INSERT INTO public.planet VALUES (12, 'Triangulum Terra', 3, 'Terrestrial', false, true, 5000, 5200.00, 'A rocky world in the Triangulum galaxy.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'Yellow Dwarf', 4600, 1.0000, false, 'The star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'Rigel', 1, 'Blue Supergiant', 8000, 18.0000, false, 'Bright blue supergiant in Orion.');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'White Main Sequence', 242, 2.0630, false, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 4500, 0.1230, false, 'Closest known star to the Solar System.');
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 1, 'Yellow Dwarf', 5500, 1.1000, false, 'A nearby binary star in Centaurus.');
INSERT INTO public.star VALUES (6, 'NGC 4889 Star', 4, 'Red Giant', 12000, 3.5000, false, 'A massive star in the core of M87.');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

