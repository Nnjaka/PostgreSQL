/*1. Удалить пользователей, которые не имеют ни одной дружеской связи с подтвержденным статусом. Нужно удалить все данные, связанные с такими пользователями. Для решения используйте транзакцию.*/

-- Создаем представление для пользователей с подтвержденными дружескими отношениями
CREATE VIEW users_with_confirmed_friendship AS
SELECT DISTINCT users.id
FROM users
  LEFT JOIN friendship
    ON users.id = friendship.requested_by_user_id
	  OR users.id = friendship.requested_to_user_id
  LEFT JOIN friendship_statuses
    ON friendship.status_id = friendship_statuses.id
	WHERE friendship_statuses.name = 'approved';
	
-- Создаем представление для пользователей с неподтвержденными дружескими отношениями
CREATE VIEW users_without_confirmed_friendship AS
SELECT id
FROM users
WHERE id NOT IN 
  (SELECT id FROM users_with_confirmed_friendship);
  
-- Создаем транзакцию
BEGIN;
  DELETE 
    FROM communities_users 
      JOIN users_without_confirmed_friendship
	    ON communities_users.user_id = users_without_confirmed_friendship.id;
  DELETE 
    FROM friendship 
      JOIN users_without_confirmed_friendship
	    ON friendship.requested_by_user_id = users_without_confirmed_friendship.id
		  OR friendship.requested_to_user_id = users_without_confirmed_friendship.id;
  DELETE 
    FROM messages 
      JOIN users_without_confirmed_friendship
	    ON messages.from_user_id = users_without_confirmed_friendship.id
		  OR messages.to_user_id = users_without_confirmed_friendship.id;
  DELETE 
    FROM profiles 
      JOIN users_without_confirmed_friendship
	    ON profiles.main_photo_id = users_without_confirmed_friendship.id;
  DELETE 
    FROM photo 
      JOIN users_without_confirmed_friendship
	    ON photo.owner_id = users_without_confirmed_friendship.id;
  DELETE 
    FROM video 
      JOIN users_without_confirmed_friendship
	    ON video.owner_id = users_without_confirmed_friendship.id;
    DELETE 
    FROM users 
      JOIN users_without_confirmed_friendship
	    ON users.id = users_without_confirmed_friendship.id;
COMMIT;



/*2. Создать запрос, который для всех пользователей покажет количество загруженных фотографий и видеофайлов (отдельными столбцами), а также ранг каждого пользователя по этим значениям (также отдельно для фотографий и видеофайлов). Большие значения соответствуют более высокому рангу. Решить -- задание необходимо одним запросом с использованием оконных функций.*/

WITH users_with_count_video_photo AS (
  SELECT DISTINCT
	users.id,
	users.first_name,
	users.last_name,
	COUNT(DISTINCT photo.id) AS photo_count,
	COUNT(DISTINCT video.id) AS video_count
  FROM users
	LEFT JOIN photo
	  ON users.id = photo.owner_id
	LEFT JOIN video
	  ON users.id = video.owner_id
  GROUP BY users.id)
SELECT 
  id,
  first_name,
  last_name,
  video_count,
  photo_count,
  DENSE_RANK () OVER (ORDER BY video_count DESC) AS user_rank_video,
  DENSE_RANK () OVER (ORDER BY photo_count DESC) AS user_rank_photo
FROM users_with_count_video_photo
ORDER BY user_rank_video;



/*3. Для каждой группы (сообщества) найти средний размер видеофайлов, загруженных участниками группы, а также вывести идентификатор, имя и фамилию пользователя, который загрузил самый большой по размеру видеофайл. Решить задание необходимо одним запросом с использованием оконных функций.*/

 WITH max_video AS(
   SELECT DISTINCT
    communities.id AS communities_id,
    communities.name AS communities_name,
    AVG (video.size) OVER (PARTITION BY communities.id) AS avg_video_size,
	video.size,
	video.owner_id,
	users.first_name,
	users.last_name
  FROM communities
  LEFT JOIN communities_users
    ON communities.id = communities_users.community_id
  JOIN video
    ON communities_users.user_id = video.owner_id
  LEFT JOIN users
    ON communities_users.user_id = users.id
  ORDER BY communities.id, video.size DESC NULLS LAST
)
SELECT DISTINCT
    communities_id,
    communities_name,
    avg_video_size,
	FIRST_VALUE (size) OVER (PARTITION BY communities_id) AS max_video_size,
	FIRST_VALUE (owner_id) OVER (PARTITION BY communities_id) AS user_id,
	FIRST_VALUE (first_name) OVER (PARTITION BY communities_id) AS user_first_name,
	FIRST_VALUE (last_name) OVER (PARTITION BY communities_id) AS user_last_name
FROM max_video
ORDER BY communities_id;
	
