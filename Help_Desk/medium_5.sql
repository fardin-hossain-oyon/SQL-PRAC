SELECT Staff.First_name, Staff.Last_name, Issue.Call_date
FROM Issue
JOIN Caller ON Caller.Caller_id = Issue.Caller_id
JOIN Staff ON Staff.Staff_code = Issue.Taken_by
WHERE Caller.First_name = 'Harry'
ORDER BY Issue.Call_date DESC
LIMIT 1