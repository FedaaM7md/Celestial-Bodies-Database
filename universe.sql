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
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    number_of_stars integer,
    discovery_year integer,
    has_life boolean,
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    moon_type character varying(30) NOT NULL,
    diameter integer,
    distance_from_planet numeric,
    has_atmosphere boolean,
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    diameter integer,
    distance_from_star numeric,
    has_life boolean,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_habitable boolean
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30) NOT NULL,
    temperature integer,
    mass numeric,
    is_spherical boolean,
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, 200000, NULL, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, 1000000, 964, false, 'The nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000, 40000, 1654, false, 'A member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 163000, 30000, 964, false, 'A satellite galaxy of the Milky Way');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 13000, 200000, 30000, 964, false, 'A dwarf galaxy near the Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 13000, 31000000, 800000, 1781, false, 'A galaxy known for its bright central bulge');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 3, 'Natural', 3474, 384400, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Natural', 22, 9376, false, 'One of the two moons of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Natural', 12, 23463, false, 'The smaller moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Natural', 3643, 421700, false, 'A volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Natural', 3122, 671100, false, 'An icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Natural', 5268, 1070400, false, 'The largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Natural', 4821, 1882700, false, 'An ancient moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Natural', 5150, 1221870, true, 'A moon of Saturn with a thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Natural', 504, 238000, false, 'An icy moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 'Natural', 1528, 527000, false, 'A moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 'Natural', 1469, 3561000, false, 'A moon with contrasting bright and dark hemispheres');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 'Natural', 1123, 377400, false, 'An icy moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 'Natural', 1062, 294700, false, 'A moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 'Natural', 396, 185500, false, 'A small moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 'Natural', 472, 129900, false, 'A moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Natural', 1158, 191000, false, 'A moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'Natural', 1169, 266000, false, 'A dark moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'Natural', 1578, 436000, false, 'The largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 'Natural', 1523, 583500, false, 'An outer moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Natural', 2707, 354800, false, 'A large moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 4879, 0.39, false, 'The smallest planet in our solar system');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 12104, 0.72, false, 'The hottest planet in our solar system');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 12742, 1.00, true, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 6779, 1.52, false, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 139820, 5.20, false, 'The largest planet in our solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 116460, 9.58, false, 'Famous for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 50724, 19.20, false, 'An ice giant with an unusual rotation');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 49244, 30.05, false, 'The farthest known planet in our solar system');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, 'Terrestrial', 14000, 0.36, false, 'An exoplanet in the habitable zone');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 'Terrestrial', 12000, 0.05, false, 'An exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Vega b', 4, 'Gas Giant', 90000, 2.00, false, 'A fictional training planet');
INSERT INTO public.planet VALUES (12, 'Rigel b', 6, 'Gas Giant', 110000, 3.00, false, 'A fictional training planet');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces', true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets primarily composed of gases', false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets containing large amounts of icy materials', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 5778, 1, true, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 9940, 2.06, true, 'One of the brightest stars in the night sky');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M-type', 3042, 0.12, true, 'The closest known star to the Sun');
INSERT INTO public.star VALUES (4, 'Vega', 2, 'A-type', 9602, 2.14, true, 'A bright star in the constellation Lyra');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 'M-type', 3500, 16.5, true, 'A red supergiant star');
INSERT INTO public.star VALUES (6, 'Rigel', 4, 'B-type', 12100, 21, true, 'A blue supergiant star');


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

