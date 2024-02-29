SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y';
    
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price = 13000;
    
SELECT
	menu_code,
    menu_name,
    orderable_status
FROM
	tbl_menu
WHERE
	-- orderable_status <> 'Y';
    orderable_status != 'Y';
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_price <= 20000;
    
SELECT 1 AND 1;
SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;
SELECT 1 AND NULL, NULL AND NULL;

SELECT 
	menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu	
WHERE
	orderable_status = 'Y' AND
    category_code = 10;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price > 5000 AND
    category_code = 10;
    
SELECT 1 OR 1, 1 OR 0, 0 OR 1;
SELECT 0 OR 0;
SELECT 1 OR NULL, 0 OR NULL, NULL OR NULL;

SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	orderable_status = 'Y' or
    category_code = 10
ORDER BY
	category_code;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price > 5000 or
    category_code = 10;
    
SELECT 1 OR 0 AND 0;
SELECT ( 1 OR 0 ) AND 0;

SELECT 	
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code = 4 or
    menu_price = 9000 AND
    menu_code > 10;
   --  category_code = 4 OR (menu_price = 9000 AND menu_code >10);
   
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price >= 10000 AND
    menu_price <= 25000
ORDER BY
	menu_price;
    
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price BETWEEN 10000 AND 25000
ORDER BY
	menu_price;
    
SELECT
	menu_name,
    menu_price,
    category_code
FROM
	tbl_menu
WHERE
	menu_price NOT BETWEEN 10000 AND 25000
ORDER BY
	menu_price;
    
SELECT
	menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_name LIKE '%마늘%'         -- '%' : 0개 이상의 임의의 문자  /  '_' : 하나의 임의의 문자 
ORDER BY
	menu_name;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price >5000 AND 
    category_code = 10 AND
    menu_name LIKE '%갈치%';
    
SELECT
	menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_name NOT LIKE '%마늘%'
ORDER BY
	menu_name;
    
SELECT
	menu_name,
    category_code
FROM
	tbl_menu
WHERE
	category_code = 4 OR
    category_code = 5 OR
    category_code = 6
ORDER BY
	category_code;
    
SELECT
	menu_name,
    category_code
FROM
	tbl_menu
WHERE
	category_code IN(4, 5, 6)
ORDER BY
	category_code;
    
SELECT
	menu_name,
    category_code
FROM
	tbl_menu
WHERE
	category_code NOT IN (4,5,6) -- 부정표현
ORDER BY
	category_code;
    
SELECT
	category_code,
    category_name,
    ref_category_code
FROM
	tbl_category
WHERE
	-- ref_category_code IS NULL;
    ref_category_code IS NOT NULL;