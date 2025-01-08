
--LAB 1

--Part – A
--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS

--2. Find top 2 albums released before 2010.
SELECT TOP 2 Album_title FROM Albums

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SONGS VALUES(1245, 'Zaroor', 2.55, 'Feel good', 1005)

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS 
SET GENRE = 'Happy'
where Song_title = 'Zaroor'

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM Artist WHERE Artist_name = 'ED SHEERAN'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SONGS 
ADD RATING decimal(3,2)

--7. Retrieve songs whose title starts with 'S'.
SELECT Song_title from Songs WHERE Song_title LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT Song_title FROM SONGS WHERE Song_title LIKE '%Everybody%'

--9. Display Artist Name in Uppercase.
SELECT UPPER(ARTIST_NAME) FROM Artists

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(DURATION) FROM SONGS WHERE Song_title='Good Luck';

--11. Find Current Date.
SELECT GETDATE()

--12. Find the number of albums for each artist.
SELECT b.Artist_name,COUNT(a.Album_id) FROM Albums a
JOIN Artists b
ON a.ARTIST_ID = b.ARTIST_ID
GROUP BY b.Artist_name

select * from Artists
select * from Albums
select * from Songs

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID FROM SONGS S
GROUP BY Album_id
HAVING COUNT(SONG_ID)>5

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT SONG_TITLE FROM SONGS WHERE Album_id=(
	SELECT ALBUM_ID FROM ALBUMS WHERE Album_title='ALBUM1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’(using Subquery)
SELECT ALBUM_TITLE FROM ALBUMS WHERE ARTIST_ID=(
	SELECT ARTIST_ID FROM ARTISTS WHERE ARTIST_NAME='APARSHAKTI KHURANA')

--16. Retrieve all the song titles with its album title.
SELECT S.SONG_TITLE, A.ALBUM_TITLE FROM SONGS S
JOIN ALBUMS A
ON S.ALBUM_ID=A.Album_id

--17. Find all the songs which are released in 2020.
SELECT S.* FROM SONGS S
JOIN ALBUMS A
ON S.Album_id=A.Album_id
WHERE A.Release_year=2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW FAV_SONGS AS 
SELECT * FROM SONGS 
WHERE SONG_ID BETWEEN 101 AND 105

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE FAV_SONGS
SET SONG_TITLE = 'JANNAT'
WHERE SONG_ID = 101

--20. Find all ARTIST who have released an album in 2020. 
SELECT A.ARTIST_NAME FROM ARTISTS A
JOIN ALBUMS AL
ON A.Artist_id = AL.Artist_id
WHERE AL.Release_year=2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
SELECT S.* FROM SONGS S
JOIN ALBUMS AL
ON AL.Album_id= S.Album_id
JOIN ARTISTS A
ON A.Artist_id = AL.Artist_id
WHERE A.Artist_name='SHREYA GHOSHAL'
ORDER BY S.Duration

SELECT S.*
FROM Songs S
JOIN Albums A ON S.Album_id = A.Album_id
WHERE A.Artist_id = (SELECT Artist_id 
                     FROM ARTISTS
                     WHERE Artist_name = 'Shreya Ghoshal')
ORDER BY S.Duration;


--Part – B
--22. Retrieve all song titles by ARTIST who have more than one album. 
SELECT S.Song_title
FROM Songs S
JOIN Albums AL ON S.Album_id = AL.Album_id
JOIN ARTISTS A ON A.Artist_id = AL.Artist_id
WHERE A.Artist_id IN (
    SELECT Artist_id
    FROM Albums
    GROUP BY Artist_id
    HAVING COUNT(Album_id) > 1
);

--23. Retrieve all albums along with the total number of songs.
SELECT AL.ALBUM_TITLE, COUNT(S.SONG_ID) AS TOTAL_SONGS FROM ALBUMS AL
LEFT JOIN SONGS S
ON AL.Album_id=S.Album_id
GROUP BY  AL.Album_title

--24. Retrieve all songs and release year and sort them by release year. 
SELECT S.SONG_TITLE,AL.RELEASE_YEAR FROM SONGS S
JOIN ALBUMS AL
ON S.Album_id=AL.Album_id
ORDER BY Release_year

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT GENRE, COUNT(SONG_TITLE) FROM SONGS
GROUP BY GENRE
HAVING COUNT(SONG_TITLE)>2

--26. List all ARTIST who have albums that contain more than 3 songs.
SELECT A.ARTIST_NAME, COUNT(S.Song_id) FROM ARTISTS A
JOIN ALBUMS AL
ON A.Artist_id=AL.Artist_id
JOIN SONGS S
ON AL.Album_id=S.Album_id
GROUP BY A.Artist_name,AL.Album_id
HAVING COUNT(S.Song_id)>3

--Part – C
--27. Retrieve albums that have been released in the same year as 'Album4'
SELECT ALBUM_TITLE FROM ALBUMS WHERE Release_year=(
	SELECT Release_year FROM ALBUMS WHERE Album_title='ALBUM4')

--28. Find the longest song in each genre
SELECT GENRE, MAX(DURATION) FROM SONGS
GROUP BY GENRE

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
SELECT S.Song_title
FROM Songs S
JOIN Albums A ON S.Album_id = A.Album_id
WHERE A.Album_title LIKE '%Album%';

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
SELECT AR.Artist_name, SUM(S.Duration) AS Total_Duration
FROM ARTISTS AR
JOIN Albums AL ON AR.Artist_id = AL.Artist_id
JOIN Songs S ON AL.Album_id = S.Album_id
GROUP BY AR.Artist_name
HAVING SUM(S.Duration) > 15;