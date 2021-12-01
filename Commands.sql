/*1. Создать все необходимые внешние ключи в базе данных vk. В качестве отчёта сдать команды создания ключей в текстовом видe*/

ALTER TABLE users
ADD CONSTRAINT users_main_photo_id_fk
FOREIGN KEY (main_photo_id)
REFERENCES photo (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE video
ADD CONSTRAINT video_owner_id_fk
FOREIGN KEY (owner_id)
REFERENCES users (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE photo
ADD CONSTRAINT photo_owner_id_fk
FOREIGN KEY (owner_id)
REFERENCES users (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT messages_from_user_id_fk
FOREIGN KEY (from_user_id)
REFERENCES users (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE messages
ADD CONSTRAINT messages_to_user_id_fk
FOREIGN KEY (to_user_id)
REFERENCES users (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE friendship
ADD CONSTRAINT friendship_requested_by_user_id_fk
FOREIGN KEY (requested_by_user_id)
REFERENCES users (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE friendship
ADD CONSTRAINT friendship_requested_to_user_id_fk
FOREIGN KEY (requested_to_user_id)
REFERENCES users (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE friendship
ADD CONSTRAINT friendship_status_id_fk
FOREIGN KEY (status_id)
REFERENCES friendship_statuses (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE communities
ADD CONSTRAINT communities_creator_id_fk
FOREIGN KEY (creator_id)
REFERENCES users (id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE communities_users
ADD CONSTRAINT communities_users_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE communities_users
ADD CONSTRAINT communities_users_community_id_fk
FOREIGN KEY (community_id)
REFERENCES communities (id)
ON DELETE CASCADE
ON UPDATE CASCADE;



/*3. Создать в таблице фотографий столбец metadata типа JSON и следующими ключами - id, url, size и заполнить его значениями соответствующих строк. В отчёт приложить команды ALTER TABLE и UPDATE.*/

ALTER TABLE photo ADD COLUMN metadata JSON;

UPDATE photo SET metadata = json_build_object(
 'id', id,
 'url', url,
 'size', size);



/*4. В таблице сообществ создать столбец members типа массив. Для сообщества с id = 3 поместить в ячейку members идентификаторы всех пользователей, являющихся членами данной группы. В отчёт приложить выполняемые команды.*/

ALTER TABLE communities ADD COLUMN members INTEGER[];

UPDATE communities SET members = ARRAY(SELECT user_id FROM communities_users WHERE community_id = 3) WHERE id = 3;



/*5. Создать пользовательский составной тип данных contacts c полями phone и email. В таблице пользователей добавить столбец user_contacts типа contacts. Заполнить столбец значениями из соответствующих строк. Для пользователя с id = 21 изменить email в столбце user_contacts на test@somemail.ru. В отчёт приложить выполненные команды.*/

CREATE TYPE contacts AS (phone VARCHAR(15), email VARCHAR(120));

ALTER TABLE users ADD COLUMN user_contacts contacts;

UPDATE users SET user_contacts = (phone, email);

UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 21;




















