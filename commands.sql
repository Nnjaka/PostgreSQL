/*1. Работаем с базой данных vk. Найти, кому принадлежат 10 самых больших видеофайлов. В отчёт вывести идентификатор видеофайла, имя владельца, фамилию владельца, URL основной фотографии пользователя, URL видеофайла, размер видеофайла.
Решить задачу, применив различные подходы:
Найти решение только на вложенных запросах
Найти решение с использованием временной таблицы
Найти решение с использованием общего табличного выражения
Найти решение с помощью объединения JOIN и агрегации
Найти решение с использованием JOIN и оконных функций
В качестве отчёта сдать код пяти запросов в виде текста. Для проверки - результат работы всех вариантов должен совпасть.*/

/*Найти решение только на вложенных запросах*/
-- Решение при условии, что можно соединить имя и фамилию владельца в одну колонку*/
SELECT 
  id AS video_id,
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE users.id = video.owner_id) AS user,
  (SELECT 
    (SELECT photo.url FROM photo WHERE users.main_photo_id = photo.id) 
  FROM users WHERE users.id = video.owner_id) AS photo_url,
  url AS video_url, 
  size AS video_size
FROM video
  ORDER BY size DESC
    LIMIT 10;

-- Решение, если надо было вывести отдельно имя и отдельно фамилию владельца*/
SELECT 
  id AS video_id,
  (SELECT first_name FROM users WHERE users.id = video.owner_id) AS user_name,
  (SELECT last_name FROM users WHERE users.id = video.owner_id) AS user_lastname,
  (SELECT 
    (SELECT photo.url FROM photo WHERE users.main_photo_id = photo.id) 
  FROM users WHERE users.id = video.owner_id) AS photo_url,
  url AS video_url, 
  size AS video_size
FROM video
  ORDER BY size DESC
    LIMIT 10;



/*Найти решение с использованием временной таблицы*/
-- Решение, при условии, что все таблицы должны быть временными
CREATE TEMPORARY TABLE big_video (
  Id INT,
  size INT,
  url VARCHAR(250),
  owner_id INT
);

INSERT INTO big_video
  SELECT id, size, url, owner_id 
  FROM video
   ORDER BY size DESC
	  LIMIT 10;
	  
CREATE TEMPORARY TABLE users_photo (
  Id INT,
  url VARCHAR(250)
);

INSERT INTO users_photo
  SELECT id, url
  FROM photo;
	
SELECT 
  big_video.id AS video_id, 
  first_name AS user_name,
  last_name AS user_lastname,
  users_photo.url AS photo_url,
  big_video.url AS video_url,
  big_video.size AS video_size
    FROM users
       JOIN big_video 
         ON big_video.owner_id = users.id
		JOIN users_photo
		  ON users_photo.id = users.main_photo_id;


-- Т.к. мы присоединяем к таблице users две других таблицы, в одной из которых нам нужен только один столбец считаю лучшим вариантом присоединить ее через JOIN, а таблицу, в которой 
-- нам нужно больше данных - через временную таблицу
CREATE TEMPORARY TABLE big_video (
  Id INT,
  size INT,
  url VARCHAR(250),
  owner_id INT
);

INSERT INTO big_video
  SELECT id, size, url, owner_id 
  FROM video
   ORDER BY size DESC
	  LIMIT 10;
	  		
SELECT 
  big_video.id AS video_id, 
  first_name AS user_name,
  last_name AS user_lastname,
  photo.url AS photo_url,
  big_video.url AS video_url,
  big_video.size AS video_size
    FROM users
       JOIN big_video 
         ON big_video.owner_id = users.id
		JOIN photo
		  ON photo.id = users.main_photo_id;


/* Найти решение с использованием общего табличного выражения*/
--Решение аналогично прошлому заданию. В данном случае с 2-мя табличными выражениями 

WITH big_video AS (
  SELECT id, size, url, owner_id 
    FROM video 
      ORDER BY size DESC
	    LIMIT 10
), 
  user_photo AS (
	SELECT id, url
	  FROM photo
)
SELECT 
  big_video.id AS video_id, 
  first_name AS user_name,
  last_name AS user_lastname,
  user_photo.url AS photo_url,
  big_video.url AS video_url,
  big_video.size AS video_size
    FROM users
       JOIN big_video 
         ON big_video.owner_id = users.id
		JOIN user_photo
		  ON user_photo.id = users.main_photo_id
 			ORDER BY video_size DESC;

--С одним табличным выражением и подключением таблицы photo через JOIN
WITH big_video AS (
  SELECT id, size, url, owner_id 
    FROM video 
      ORDER BY size DESC
	    LIMIT 10
)	
SELECT 
  big_video.id AS video_id, 
  first_name AS user_name,
  last_name AS user_lastname,
  photo.url AS photo_url,
  big_video.url AS video_url,
  big_video.size AS video_size
    FROM users
       JOIN big_video 
         ON big_video.owner_id = users.id
		JOIN photo
		  ON photo.id = users.main_photo_id
 			ORDER BY video_size DESC;
 			
 			

-- Найти решение с помощью  объединения JOIN и агрегации
SELECT 
  v.id AS video_id, 
  u.first_name AS user_name,
  u.last_name AS user_lastname,
  p.url AS photo_url,
  v.url AS video_url,
  v.size AS video_size
    FROM users AS u
       JOIN video AS v
         ON v.owner_id = u.id
		JOIN photo AS p
		  ON p.id = u.main_photo_id
 			ORDER BY v.size DESC
	    	  LIMIT 10;
	    	  
	    	  
	    	  
-- Найти решение с использованием JOIN и оконных функций
SELECT 
  v.id AS video_id, 
  u.first_name AS user_name,
  u.last_name AS user_lastname,
  p.url AS photo_url,
  v.url AS video_url,
  MAX(v.size) OVER (PARTITION BY v.owner_id) AS video_size
    FROM users AS u
       JOIN video AS v
         ON v.owner_id = u.id
		JOIN photo AS p
		  ON p.id = u.main_photo_id
 			ORDER BY v.size DESC
	    	  LIMIT 10;


