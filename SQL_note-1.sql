select * from mydb.emp;

#-- here, e1 is for employee and e2 is for manager
select e1.eid 'emp ID', e1.ename 'Emp Name', e2.eid 'Mrg ID', e2.ename 'Mrg Name' 
from emp e1 join emp e2
on e1.mid = e2.eid;


select e1.eid 'emp ID', e1.ename 'Emp Name', ifnull(e2.eid , 'No Mrg ID') 'Mrg ID', ifnull(e2.ename , 'No Mrg name')  'Mrg Name' 
from emp e1 left join emp e2
on e1.mid = e2.eid; 


#--------------------------------------------------

INSERT INTO `mydb`.`customer` (`cid`, `cname`)  VALUES (3, `lakshman`);
INSERT INTO `mydb`.`account` (`aid`, `bal`) VALUES (12, 4321);
INSERT INTO `mydb`.`customer_account`(`cid`,`aid`) VALUES (2, 11);

SELECT * FROM mydb.account;

SELECT * FROM mydb.customer_account;

SELECT * FROM mydb.customer;


select c.cid, c.cname, sum(a.bal) from customer c join account a join customer_account ca
on c.cid = ca.cid and a.aid = ca.aid
group by ca.cid having count(ca.aid) > 1


#------------------------------------------------------------

ALTER TABLE mydb.emp ADD COLUMN salary double;

update mydb.emp set salary=80000 where eid=5;

#---- second highest salary ---- in MYSQL 
select salary from (select e.eid, e.ename, e.salary from mydb.emp e order by salary desc limit 2) e order by e.salary limit 1 ;

#ALTER TABLE mydb.emp DROP COLUMN salary;
#ALTER TABLE mydb.emp ADD COLUMN age INT AFTER salary;
#ALTER TABLE mydb.emp ADD age INT FIRST;
#ALTER TABLE mydb.emp MODIFY column salary float(30,2);
#ALTER TABLE mydb.emp CHANGE salary j BIGINT;

#-------------------using--GROUP BY--HAVING------ORDER BY-----------------------------------

SELECT *
FROM mydb.emp e
WHERE e.salary >= 70000
GROUP BY e.mid
HAVING count(e.mid) > 1 ORDER BY e.salary DESC;
