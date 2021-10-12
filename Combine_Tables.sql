CREATE TABLE jun20_aug20 AS
SELECT *
FROM (
SELECT f1.`Account`,f1.`SubAccountNumber`,f1.`Service ID`,f1.`Component1`,f1.`Component2`,f1.jun20_charges,f1.jul20_charges,m1.aug20_charges
FROM (jun20_jul20) f1
LEFT JOIN (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) aug20_charges 
    FROM lumen_mrc_082020
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`) m1 
ON f1.`Account`=m1.`Account` AND f1.`SubAccountNumber`=m1.`SubAccountNumber` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`

UNION

SELECT m1.`Account`,m1.`SubAccountNumber`,m1.`Service ID`,m1.`Component1`,m1.`Component2`,f1.jun20_charges,f1.jul20_charges,m1.aug20_charges
FROM (jun20_jul20) f1
RIGHT JOIN (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) aug20_charges 
    FROM lumen_mrc_082020
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`) m1 
ON f1.`Account`=m1.`Account` AND f1.`SubAccountNumber`=m1.`SubAccountNumber` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`) t
