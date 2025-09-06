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

