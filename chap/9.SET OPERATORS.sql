/* SET_OPERATORS */

-- UNION : 두 개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를 제거 후 반환.

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10
UNION
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price < 9000;
    
    
-- UNION ALL : 중복된 레코드를 제거하지 않고 모두 반환.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10
UNION ALL
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price < 9000;
    
    
-- INTERSECT : 두 SELECT문의 결과 중 공통되는 레코드만을 반환.
-- MySQL은 제공하지 않는다. 하지만 INNER JOIN 또는 IN 연산자를 활용해서 구현가능. 

-- INNER JOIN 사용
SELECT
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
FROM
	tbl_menu a
INNER JOIN(SELECT 
               menu_code,
               menu_name,
               menu_price,
               category_code,
               orderable_status
			FROM
				tbl_menu 
			WHERE
				menu_price < 9000 )b on (a.menu_code = b.menu_code)
WHERE
	a.category_code = 10;

-- IN 이용
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 10 AND 
    menu_code IN (SELECT
                     menu_code
			       FROM 
                      tbl_menu
					WHERE
						menu_price <9000);
                        
                        
-- MINUS : 첫번째 SELECT문의 결과에서 두번째 SELECT문의 결과가 포함하는 레코드를 제외하고 반환. 
-- MySQL은 MINUS를 제공하지 않음. LEFT JOIN을 활용해서 구현하는 것은 가능하다. 
SELECT
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.category_code,
    a.orderable_status
FROM
	tbl_menu a
LEFT JOIN (SELECT
	            menu_code,
                menu_name,
                menu_price,
                category_code,
                orderable_status
			FROM
				tbl_menu
			WHERE
				menu_price < 9000) b ON (a.menu_code = b.menu_code)
WHERE
	b.menu_code IS NULL AND
    a.category_code = 10;
-- left join 시 왼쪽열 기준으로 왼쪽열에 포함되지 않은 서브쿼리 b테이블은 보이진 않지만 일치 하지 않는 내용이 null값으로 나오게 된다.  
-- 그래서 where절에 is null로 null값인 부분만 추출하면 A에서 B 값을 뺀 것이 null이 있던 부분이다. 



                
	
