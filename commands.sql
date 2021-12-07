1. Создать роли для пользователей Федор Серов и Роман Белов. Создать роли для групп аналитиков и тестировщиков. Поместить пользователя Федор Серов в группу аналитиков а пользователя Роман Белов в группу тестировщиков. Дать группе аналитиков право только на чтение данных в БД vk. Дать группе тестировщиков все права в БД vk. Подключиться к БД vk под обоими пользователями и проверить права выполнив простые операции SQL.

-- Создаем группы аналитиков и тестировщиков
CREATE ROLE analysts;
CREATE ROLE testers;

-- Создаем пользователей - Федора Серова и Романа Белова
CREATE ROLE serovf LOGIN;
CREATE USER belovr;

-- Устанавливаем пароли для пользователей
ALTER ROLE serovf WITH PASSWORD '111111';
ALTER ROLE belovr WITH PASSWORD '111111';

-- Перемещаем пользователей в соответствующие группы
GRANT analysts TO serovf;
GRANT testers TO belovr;

-- Переключаемся на БД vk
\c vk;

-- Устанавлием группе аналитиков право только на чтение данных в БД vk
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts;

-- Устанавлием группе тестировщиков все права в БД vk
GRANT ALL ON ALL TABLES IN SCHEMA public TO testers;

-- Выдаем группам права на последовательности
GRANT SELECT  ON ALL SEQUENCES IN SCHEMA public TO analysts;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers;

-- Выходим из текущего пользователя
\q

-- Заходим пользователем - Федор Серов
psql -U serovf -d vk -h 127.0.0.1 -W

-- Проверяем запрос на чтение (получаем положительный результат)
SELECT * FROM users LIMIT 5;

-- Проверяем другие запросы (получаем ошибку)
UPDATE users SET first_name = 'Ivan' WHERE id = 1;
INSERT INTO friendship_statuses VALUES (5, 'none');
DELETE FROM friendship_statuses WHERE id = 5;

-- Выходим из текущего пользователя
\q

-- Заходим пользователем - Белов Роман
psql -U belovr -d vk -h 127.0.0.1 -W

-- Проверяем разничные запросы (получаем положительные результаты)
SELECT * FROM users LIMIT 5;
UPDATE users SET first_name = 'Ivan' WHERE id = 1;
INSERT INTO friendship_statuses VALUES (5, 'none');
DELETE FROM friendship_statuses WHERE id = 5;



/*2. Установить любое расширение PostgreSQL на ваш выбор.*/

-- Проверяем не установлено ли расширение
SELECT * FROM pg_extension WHERE extname = 'btree_gin';

-- Устанавливаем расширение
CREATE EXTENSION "btree_gin";



/*3. Выполнить вертикальное разделение таблицы пользователей на таблицу пользователей (users) и таблицу профилей (profiles). В таблице пользователей оставить только столбцы идентификатора, имени, фамилии, электронной почты и телефона. Все остальные столбцы вместе с данными необходимо перенести в таблицу профилей.*/

-- Создаем таблицу profiles
CREATE TABLE profiles (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  main_photo_id INT,
  created_at TIMESTAMP,
  user_contacts CONTACTS
);

-- Добавляем внешний ключ
ALTER TABLE profiles
ADD CONSTRAINT profiles_user_id_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Переносим данные из таблицы users в profiles
INSERT INTO profiles (user_id, main_photo_id, created_at, user_contacts)
SELECT id, main_photo_id, created_at, user_contacts
FROM users;

-- Удаляем столбцы из таблицы users
ALTER TABLE users DROP COLUMN main_photo_id, DROP COLUMN created_at, DROP COLUMN user_contacts;



/*4. Создать дамп базы данных vk. Создать новую базу данных vk_staging. Загрузить созданный ранее дамп в базу данных vk_staging. Проверить корректность загрузки выполнением SQL запроса.*/

-- Создаем БД
createdb vk_staging

-- Создаем дамп
pg_dump vk > vk.dump.sql

-- Загрузка данных из дампа 
psql vk_staging < vk.dump.sql

-- Заходим в клиента
psql

-- Подключаемся к базе vk_staging
\c vk_staging

-- Проверяем корректность путем выполнения запроса 
SELECT * FROM users;
