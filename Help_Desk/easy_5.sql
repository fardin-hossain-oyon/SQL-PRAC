SELECT  DATE_FORMAT(Shift.Shift_date,'%Y-%m-%d') AS Shift_date
       ,Shift.Shift_type
       ,Staff.First_name
       ,Staff.Last_name
FROM Staff
JOIN Shift
ON Shift.Manager = Staff.Staff_code
JOIN Level
ON Level.Level_code = Staff.Level_code
WHERE Level.Manager = 'Y'
ORDER BY Shift_date