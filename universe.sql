--
-- PostgreSQL database dump
-- Author: Gaurav Sharma
-- Celestial Bodies Database Free Code Camp

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    stars_with_planet integer,
    brightest_star character varying(30),
    area_in_sq_deg numeric
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    description text,
    age_in_billion_years numeric,
    is_larger_than_milkyway boolean,
    constellation_id integer
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
    has_day_and_night boolean,
    planet_id integer,
    description character varying(60) NOT NULL,
    low_temp_in_celsius integer,
    high_temp_in_celsius integer
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
    type character varying(30) NOT NULL,
    age_in_billion_year numeric,
    length_of_year_in_earth_days integer,
    has_life boolean,
    has_moon boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    description text,
    age_in_billion_year numeric,
    is_luminous_than_sun boolean,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Andromeda is one of the 48 constellations listed by the 2nd-century Greco-Roman astronomer Ptolemy, and one of the 88 modern constellations.', 12, 'Alpha And', 722);
INSERT INTO public.constellation VALUES (2, 'Virgo', 'Virgo is one of the constellations of the zodiac. Its name is Latin for maiden, and its old astronomical symbol is Virgo symbol.', 29, 'Spica', 1294);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'Ursa Major (/ˈɜːrsə ˈmeɪdʒər/; also known as the Great Bear) is a constellation in the northern sky, whose associated mythology likely dates back into prehistory.', 21, 'Uma', 1280);
INSERT INTO public.constellation VALUES (4, '
Sagittarius', 'Sagittarius is one of the constellations of the zodiac and is located in the Southern celestial hemisphere.', 32, 'Sgr', 867);
INSERT INTO public.constellation VALUES (5, '
Triangulum', 'Triangulum is a small constellation in the northern sky. Its name is Latin for "triangle", derived from its three brightest stars, which form a long and narrow triangle.', 3, 'Beta Tri', 132);
INSERT INTO public.constellation VALUES (6, 'Dorado', 'Dorado (US: /dəˈreɪdoʊ/, also UK: /-ˈrɑːdoʊ/) is a constellation in the Southern Sky. It was named in the late 16th century and is now one of the 88 modern constellations.', 5, 'Alpha Dor', 179);
INSERT INTO public.constellation VALUES (7, 'Canes Venatici', 'Canes Venatici (/ˈkeɪniːz vɪˈnætɪsaɪ/) is one of the 88 constellations designated by the International Astronomical Union (IAU).', 4, 'Cor Caroli', 465);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'The Milky Way[c] is the galaxy that includes the Solar System, with the name describing the galaxys appearance from Earth', 13.61, false, 4);
INSERT INTO public.galaxy VALUES (2, 'Andromeda ', 'Barred Spiral', 'The Andromeda Galaxy is a barred spiral galaxy and is the closest major galaxy to the Milky Way, where the Solar System resides.', 10.01, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Peculiar', 'The Sombrero Galaxy (also known as Messier Object 104, M104 or NGC 4594) is a peculiar galaxy of unclear classification[5] in the constellation borders of Virgo and Corvus, being about 9.55 megaparsecs (31.1 million light-years)[2] from the Milky Way galaxy.', 12.50, false, 2);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Spiral', 'The Pinwheel Galaxy (also known as Messier 101, M101 or NGC 5457) is a face-on spiral galaxy 21 million light-years (6.4 megaparsecs)[5] away from Earth.', 0.021, true, 3);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', 'The Triangulum Galaxy is a spiral galaxy 2.73 million light-years (ly) from Earth in the constellation Triangulum. It is catalogued as Messier 33 or NGC (New General Catalogue) 598.', 6.75, false, 5);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'The Large Magellanic Cloud (LMC) is a satellite galaxy of the Milky Way.', 1.101, false, 6);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Spiral', 'The Whirlpool Galaxy, also known as Messier 51a (M51a) or NGC 5194, is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus.', 0.4, false, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, 'Earths Moon is the only place', -173, 127);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 4, 'Phobos is the larger of Mars two moons.', -112, -4);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 4, 'Deimos is the smaller of Mars two moons.', -120, -10);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5, 'moon with its own magnetic field.', -183, -113);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 5, 'Callisto is the most heavily cratered object', -190, -120);
INSERT INTO public.moon VALUES (6, 'Titan', true, 5, 'IAU WGPSN', -200, -100);
INSERT INTO public.moon VALUES (7, 'Enceladus', false, 5, 'IAU WGPSN', -190, -80);
INSERT INTO public.moon VALUES (8, 'Ariel', false, 6, 'Discovered 24.10.1851', -210, -100);
INSERT INTO public.moon VALUES (9, 'Oberon', false, 6, 'Dis. 11.01.1787', -230, -85);
INSERT INTO public.moon VALUES (10, 'Puck', false, 6, 'Dis. Dec. 1985', -250, -120);
INSERT INTO public.moon VALUES (11, 'Rosalind', false, 6, 'Dis. 13.01.1986', -256, -115);
INSERT INTO public.moon VALUES (12, 'Umbriel', false, 6, 'Dis. 24.10.1851', -145, -35);
INSERT INTO public.moon VALUES (13, 'Despina', false, 8, 'July 1989', -190, -90);
INSERT INTO public.moon VALUES (14, 'Halimede', false, 8, '14.07.2014', -185, -139);
INSERT INTO public.moon VALUES (15, 'Triton', false, 8, 'Surface made of nitrogen ice', -190, -159);
INSERT INTO public.moon VALUES (16, 'Charon', false, 9, 'Largest Plutos moon', -232, -190);
INSERT INTO public.moon VALUES (17, 'Hydra', false, 9, 'Dis. June 2005', -240, -185);
INSERT INTO public.moon VALUES (18, 'Kerberos', false, 9, 'Plutos tiny planet', -230, -183);
INSERT INTO public.moon VALUES (19, 'Nix', false, 9, 'June 2005', -235, -190);
INSERT INTO public.moon VALUES (20, 'Styx', false, 9, 'June 2012', -225, -189);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial Planet', 4.543, 365, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Terrestial', 4.503, 88, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestial', 4.503, 225, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestial', 4.603, 687, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4.603, 4333, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 4.503, 10759, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 4.503, 30687, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 4.503, 60190, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 4.6, 90530, false, true, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf Planet', 4.573, 1680, false, false, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 'Dwarf Planet', 4.5, 111449, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf Planet', 4.503, 104025, false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf Star', 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core.', 4.6, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 'Blue-White', 'Alpha Andromedae officially named Alpheratz is 97 light-years from the Sun and is the brightest star in the constellation of Andromeda when Beta Andromedae undergoes its periodical dimming.', 0.06, true, 2);
INSERT INTO public.star VALUES (3, 'Mizar', 'Binary Star', 'Mizar is a second-magnitude star in the handle of the Big Dipper asterism in the constellation of Ursa Major.', 0.370, true, 4);
INSERT INTO public.star VALUES (4, 'Beta Trianguli', 'Binary Star', 'Beta Trianguli is the Bayer designation for a binary star system in the constellation Triangulum, located about 127 light years from Earth.', 0.73, true, 5);
INSERT INTO public.star VALUES (5, 'HD 33579', 'Whhite/Yellow Hypergiant', 'HD 33579 lies in a part of the Hertzsprung–Russell diagram referred to as the Yellow Evolutionary Void because stars with that combination of luminosity and temperature are extremely unstable. ', 0.001, true, 6);
INSERT INTO public.star VALUES (6, 'UY Scuti', 'Red Hyper Giant', 'UY Scuti is an extreme red hypergiant or red supergiant star in the constellation Scutum.', 6.68, true, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

