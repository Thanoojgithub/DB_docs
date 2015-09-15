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


