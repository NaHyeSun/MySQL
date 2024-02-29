/* DATA_TYPES */

-- 명시적 형변환
-- CAST (expression AS 데이터형식[(길이)])     --AS로 표현
-- CONVERT (expression, 데이터 형식[(길이)]    -- ,로 표현
-- 데이터 형식으로 가능한 것은 BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON ,
-- SIGNED, INTEGER, TIME, UNSIGNED INTEGER 등이 있다. 

SELECT
	AVG(menu_price)
FROM
	tbl_menu;
    
-- cast 사용
SELECT 
	CAST(AVG(menu_price) AS SIGNED INTEGER) AS '평균메뉴 가격'     
    -- signed integer : 음수, 0, 양수를 모두 포함하는 정수 값을 저장할 수 있다. 
FROM
	 tbl_menu;    -- 형변환으로 소수점 뒤 사라지고 정수값 반환.
     
-- convert 사용
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) AS '평균메뉴 가격'
FROM
	tbl_menu;

-- 날짜 
SELECT CAST('2024$2$23' AS DATE);
SELECT CAST('2024/2/23' AS DATE);
SELECT CAST('2024%2%23' AS DATE);
SELECT CAST('2024@2@23' AS DATE);

-- concat 사용
SELECT
	CONCAT(CAST(menu_price AS CHAR(5)), '원')       -- 5는 길이값 지정해주는 것 
FROM
	tbl_menu;

-- 카테고리별 메뉴 가격 합계 구하기
SELECT
	category_code,
   CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원')
FROM
	tbl_menu
GROUP BY 
	category_code;
    
-- 암시적 형변환
SELECT '1' + '2';  -- 각 문자가 정수로 변환됨 
--
SELECT CONCAT(menu_price, '원') FROM tbl_menu;   -- menu_price가 문자로 변환됨 
SELECT 3 > 'MAY';    -- 문자는 0으로 변환된다. 

SELECT 5 > '6MAY';   -- 문자에서 첫번째로 나온 숫자는 정수로 전환된다.
SELECT 5 > 'M6AY';   -- 숫자가 뒤에 나오면 문자로 인식되어 0으로 변환된다. 

SELECT '2024-2-23';  -- 날짜형으로 바뀔 수 있는 문자는 DATE형으로 변환된다. 
