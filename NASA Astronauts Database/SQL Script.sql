#Answering below questions to demonstrate SQL skills 
#Skills used: Aggregate Functions, Group By, Order By, Having, Case.

#1. What is the average number of space flights hours since 1975? 
    SELECT ROUND(AVG(Space_Flight_hr),2) as AVG_Flight_hrs_since1975
    FROM astronauts 
    WHERE year > 1974;

#2. In what year, the highest number of space flights taken by any astronaut?
    SELECT distinct year 
    FROM astronauts 
    WHERE Space_Flights = (SELECT max(Space_Flights) FROM astronauts);

#3. Find out the names of US Navy or US Air Force astronauts who did their graduate major in Aeronautical.
    SELECT name
    FROM astronauts
    WHERE Military_Branch IN ('US Air Force', 'US Navy')
    AND Graduate_Major like '%Aeronautical%';

#4. Find the number of astronauts per year who held military rank of either Captain or Major.
    SELECT count(name), year
    FROM astronauts
    WHERE Military_Rank = 'Captain' OR Military_Rank = 'Major'
    GROUP BY year;

#5. Find out all the years where combined space flight hrs are more than 10000 and list them from highest to lowest hrs.
    SELECT year, sum(space_flight_hr) as Total_flight_hrs
    FROM astronauts 
    GROUP BY year
    HAVING Total_flight_hrs > 10000
    ORDER BY Total_flight_hrs desc;

#6 How many astronauts spent more or less time than average space walks hrs?
   SELECT count(name) as Number_of_Astronauts, 
   CASE
        WHEN space_walks_hr > (SELECT AVG(space_walks_hr) FROM astronauts) THEN 'Above Average'
        ELSE 'Below Average'
   END AS Time_Spent_on_Space_Walks
   FROM astronauts
   GROUP BY Time_Spent_on_Space_Walks;
