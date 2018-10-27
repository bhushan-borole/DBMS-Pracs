--Pl-SQL code:
	DECLARE
		i number;
	BEGIN
		i:= 100;
		FOR j in 1 .. 10 LOOP
			i:= i + 25;
			IF i = 250 THEN
				dbms_output.put_line(i);
				EXIT;
			END IF;
		END LOOP;
	END;


/*
SQL> DECLARE
  2  i number;
  3  BEGIN
  4  i:= 100;
  5  FOR j in 1 .. 10 LOOP
  6  i:= i + 25;
  7  IF i = 250 THEN
  8  dbms_output.put_line(i);
  9  EXIT;
 10  END IF;
 11  END LOOP;
 12  END;
 13  /
250

PL/SQL procedure successfully completed.
*/