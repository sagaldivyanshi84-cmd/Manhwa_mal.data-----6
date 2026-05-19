-- This query shows titles of manhwa that have a score higher than the average score of all manhwa.
SELECT title
FROM manhwa_mal
WHERE score > (SELECT AVG(score) FROM manhwa_mal);
-- This query shows highest scoring manhwa
SELECT title, score
FROM manhwa_mal
WHERE score = (SELECT MAX(score) FROM manhwa_mal);
-- This query shows popularity better than average popularity rank
SELECT popularity,title
FROM manhwa_mal
WHERE popularity > (SELECT AVG(popularity) FROM manhwa_mal);
-- This query shows score equal to second highest score
SELECT score, title
FROM manhwa_mal
WHERE score = (SELECT MAX(score) 
               FROM manhwa_mal 
               WHERE score <(SELECT MAX(score) 
               FROM manhwa_mal)); 
-- This query shows more chapters than average chapters of ongoing manhwa               
SELECT chapters,title
FROM manhwa_mal
WHERE chapters > (SELECT AVG(chapters) 
                  FROM manhwa_mal
                  WHERE status = "publishing");
-- This query shows lowest popularity value
SELECT title, popularity
FROM manhwa_mal
WHERE popularity = (SELECT MIN(popularity)
                    FROM manhwa_mal);
-- This query shows score above average score of same status                     
SELECT t1.score, t1.status, t1.title
FROM manhwa_mal AS t1
WHERE t1.score > (SELECT AVG(t2.score) 
			      FROM manhwa_mal AS t2
				  WHERE t1.status = t2.status);
-- This query shows highest scored manhwa from each status                  
SELECT t1.title, t1.status, t1.score
FROM manhwa_mal t1
WHERE t1.score = (SELECT MAX(t2.score) 
                 FROM manhwa_mal t2
				 WHERE t1.status=t2.status );
-- This query shows manhwa with score higher than average of their genres
SELECT t1.score, t1.genres, t1.title  
FROM manhwa_mal t1
WHERE t1.score > (SELECT AVG(t2.score)
                  FROM manhwa_mal t2
				  WHERE t1.genres = t2.genres);                    