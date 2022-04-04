BEGIN;
	INSERT INTO Player(name, height, weight, salary) VALUES('Ivan', 180, 80, 50000);
	SAVEPOINT my_savepoint1;
	INSERT INTO Player(name, height, weight, salary) VALUES('Zaxar', 160, 70, 10000);
	ROLLBACK TO my_savepoint1;
	INSERT INTO Player(name, height, weight, salary) VALUES('Zaxar', 180, 70, 10000);
COMMIT;
