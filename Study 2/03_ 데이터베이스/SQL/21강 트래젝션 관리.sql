# 트랜젝션
# 데이터베이스에서 데이터 처리의 한 단위
# 물리적인 디스크에 데이터가 실제로 반영된 후부터 
# 다음에 반영될 까지의 작업을 의미한다.
# MySQL과 같은 다양한 DBMS들은 개발자가 테이블내의 데이터에 대해
# 무언가 작업을 하면 실제로 물리적인 디스크에 반영되지는 않는다.
# 이는 개발자가 실수로 데이터에 문제를 발생켰을 경우를 대비하기 위함이다.

# 테스트용 테이블 생성
use test_db;

drop table test_table20;

create table test_table20(
data1 int,
data2 double,
data3 char(100)
);

desc test_table20;

insert into test_table20 (data1, data2, data3) values (100, 11.11, '문자열1');
insert into test_table20 (data1, data2, data3) values (200, 21.11, '문자열2');
insert into test_table20 (data1, data2, data3) values (300, 31.11, '문자열3');
insert into test_table20 (data1, data2, data3) values (400, 41.11, '문자열4');
insert into test_table20 (data1, data2, data3) values (500, 51.11, '문자열5');

select * from test_table20;

# 되돌린다
rollback;

select * from test_table20;

insert into test_table20 (data1, data2, data3) values (100, 11.11, '문자열1');
insert into test_table20 (data1, data2, data3) values (200, 21.11, '문자열2');
insert into test_table20 (data1, data2, data3) values (300, 31.11, '문자열3');
insert into test_table20 (data1, data2, data3) values (400, 41.11, '문자열4');
insert into test_table20 (data1, data2, data3) values (500, 51.11, '문자열5');


# 데이터 수정
update test_table20
set data2 = 88.88, data3 = '문자열100'
where data1 = 100;

update test_table20
set data2 = 99.99, data3 = '문자열200'
where data1 = 200;

select * from test_table20;

# 되돌린다.
rollback;

select * from test_table20;

insert into test_table20 (data1, data2, data3) values (100, 11.11, '문자열1');
insert into test_table20 (data1, data2, data3) values (200, 21.11, '문자열2');
insert into test_table20 (data1, data2, data3) values (300, 31.11, '문자열3');
insert into test_table20 (data1, data2, data3) values (400, 41.11, '문자열4');
insert into test_table20 (data1, data2, data3) values (500, 51.11, '문자열5');

#작업 내용을 물리적인 디스크에 반영한다.
# 현재 트랜젝션이 종료되고 새로운 트랜젝션이 발생한다.
commit;

select * from test_table20;

rollback;

select * from test_table20;

update test_table20 
set data2 = 88.88, data3 = '문자열100'
where data1 = 100;

# savepoint를 설정하면 해당 위치로 롤백할 수 있다.
# savepoint를 지정하지 않으면 트랜젝션내의 모든 작업이 롤백된다.
# 롤백 지점을 정해서 필요한 위치로 롤백될 수 있도록 하는데 사용한다.
# 저는 하나의 트랜젝션 내에서 작업위 단위별로 savepoint를 만들어 두는 편이다.
savepoint aa;

update test_table20 
set data2 = 99.99, data3 = '문자열200'
where data1 = 200;

select * from test_table20;

# savepoint aa 위치로 돌아간다. 
rollback to aa;

select * from test_table20;