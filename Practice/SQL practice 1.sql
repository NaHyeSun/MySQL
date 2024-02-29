-- 1.
SELECT
	category_code,
    category_name
FROM
	tbl_category
WHERE ref_category_code IS NOT NULL
ORDER BY
	category_name DESC;

-- 2.
SELECT
	menu_name,
    menu_price
FROM
	tbl_menu
WHERE
	menu_name LIKE '%밥%'AND
	menu_price >= 20000 AND
    menu_price <= 30000;
-- 3. 
SELECT
    menu_code,
	menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	menu_price < 10000 OR
    menu_name LIKE '%김치%'
ORDER BY
	menu_price ASC,
    menu_name DESC; 
    
-- 4.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM
	tbl_menu
WHERE
	category_code NOT IN (10, 9, 8)
    AND menu_price = 13000
    AND orderable_status <>'N';    -- <> 는 != 와 동일한 기능이다. 
    
    



	

    