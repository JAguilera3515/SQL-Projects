SELECT f1.`Account`,f1.`SubAccountNumber`,f1.`Service ID`,f1.`Component1`,f1.`Component2`,f1.feb_charges,m1.mar_charges
FROM (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) feb_charges 
    FROM feb_2021 
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,`Sum of CurrentMonthCharges`) f1
LEFT JOIN (
    SELECT `Account`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) mar_charges 
    FROM mar_2021 
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`
	) m1 
ON f1.`Account`=m1.`Account` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`

UNION

SELECT m1.`Account`,m1.`SubAccountNumber`,m1.`Service ID`,m1.`Component1`,m1.`Component2`,f1.feb_charges,m1.mar_charges
FROM (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) feb_charges 
    FROM feb_2021 
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,`Sum of CurrentMonthCharges`) f1
RIGHT JOIN (
    SELECT `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`,SUM(`Sum of CurrentMonthCharges`) mar_charges 
    FROM mar_2021 
    GROUP BY `Account`,`SubAccountNumber`,`Service ID`,`Component1`,`Component2`
	) m1 
ON f1.`Account`=m1.`Account` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`
