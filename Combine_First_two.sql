CREATE TABLE `jun20-july20`
    SELECT f1.`Account`,f1.`Service ID`,f1.`Component1`,f1.`Component2`,f1.jun20_charge,m1.jul20_charge
FROM (
    SELECT `Account`,`Service ID`,`Component1`,`Component2`, SUM(`Sum of CurrentMonthCharges`) jun20_charge FROM lumen_mrc_062020 f1
    Group By `Account`,`Service ID`,`Component1`,`Component2`
	) f1
LEFT JOIN 
(
	SELECT `Account`,`Service ID`,`Component1`,`Component2`, SUM(`Sum of CurrentMonthCharges`) jul20_charge FROM lumen_mrc_072020 f1
    Group By `Account`,`Service ID`,`Component1`,`Component2`
)m1 ON f1.`Account`=m1.`Account` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`

UNION

SELECT m1.`Account`,m1.`Service ID`,m1.`Component1`,m1.`Component2`,m1.jun20_charge,f1.jul20_charge
FROM (
    SELECT `Account`,`Service ID`,`Component1`,`Component2`, SUM(`Sum of CurrentMonthCharges`) jul20_charge FROM lumen_mrc_072020 f1
    Group By `Account`,`Service ID`,`Component1`,`Component2`
	) f1
RIGHT JOIN (
	SELECT `Account`,`Service ID`,`Component1`,`Component2`, SUM(`Sum of CurrentMonthCharges`) jun20_charge FROM lumen_mrc_062020 f1
    Group By `Account`,`Service ID`,`Component1`,`Component2`
)m1 ON f1.`Account`=m1.`Account` AND f1.`Service ID`=m1.`Service ID` AND f1.`Component1`=m1.`Component1` AND f1.`Component2`=m1.`Component2`
