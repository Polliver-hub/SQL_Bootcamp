CREATE OR REPLACE FUNCTION FNC_FIBONACCI(
    PSTOP INTEGER DEFAULT 10
)
    RETURNS TABLE
    (
        NUMBER NUMERIC
    ) AS
$FIBONACCI_PLPGSQL$
DECLARE
    N1 NUMERIC = 0;
    N2 NUMERIC = 1;
BEGIN
    IF PSTOP > 0
    THEN
        NUMBER := N1;
        RETURN NEXT;

        IF PSTOP > 1
        THEN
            NUMBER := N2;
            RETURN NEXT;

            LOOP
                NUMBER := (NUMBER + N1);
                N1 := N2;
                N2 := NUMBER;
                EXIT WHEN NUMBER >= PSTOP;
                RETURN NEXT;
            END LOOP;
        END IF;
    END IF;
END;
$FIBONACCI_PLPGSQL$ LANGUAGE PLPGSQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

CREATE OR REPLACE FUNCTION fib(f integer default 10)
RETURNS SETOF integer
AS $FIBONACCI_SQL$
WITH RECURSIVE t(a,b) AS (
        VALUES(0,1)
    UNION ALL
        SELECT greatest(a,b), a + b as a from t
        WHERE b < $1
   )
SELECT a FROM t;
$FIBONACCI_SQL$LANGUAGE SQL;

select * from fib(100);
select * from fib();