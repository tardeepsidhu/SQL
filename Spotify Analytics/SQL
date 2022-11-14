#Performed analytics on the imported data using SQL. 
#Skills used: Aggregate functions, Group By, Order By, Subqueries, CASE


#1. List top 10 songs of the year with their artist by popularity
    SELECT track_name, artist_name
    FROM BIT_DB.SpotifyData
    ORDER BY popularity desc
    LIMIT 10;

#2. Find the song with the longest duration and list the track name and artist name.
    SELECT track_name, artist_name
    FROM BIT_DB.SpotifyData
    WHERE duration_ms = (SELECT max(duration_ms) FROM BIT_DB.SpotifyData);

#3. Find the average dancebility, energy and loudness rate for all the songs with popularity over 75 and duration over 3 minutes. 
    SELECT avg(danceability), avg(energy), avg(loudness) 
    FROM BIT_DB.SpotifyData
    WHERE popularity > 75 AND duration_ms > (3*60*1000);

#4. Find out all songs and their popularity from highest to lowest with tempo more than 130 and valence less than 0.50
    SELECT track_name, popularity
    FROM BIT_DB.SpotifyData
    WHERE tempo > 130 AND valence < 0.50
    ORDER BY popularity desc;

#5. Find out artists and track count with more than 1 track in the list and order by highest to lowest track count.
    SELECT artist_name, count(track_name) as Track_count
    FROM BIT_DB.SpotifyData
    GROUP BY artist_name
    HAVINg Track_count > 1
    ORDER BY Track_count desc;

#6. Categorize the number of tracks by their level of acousticness 
    SELECT count(track_name), 
    CASE
        WHEN acousticness > 0.661 THEN 'Very High'
        WHEN acousticness > 0.496 THEN 'High'
        WHEN acousticness > 0.331 THEN 'Medium'
        WHEN acousticness > 0.166 THEN 'Low'
        ELSE 'Very Low'
    END as acousticness_level     
    FROM BIT_DB.SpotifyData
    GROUP BY acousticness_level
    ORDER BY acousticness; 
