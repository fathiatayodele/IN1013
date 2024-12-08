-- 1

CREATE VIEW samsBills AS
SELECT t1.first_name, t1.surname, t2.bill_date, t2.cust_name, t2.bill_total
FROM restStaff t1
JOIN restBill t2 ON t1.staff_no = t2.waiter_no
WHERE t1.first_name = 'Sam' AND t1.surname = 'Pitt';

-- 2

SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals AS
SELECT RM.room_name, b.bill_total AS total_sum
FROM restRoom_management RM
JOIN restBill b ON RM.room_name = (SELECT room_name FROM restRest_table WHERE table_no = b.table_no)
GROUP BY RM.room_name;


-- 4

I am unsure how to do thiss unfortunately

