select * from mydb.emp;

select e1.eid 'emp ID', e1.ename 'emp Name', e2.eid 'mrg ID', e2.ename 'mrg Name' from emp e1 join emp e2
on e1.mid = e2.eid;

#--------------------------

INSERT INTO `mydb`.`customer` (`cid`, `cname`)  VALUES (3, `lakshman`);
INSERT INTO `mydb`.`account` (`aid`, `bal`) VALUES (12, 4321);
INSERT INTO `mydb`.`customer_account`(`cid`,`aid`) VALUES (2, 11);

SELECT * FROM mydb.account;

SELECT * FROM mydb.customer_account;

SELECT * FROM mydb.customer;


select c.cid, c.cname, sum(a.bal) from customer c join account a join customer_account ca
on c.cid = ca.cid and a.aid = ca.aid
group by ca.cid having count(ca.aid) > 1


