-- LIMIT
-- SELECT문의 결과 집합에서 반환할 행의 수를 제한하는데 사용된다.
/*SELECT
	select_list
FROM
	table_name
LIMIT offset,  row_count;
offset : 시작할 행의 번호(인덱스 체계) 
row_count : 이후 행부터 반환 받을 행의 개수 
*/

SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC;

SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC
LIMIT 1, 4;

SELECT
	menu_code,
    menu_name,
    menu_price
FROM
	tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 5;    -- 상위 다섯줄의 행만 조회 