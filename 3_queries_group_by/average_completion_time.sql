SELECT s.name, AVG (a.duration) as average_assignment_duration
  FROM students s
  JOIN assignment_submissions a
    ON s.id = a.student_id
  WHERE s.end_date IS NULL
  GROUP BY s.name
  ORDER BY average_assignment_duration DESC;