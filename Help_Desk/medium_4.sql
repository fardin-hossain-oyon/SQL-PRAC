SELECT DATE_FORMAT(Shift.Shift_date,'%Y-%m-%d') AS Shift_date, Shift_Type, COUNT(*)
FROM Shift
JOIN Staff ON Manager = Staff_code
OR Operator = Staff_code
OR Engineer1 = Staff_code
OR Engineer2 = Staff_code
GROUP BY Shift_date, Shift_type