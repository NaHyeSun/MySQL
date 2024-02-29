/* TRANSACTION 
   데이터 베이스에서 한번에 수행되는 작업의 단위이다. 
   시작, 진행, 종료 단계를 가지며 만약 중간에 오류가 발생하면 
   롤백( 시작 이전의 단계로 되돌리는 작업)을 수행하고 
   데이터 베이스에 제대로 반영하기 위해서는 커밋( 이후 롤백이 되지 않음)을 진행한다. 
   MySQL은 기본적으로 자동 커밋 설정이 되어있어(롤백이 안됨) 롤백을 하기 위해서는
   자동 커밋 설정을 해제해 주어야 한다. */
   
-- autocommit 활성화
SET autocommit = 1;
-- 또는
SET autocommit = ON;

-- autocommit 비활성화
SET autocommit = 0;
-- 또는
SET autocommit = OFF;

START TRANSACTION;

SELECT * FROM tbl_menu;
INSERT INTO tbl_menu VALUES (null,'바나나해장국', 8500, 4, 'Y' );
UPDATE tbl_menu SET menu_name = '수정된 메뉴' WHERE menu_code = 5;
DELETE FROM tbl_menu WHERE menu_code = 7;

COMMIT;

ROLLBACK;  -- START TRANSACTION 이전 상태로 돌아감.
           -- 그러나 COMMIT 이후에는 ROLLBACK을 해도 ROLLBACK이 적용 되지 않음. 
           


    


