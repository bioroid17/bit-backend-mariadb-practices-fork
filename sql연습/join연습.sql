--
-- inner join
--

-- 예제1) 현재, 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
  from employees a, titles b
 where a.emp_no = b.emp_no					-- join 조건(n-1)
   and b.to_date = '9999-01-01';			-- row 선택조건

-- 예제2) 현재, 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요.
select a.emp_no, a.first_name, b.title, a.gender
  from employees a, titles b
 where a.emp_no = b.emp_no			-- join 조건(n-1)
   and b.to_date = '9999-01-01'		-- row 선택 조건1
   and a.gender = 'f'				-- row 선택 조건2
   and b.title = 'Engineer';		-- row 선택 조건3

-- 
-- ANSI/ISO SQL1999 JOIN 표준 문법
--

-- 1) natural join
--    조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않고
--    암묵적으로 조인이 된다. 
select a.first_name, b.title
  from employees a natural join titles b
 where b.to_date = '9999-01-01';
 
-- 2) join ~ using

-- natural join의 문제점
select count(*)
  from salaries a natural join titles b
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- join ~ using
select count(*)
  from salaries a join titles b using(emp_no)
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

-- join ~ on
