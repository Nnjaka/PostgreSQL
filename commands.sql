/*Комментарии по работе на уроке

На уроке рассматривали пример: 

CREATE FUNCTION messages_total_by_user_id(user_id INTEGER, OUT sent BIGINT, OUT received BIGINT) AS 
$$
  SELECT 
    COUNT(DISTINCT sm.id),
    COUNT(DISTINCT rm.id) 
      FROM users
      LEFT JOIN messages sm
        ON sm.from_user_id = users.id
      LEFT JOIN messages rm
        ON rm.to_user_id = users.id 
    WHERE users.id = user_id;
$$ 
LANGUAGE SQL;

Мы можем в части ON объединения LEFT JOIN сразу приравнивать к входящему аргументу и убрать часть кода с WHERE:

CREATE FUNCTION messages_total_by_user_id(user_id INTEGER, OUT sent BIGINT, OUT received BIGINT) AS 
$$
  SELECT 
    COUNT(DISTINCT sm.id),
    COUNT(DISTINCT rm.id) 
      FROM users
      LEFT JOIN messages sm
        ON sm.from_user_id = user_id
      LEFT JOIN messages rm
        ON rm.to_user_id = user_id; 
$$ 
LANGUAGE SQL;

Результат получился аналогичнымю Можем ли мы переделать код таким образом?  Будет ли это эффективнее?*/


/*ДОМАШНЕЕ ЗАДАНИЕ*/

/*1. Создать функцию, которая по идентификатору пользователя ищет того, кто написал пользователю наибольшее количество сообщений. В результат нужно вывести идентификатор искомого пользователя.*/

CREATE FUNCTION max_message_from_user_id(user_id BIGINT)
RETURNS INTEGER AS
$$
  SELECT from_user_id
  FROM messages
  WHERE to_user_id = user_id
  GROUP BY from_user_id
  ORDER BY COUNT(*) DESC
  LIMIT 1;
$$
LANGUAGE SQL;



/*2. Создать процедуру, которая проверяет владельца фотографий, которые указаны в качестве основных фотографий пользователей в таблице users. Если пользователь в users не является владельцем своей основной фотографии, тогда для него нужно записать NULL в столбце main_photo_id.*/

-- В домашнем задании к прошлому уроку мы разбили таблицу users на users и profiles, в которой теперь находится информация по основной фотографии, поэтому в цикле обращение производится к таблице profiles, а не users.

CREATE PROCEDURE checking_profiles_main_photo()
LANGUAGE PLPGSQL AS
$$
  DECLARE photo_row RECORD;
  BEGIN
  	FOR photo_row IN
  	  SELECT *
        FROM profiles
        LEFT JOIN photo
		  ON profiles.main_photo_id = photo.id
          WHERE profiles.user_id <> photo.owner_id
    LOOP
	  UPDATE profiles SET main_photo_id = NULL
		WHERE id = photo_row.id;
	END LOOP;
  COMMIT;
  END;
$$;

CALL checking_profiles_main_photo();



/*3. Создать триггер на обновление для таблицы пользователей, который не разрешает внести в столбец main_photo_id идентификатор фотографии, если данный пользователь не является ее владельцем. Проверить работу триггера вставкой записей с корректными и некорректными значениями.*/

-- Создаем функцию
CREATE OR REPLACE FUNCTION update_main_photo_id_trigger()
  RETURNS TRIGGER AS
  $$
    DECLARE owner_id INTEGER;
    BEGIN
      owner_id := (
	SELECT photo.owner_id
        FROM profiles
        LEFT JOIN photo
	  ON NEW.main_photo_id = photo.id
	WHERE profiles.user_id = photo.owner_id);
      IF owner_id = NEW.user_id THEN
	NEW.main_photo_id := NEW.main_photo_id;
      ELSE 
        RAISE EXCEPTION 'you are not the owner of this photo';
      END IF;
      RETURN NEW;
    END
  $$
  LANGUAGE PLPGSQL;
  
-- СОздаем триггер
CREATE TRIGGER check_profiles_on_update_main_photo
  BEFORE UPDATE ON profiles
    FOR EACH ROW
      EXECUTE FUNCTION update_main_photo_id_trigger();

--Проверка работы триггера со вставкой записей с некорректным значением
UPDATE profiles SET main_photo_id = 6 WHERE user_id = 52;

-- Проверка работы триггера со вставкой записей с корректным значением
UPDATE profiles SET main_photo_id = 11 WHERE user_id = 1;



/*4. Создать два представления для таблицы видео. Одно представление должно быть неизменяемым, другое - изменяемым. Проверить изменяемость второго представления.*/

-- Создаем изменяемое представление
CREATE VIEW big_video AS
SELECT * FROM video 
  WHERE size > 1500;
  
-- Проверяем измеряемость (результат положителен)
UPDATE big_video SET owner_id = 30 WHERE id  = 4;


-- Создаем неизменяемое представление
CREATE VIEW big_video_with_users AS
SELECT 
  video.id,
  video.owner_id,
  users.first_name,
  users.last_name,
  video.size
FROM video
  JOIN users
    ON video.owner_id = users.id
  WHERE size > 1500
    LIMIT 2;
  
-- Проверяем измеряемость (в результате выполнения - ошибка)
UPDATE big_video_with_users SET owner_id = 3 WHERE id  = 10;










