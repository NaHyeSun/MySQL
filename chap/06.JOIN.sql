-- JOIN
-- 두 개 이상의 테이블을 관련있는 컬럼을 통해 결합하는데 사용된다.

-- 컬럼 또는 테이블에 별칭을 달아 줄 수 있다. 이러한 별칭을 ALIAS라고 한다. 
-- 별칭에 띄어쓰기나 특수기호가 없다면 홑따옴표(')와 AS는 생략 가능하다. 

SELECT
	menu_code AS 'code',
    menu_name AS name,
    menu_price 'price'
FROM
	tbl_menu
ORDER BY price;

SELECT
	a.category_code,
    a.menu_name
FROM
	-- tbl_menu AS a
       tbl_menu a   -- AS 생략 가능 
ORDER BY
	a.category_code,
    a.menu_name;
    
-- 1-1. INNER JOIN
-- 두 테이블의 교집합을 반환하는 SQL JOIN 유형

-- ON을 활용한 JOIN
-- 컬럼명이 같거나 다를 경우 ON으로 서로 연관 있는 컬럼에 대한 조건을 작성하여 JOIN

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
--  INNER JOIN tbl_category b ON a.category_code = b.category_code;
JOIN tbl_category b ON a. category_code = b.category_code;


-- 1-2. USING을 확용한 JOIN
-- 컬럼명이 같을 경우 USING으로 서로 연관있는 컬럼에 해난 조건을 작성하여 JOIN

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
INNER JOIN tbl_category b USING (category_code);

-- 2. LEFT JOIN
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN유형 

SELECT
	a.category_name,
    b.menu_name
FROM
	tbl_category a
LEFT JOIN tbl_menu b ON a.category_code = b.category_code;

-- 3. RIGHT JOIN
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형 

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
RIGHT JOIN tbl_category b on a.category_code = b.category_code;

-- 4. CROSS JOIN
-- 두 테이블의 모든 가능한 조합을 반환하는 SQL JOIN유형

SELECT
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
CROSS JOIN tbl_category b;

-- 5. SELF JOIN
-- 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 SQL JOIN 유형
-- 카테고리별 대분류 확인을 위한 SELF JOIN 조회
SELECT
	a.category_name,
    b.category_name
FROM
	tbl_category a
JOIN tbl_category b ON a.ref_category_code = b.category_code
WHERE a.ref.category_code IS NOT NULL;

-- JOIN 알고리즘
-- 1. NESTED LOOP JOIN
-- 큰 테이블의 각 행에 대해 작은 테이블을 반복적으로 검색하며, 조건에 맞는 행을 찾는다. 
-- 인덱스가 잘 구성되어 있는 작은테이블에 유리하며, 전체 행을 스캔할 필요가 없을 때 효율적이다.
-- 결론, 두 테이블 중 하나가 상대적으로 작을 때 효과적이다. 

SELECT /* + NO_HASH_JOIN(A)*/
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;

-- 2. HASH JOIN
-- 이 방식은 두 테이블이 모두 크고, 테이블 간 등가 조인(Equal join)이 일어날때 효과적이다.
-- 먼저 한 테이블의 데이터를 읽어 해시테이블을 생성하고, 다른 테이블을 읽으며 해시 테이블과
-- 매칭되는 데이터를 찾는다. 

SELECT /*+ HASH_JOIN(a) */   -- >> 주석처럼 보이지만 실제로 SQL 힌트절로 작동한다.  위치나 모양 동일하게 해야 힌트절 적용된다. 
                             -- 'a' 라는 별칭을 가진 테이블에 대해 해시 조인 사용을 지시. 
	a.menu_name,
    b.category_name
FROM
	tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;








	