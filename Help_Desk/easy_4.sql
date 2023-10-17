SELECT COUNT(*) AS mlcc
FROM Staff
JOIN Issue ON Staff.Staff_code = Issue.Assigned_to
JOIN Level ON Staaff.Level_code = Level.Level_code
WHERE Level.Manager = 'Y'