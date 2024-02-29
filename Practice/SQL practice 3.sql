-- 1.
SELECT
	MAX(sumcount)
FROM
	(SELECT 
        SUM(SALARY) AS 'sumcount'
	 FROM
		employee
	 GROUP BY
		DEPT_CODE ) AS maxsum;

-- 2.

SELECT
	EMP_ID,
	EMP_NAME,
	DEPT_CODE,
	SALARY 
	
FROM
  employee
WHERE
    DEPT_CODE IN (SELECT
		              DEPT_ID
	              FROM
		               department
	              WHERE
		               DEPT_TITLE LIKE '%영업%');
                       
-- 3.
SELECT
	a.EMP_ID,
    a.EMP_NAME,
    d.DEPT_TITLE,
    a.SALARY
FROM
	employee a
JOIN 
	department d on DEPT_ID = DEPT_CODE
WHERE a.DEPT_CODE IN  (SELECT
		                 DEPT_ID
	                   FROM
		                  department
					WHERE
		                   DEPT_TITLE LIKE '%영업%');


-- 4-1. 
SELECT
	D.DEPT_ID,
    D.DEPT_TITLE,
    L.LOCAL_NAME,
    N.NATIONAL_NAME
FROM
	department D
JOIN
	location L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN
	nation N ON L.NATIONAL_CODE = N.NATIONAL_CODE;
    
-- 4-2.

SELECT
	E.EMP_ID,
    E.EMP_NAME,
    E.SALARY,
    DLN.DEPT_TITLE,
    DLN.NATIONAL_NAME
FROM 
	employee E
JOIN  (SELECT
	D.DEPT_ID,
    D.DEPT_TITLE,
    L.LOCAL_NAME,
    N.NATIONAL_NAME
FROM
	department D
JOIN
	location L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN
	nation N ON L.NATIONAL_CODE = N.NATIONAL_CODE) AS DLN ON (E.DEPT_CODE = DLN.DEPT_ID)
	
ORDER BY
	DLN.NATIONAL_NAME DESC;
	

-- 5.
SELECT
	E.EMP_ID,
    E.EMP_NAME,
    E.SALARY,
    DLN.DEPT_TITLE,
    DLN.NATIONAL_NAME,
    (E.SALARY+MIN_SAL) AS '위로금'
FROM
	employee E
JOIN  (SELECT
	D.DEPT_ID,
    D.DEPT_TITLE,
    L.LOCAL_NAME,
    N.NATIONAL_NAME
FROM
	department D
JOIN
	location L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN
	nation N ON L.NATIONAL_CODE = N.NATIONAL_CODE) AS DLN ON (E.DEPT_CODE = DLN.DEPT_ID)
JOIN SAL_GRADE S ON (E.SAL_LEVEL = S.SAL_LEVEL)
WHERE
	DLN.NATIONAL_NAME = '러시아'
ORDER BY
	(E.SALARY+MIN_SAL)  DESC;



