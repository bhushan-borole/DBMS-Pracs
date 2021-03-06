--create table circle(radius number, area float);

--PL-SQL CODE: 

	BEGIN
		FOR i in 3 .. 7 LOOP
			INSERT INTO circle(radius, area) VALUES (i, 3.14*i*i);
			dbms_output.put_line(3.14*i*i);
		END LOOP;
	END;


/*
SQL> BEGIN
  2  FOR i in 3 .. 7 LOOP
  3  INSERT INTO circle(radius, area) VALUES (i, 3.14*i*i);
  4  dbms_output.put_line(3.14*i*i);
  5  END LOOP;
  6  END;
  7  /
28.26
50.24
78.5
113.04
153.86

PL/SQL procedure successfully completed.

SQL> select * from circle;

    RADIUS       AREA
---------- ----------
         3      28.26
         4      50.24
         5       78.5
         6     113.04
         7     153.86
*/