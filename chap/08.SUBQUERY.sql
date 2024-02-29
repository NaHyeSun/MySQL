/* SUBQUERY*/

SELECT
	category_code
FROM
	tbl_menu
WHERE
	menu_name = '민트미역국';
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = (SELECT           -- main () 안에 subquery 작성  
                            category_code
					FROM
                            tbl_menu
					WHERE
						    menu_name = '민트미역국');
                            
SELECT
	COUNT(*) AS 'count'
FROM
	tbl_menu
GROUP BY category_code;


/*From 절에 쓰인 서브쿼리는 반드시 자신의 별칭이 있어야 한다. */
SELECT
	MAX(count)
FROM                                   
	(SELECT
		COUNT(*) AS 'count'
	FROM
		tbl_menu
	group by category_code ) AS countmenu;
    


SELECT
	AVG(menu_price)
FROM
	tbl_menu
WHERE
	category_code = 4;
    
/* 카테고리별 평균 가격보다 높은 가격의 메뉴 조회 */
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu a
WHERE
	menu_price > (SELECT 
		              AVG(menu_price)
				  FROM
					  tbl_menu
				  WHERE
					  category_code = a.category_code);
					
/* EXISTS */
-- 조회 결과가 있을 때 true 아니면 false

/* 메뉴가 있는 카테고리 조회 */
SELECT
	category_name
FROM
	tbl_category a
WHERE
	exists(SELECT
		        1
		    FROM
				tbl_menu b
			WHERE
				b.category_code = a.category_code
				)
ORDER BY 1;


/* CTE(Common Table Expressions) */
-- 파생테이블과 비슷한 개념이며 코드의 가독성과 재사용성을 위해 파생 테이블 대신 사용하게 된다. 
-- FROM절에서만 사용됨 (JOIN일 시 JOIN 구문에서도 가능) 

WITH menucate AS (SELECT
					   menu_name,
                       category_name
				  FROM
					   tbl_menu a
				  JOIN
					   tbl_category b on a.category_code = b.category_code
                       )
SELECT
	*
FROM
	menucate
ORDER BY 
	menu_name;
	
	