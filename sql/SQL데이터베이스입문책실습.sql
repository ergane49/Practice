CREATE DATABASE Macdonalds;
USE Macdonalds;

CREATE TABLE burgres(
	id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    price INTEGER,
    gram INTEGER,
    kcal INTEGER,
    protein INTEGER);

RENAME TABLE burgres TO burgers;
DESC burgers;

INSERT INTO burgers (id, name, price, gram, kcal, protein)
VALUES
	(1, '빅맥', 5300, 223, 583, 27),
    (2, '베토디', 6200, 242, 545, 27),
    (3, '맥스파이시', 5300, 235, 494, 20),
    (4, '슈비버거', 6200, 269, 563, 21),
    (5, '더블쿼파치', 7700, 275, 770, 50);
    
SELECT * FROM burgers WHERE price >= 6000 and price < 7000;
SELECT * FROM burgers WHERE kcal < 500 or protein >= 25;
SELECT name as '버거 이름',
	price as '가격',
    gram as '무게(g)',
    ROUND(price / gram * 100,2 ) as '100g당 가격'
FROM burgers WHERE price / gram * 100 < 2500;

CREATE DATABASE store;
USE store;

CREATE TABLE orders(
	id int primary key,
    name varchar(255),
    price decimal(10, 2),
    quantity int,
    created_at datetime);
    
DESC orders;

-- orders 데이터 삽입
INSERT INTO orders (id, name, price, quantity, created_at)
VALUES
	(1, '생돌김 50매', 5387.75, 1, '2024-10-24 01:19:44'),
	(2, '그릭 요거트 400g, 2개', 7182.25, 2, '2024-10-24 01:19:44'),
	(3, '냉장 닭다리살 500g', 6174.50, 1, '2024-10-24 01:19:44'),
	(4, '냉장 고추장 제육 1kg', 9765.00, 1, '2024-10-24 01:19:44'),
	(5, '결명자차 8g * 18티백', 4092.25, 1, '2024-10-24 01:19:44'),
	(6, '올리브 오일 1l', 17990.00, 1, '2024-11-06 22:52:33'),
	(7, '두유 950ml, 20개', 35900.12, 1, '2024-11-06 22:52:33'),
	(8, '카카오 닙스 1kg', 12674.50, 1, '2024-11-06 22:52:33'),
	(9, '손질 삼치살 600g', 9324.75, 1, '2024-11-16 14:55:23'),
	(10, '자숙 바지락 260g', 6282.00, 1, '2024-11-16 14:55:23'),
	(11, '크리스피 핫도그 400g', 7787.50, 2, '2024-11-16 14:55:23'),
	(12, '우유 900ml', 4360.00, 2, '2024-11-16 14:55:23'),
	(13, '모둠 해물 800g', 4770.15, 1, '2024-11-28 11:12:09'),
	(14, '토마토 케첩 800g', 3120.33, 3, '2024-11-28 11:12:09'),
	(15, '계란 30구', 8490.00, 2, '2024-12-11 12:34:56'),
	(16, '해물 모듬 5팩 묶음 400g', 9800.50, 4, '2024-12-11 12:34:56'),
	(17, '칵테일 새우 900g', 22240.20, 1, '2024-12-11 12:34:56'),
	(18, '토마토 케첩 1.43kg', 7680.25, 1, '2024-12-11 12:34:56'),
	(19, '국내산 양파 3kg', 5192.00, 1, '2024-12-11 12:34:56'),
	(20, '국내산 깐마늘 1kg', 9520.25, 1, '2024-12-11 12:34:56');
    
SELECT * FROM orders WHERE name LIKE '%케첩%';
SELECT SUM(price * quantity) FROM orders WHERE HOUR(created_at) < 12;

SELECT * FROM orders WHERE name BETWEEN 'ㄱ' AND '깋';

SELECT count(name) FROM orders WHERE name LIKE '국내산%';
SELECT AVG(price) FROM orders WHERE quantity BETWEEN 2 and 4;
SELECT count(name) FROM orders WHERE MONTH(created_at) = 11 and DATE(created_at) > 20;
SELECT * FROM orders WHERE name LIKE '%ml%' or name LIKE '%l%'
