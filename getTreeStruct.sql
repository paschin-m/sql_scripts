--SQL function for DataBase MySQL

CREATE FUNCTION STRFIND(str VARCHAR(255),delimtr CHAR(1)) RETURNS INT
	BEGIN
	DECLARE _cnt INT;
	DECLARE _start INT;
	SET _cnt = -1;
	SET _start = 1;
	WHILE _start > 0 DO
   SET _start = LOCATE( delimtr, str);
   SET str    = SUBSTRING( str, _start + 1);
   SET _cnt   = _cnt + 1;
	END WHILE;
RETURN _cnt;
END

--selecting a edge of graph
SELECT name, strfind( path, '.') AS level 
FROM mp_tree 
WHERE path LIKE '1.1%';

--search ParentNode on graph
SELECT t2.*
FROM mp_tree t1, mp_tree t2
WHERE t1.id=3 AND t2.path=SUBSTRING( t1.path, 1, (LENGTH(t1.path) - LOCATE('.', REVERSE(t1.path))));

