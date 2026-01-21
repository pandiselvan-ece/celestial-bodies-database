
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET default_tablespace = '';
SET default_with_oids = false;

-- Drop and Create Database
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

-- Create Tables
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth NUMERIC,
    is_active BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    brightness_index INT NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    star_id INT NOT NULL REFERENCES star(star_id),
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    radius_km INT NOT NULL,
    is_spherical BOOLEAN NOT NULL
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    visible_season VARCHAR(20) NOT NULL
);

-- Insert Data
INSERT INTO galaxy (name, age_in_millions_of_years, is_active) VALUES ('Milky Way', 13600, TRUE), ('Andromeda', 10000, TRUE), ('Triangulum', 12000, FALSE), ('Sombrero', 13000, TRUE), ('Whirlpool', 400, TRUE), ('Centaurus A', 13000, FALSE);
INSERT INTO star (name, galaxy_id, brightness_index, is_spherical) VALUES ('Sun', 1, 1, TRUE), ('Sirius', 1, 2, TRUE), ('Betelgeuse', 1, 3, TRUE), ('Alpha Centauri', 1, 4, TRUE), ('Rigel', 1, 5, TRUE), ('Proxima Centauri', 1, 6, TRUE);
INSERT INTO planet (name, star_id, has_life, is_spherical) VALUES ('Earth', 1, TRUE, TRUE), ('Mars', 1, FALSE, TRUE), ('Jupiter', 1, FALSE, TRUE), ('Saturn', 1, FALSE, TRUE), ('Venus', 1, FALSE, TRUE), ('Mercury', 1, FALSE, TRUE), ('Uranus', 1, FALSE, TRUE), ('Neptune', 1, FALSE, TRUE), ('Proxima b', 6, FALSE, TRUE), ('Kepler-186f', 2, FALSE, TRUE), ('Gliese 581g', 3, FALSE, TRUE), ('HD 209458 b', 4, FALSE, TRUE);
INSERT INTO moon (name, planet_id, radius_km, is_spherical) VALUES ('Moon', 1, 1737, TRUE), ('Phobos', 2, 11, FALSE), ('Deimos', 2, 6, FALSE), ('Io', 3, 1821, TRUE), ('Europa', 3, 1560, TRUE), ('Ganymede', 3, 2634, TRUE), ('Callisto', 3, 2410, TRUE), ('Titan', 4, 2574, TRUE), ('Enceladus', 4, 252, TRUE), ('Mimas', 4, 198, TRUE), ('Tethys', 4, 531, TRUE), ('Dione', 4, 561, TRUE), ('Rhea', 4, 763, TRUE), ('Iapetus', 4, 734, TRUE), ('Miranda', 7, 235, TRUE), ('Ariel', 7, 578, TRUE), ('Umbriel', 7, 584, TRUE), ('Titania', 7, 788, TRUE), ('Oberon', 7, 761, TRUE), ('Triton', 8, 1353, TRUE);
INSERT INTO constellation (name, visible_season) VALUES ('Orion', 'Winter'), ('Lyra', 'Summer'), ('Ursa Major', 'All year');