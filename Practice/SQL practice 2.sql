-- 1. 
SELECT
    EMP_ID,
	EMP_NAME,
    PHONE,
    HIRE_DATE,
    ENT_YN
FROM
	employee
WHERE
	ENT_YN = 'N'  AND PHONE LIKE '%2'
ORDER BY
	HIRE_DATE DESC
LIMIT 3;


-- 2.
SELECT
	a.EMP_NAME,
    b.JOB_NAME,
    a.SALARY,
    a.EMP_ID,
    a.EMAIL,
    a.PHONE,
    a.HIRE_DATE
FROM
	employee a
JOIN
	job b ON b.JOB_CODE = a.JOB_CODE 
WHERE b. JOB_NAME ='대리' AND a.ENT_YN = 'N'
ORDER BY
	SALARY DESC;
	
    
    
-- 3. 
	
SELECT
	DEPT_TITLE as '부서명',
    COUNT(*) as '인원',
    sum(SALARY) as '급여합계',
    avg(SALARY) as '급여평균'
FROM
    employee a
JOIN
	department b on b.DEPT_ID = a.DEPT_CODE
WHERE
	ENT_YN = 'N'
group by
	DEPT_TITLE 
with rollup;


-- 4.
SELECT
	EMP_NAME,
    EMP_NO,
    PHONE,
    DEPT_TITLE,
    JOB_NAME
FROM
	employee a
LEFT JOIN
	department b ON a.DEPT_CODE = b.DEPT_ID
INNER JOIN 
	job c ON a.JOB_CODE = c.JOB_CODE
ORDER BY
	HIRE_DATE ASC;
    

-- 5-1.
SELECT 
	COUNT(*) 
FROM
	employee
WHERE
	MANAGER_ID IS NOT NULL;

-- 5-2.
SELECT 
	COUNT(*) 
FROM
	employee a
JOIN
	employee b on a.MANAGER_ID = b.EMP_ID;
    
-- 5-3.
SELECT
	a.EMP_NAME,
    b.EMP_NAME
FROM
	employee a
LEFT JOIN
	employee b on a.MANAGER_ID = b.EMP_ID
ORDER BY
	a.EMP_NAME ASC;
    
-- 5-4.
SELECT
	a.EMP_NAME,
    b.DEPT_TITLE,
    a1.EMP_NAME,
    b1.DEPT_TITLE
FROM
	employee a
JOIN
	employee b on a.MANAGER_ID = b.EMP_ID
LEFT JOIN
	department b on a.DEPT_CODE = b.DEPT_ID
LEFT JOIN
	department b1 on a1.DEPT_CODE = b1.DEPT_ID
ORDER BY a.EMP_NAME ASC;
    
	
    
    