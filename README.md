# Celestial Bodies Database

A freeCodeCamp Relational Database project: a PostgreSQL database that models part of the universe with linked tables.

## Schema

- `galaxy` - name, type, age, distance from Earth, number of stars
- `star` - belongs to a galaxy; type, temperature, mass
- `planet` - belongs to a star; type, diameter, distance from its star
- `moon` - belongs to a planet; type, diameter, distance from its planet
- `planet_type` - reference table of planet types

Each child table is linked to its parent with a foreign key (galaxy → star → planet → moon), and the tables use primary keys, `NOT NULL` and unique constraints.

## Files

- `universe.sql` - full database dump (schema and data)

## Tech

PostgreSQL, SQL

## Run

```bash
psql -U postgres < universe.sql
```
