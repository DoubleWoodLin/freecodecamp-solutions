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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

CREATE TABLE galaxy(
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE,
age_in_millions_of_years INT,
galaxy_types VARCHAR(20),
description TEXT
);

CREATE TABLE star(
star_id SERIAL PRIMARY KEY,
galaxy_id INT REFERENCES galaxy(galaxy_id),
name VARCHAR(50) NOT NULL UNIQUE,
age_in_millions_of_years INT,
description TEXT
);

CREATE TABLE planet(
planet_id SERIAL PRIMARY KEY,
star_id INT REFERENCES star(star_id),
name VARCHAR(50) NOT NULL UNIQUE,
age_in_millions_of_years INT,
distance_from_earth NUMERIC,
is_spherical BOOLEAN
);

CREATE TABLE moon(
moon_id SERIAL PRIMARY KEY,
planet_id INT REFERENCES planet(planet_id),
name VARCHAR(50) NOT NULL UNIQUE,
age_in_millions_of_years INT,
has_life BOOLEAN,
is_spherical BOOLEAN
);

CREATE TABLE satellite(
  satellite_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  distance_from_earth NUMERIC
);

INSERT INTO galaxy(name) VALUES(
  'Milky Way'
),
('Andromeda'),
('Triangulum'),
('Large Magellanic Cloud'),
('Small Magellanic Cloud'),
('Whirlpool');

INSERT INTO star(name,galaxy_id) VALUES(
  'Sun',1
),
('Kepler-11',1),
('Vega',1),
('Antares',1),
('Sirius',1),
('TRAPPIST-1',1);

INSERT INTO planet(name,star_id) VALUES(
  'Earth',1
),
('Mercury',1),
('Venus',1),
('Mars',1),
('Jupiter',1),
('Saturn',1),
('Uranus',1),
('Neptune',1),
('Kepler-11b',2),
('Kepler-11c',2),
('Kepler-11d',2),
('Kepler-11e',2);

INSERT INTO moon(name,planet_id) VALUES
('Moon1',1),
('Moon2',1),
('Moon3',1),
('Moon4',1),
('Moon5',1),
('Moon6',1),
('Moon7',1),
('Moon8',1),
('Moon9',1),
('Moon10',1),
('Moon11',1),
('Moon12',1),
('Moon13',1),
('Moon14',1),
('Moon15',1),
('Moon16',1),
('Moon17',1),
('Moon18',1),
('Moon19',1),
('Moon20',1),
('Moon21',1),
('Moon22',1),
('Moon23',1);

INSERT INTO satellite(name) VALUES('s1'),('s2'),('s3');

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
--
-- PostgreSQL database dump complete
--
