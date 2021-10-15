CREATE TABLE feb_sept AS
SELECT *
FROM (
SELECT f1.`Account`,f1.`SubAccountNumber`,f1.`Service ID`,f1.`Component1`,f1.`Component2`,f1.feb_charges,f1.mar_charges,f1.apr_charges,f1.may_charges,f1.jun_charges,f1.jul_charges,f1.aug_charges,m1.sep_charges
FROM feb_aug f1
LEFT JOIN (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) sep_charges 
    FROM sep_2021
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`) m1 
ON f1.`Account`=m1.`Account` AND f1.`SubAccountNumber`=m1.`SubAccountNumber` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`

UNION

SELECT m1.`Account`,m1.`SubAccountNumber`,m1.`Service ID`,m1.`Component1`,m1.`Component2`,f1.feb_charges,f1.mar_charges,f1.apr_charges,f1.may_charges,f1.jun_charges,f1.jul_charges,f1.aug_charges,m1.sep_charges
FROM feb_aug f1
RIGHT JOIN (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) sep_charges 
    FROM sep_2021
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`) m1 
ON f1.`Account`=m1.`Account` AND f1.`SubAccountNumber`=m1.`SubAccountNumber` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`) t
