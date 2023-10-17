SELECT call_date, Caller.First_name, Caller.Last_name
FROM Issue
JOIN Caller ON Issue.Caller_id = Caller.Caller_id
AND Caller.First_name = 'Samantha'
AND Caller.Last_name = 'Hall'
WHERE DATE(Issue.Call_date) = '2017-08-14'