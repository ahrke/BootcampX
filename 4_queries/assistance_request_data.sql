SELECT t.name as teacher, s.name as student, a.name as assignment, r.completed_at - r.started_at as duration
  FROM teachers t JOIN assistance_requests r ON t.id = r.teacher_id
                  JOIN students s            ON s.id = r.student_id
                  LEFT OUTER JOIN assignments a         ON a.id = r.assignment_id
  ORDER BY duration;
