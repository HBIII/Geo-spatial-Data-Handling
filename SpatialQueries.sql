#creating table to store loaction name along with its coordinates

create table spatial_locations (
ID Serial Primary key,
location_name varchar(50),
coordinates geometry(point));

#inserting data into the above created table

insert into spatial_locations(location_name,coordinates)
values('Home', ST_SetSRID(ST_MakePoint(-118.288210,34.030191),1));

insert into spatial_locations(location_name,coordinates)
values('Leavey Library', ST_SetSRID(ST_MakePoint(-118.282980,34.021911),1));

insert into spatial_locations(location_name,coordinates)
values('Galen Center', ST_SetSRID(ST_MakePoint(-118.279938,34.021118),1));

insert into spatial_locations(location_name,coordinates)
values('School of Cinematics Arts', ST_SetSRID(ST_MakePoint(-118.286492,34.023642),1));

insert into spatial_locations(location_name,coordinates)
values('Usc Village', ST_SetSRID(ST_MakePoint(-118.284894,34.025383),1));

insert into spatial_locations(location_name,coordinates)
values('Viterbi building', ST_SetSRID(ST_MakePoint(-118.288854,34.020522),1));

insert into spatial_locations(location_name,coordinates)
values('Engemenn Health Center', ST_SetSRID(ST_MakePoint(-118.288914,34.025280),1));

insert into spatial_locations(location_name,coordinates)
values('Popovich Hall', ST_SetSRID(ST_MakePoint(-118.282987,34.018934),1));

insert into spatial_locations(location_name,coordinates)
values('Ronald Tutor Campus Center', ST_SetSRID(ST_MakePoint(-118.286500,34.020256),1));

insert into spatial_locations(location_name,coordinates)
values('City Park Appartment', ST_SetSRID(ST_MakePoint(-118.290519,34.027732),1));

insert into spatial_locations(location_name,coordinates)
values('Shrine auditorium', ST_SetSRID(ST_MakePoint(-118.281317,34.023584),1));

insert into spatial_locations(location_name,coordinates)
values('Parkside apts', ST_SetSRID(ST_MakePoint(-118.291052,34.019065),1));

#Query for getting coordinates of convex hull  

SELECT ST_AsText(ST_ConvexHull(ST_Collect(coordinates))) 
AS convex_hull
FROM spatial_locations;

#Query for getting name of 4 nearest neighbour from 'Home' location

SELECT location_name
FROM spatial_locations WHERE location_name<>'Home' 
ORDER BY coordinates <-> ST_SetSRID(ST_makepoint(-118.288210,34.030191),1) LIMIT 4;