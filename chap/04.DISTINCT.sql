-- DISTINCT

-- 중복된 값을 제거하는데 사용된다.
-- 컬럼에 있는 컬럼값들의 종류를 쉽게 파악할 수 있다.

SELECT
	category_code
FROM
	tbl_menu
ORDER BY
	category_code;
    
SELECT
	DISTINCT category_code
FROM
	tbl_menu
ORDER BY
	category_code;
    
SELECT
	ref_category_code
FROM
	tbl_category;
    
SELECT
	distinct ref_category_code
FROM
	tbl_category;

-- 다중열 DISTINCT 사용
SELECT
	category_code,
    orderable_status
FROM
	tbl_menu;


SELECT distinct
	category_code,
    orderable_status
FROM
	tbl_menu;
