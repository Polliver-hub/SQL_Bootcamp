-- 1 session
BEGIN TRANSACTION;						    	--1
UPDATE pizzeria SET rating = 1 WHERE id = 1;	--3
UPDATE pizzeria SET rating = 2 WHERE id = 2;	--5
COMMIT WORK;								    --7

-- 2 session
BEGIN TRANSACTION;							    --2
UPDATE pizzeria SET rating = 3 WHERE id = 2;	--4
UPDATE pizzeria SET rating = 4 WHERE id = 1;	--6
COMMIT WORK;								    --8
