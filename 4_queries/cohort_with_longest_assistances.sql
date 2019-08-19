SELECT c.name, AVG (a.completed_at - a.started_at) as average_assistance_time
  FROM cohorts c JOIN students s ON s.cohort_id = c.id
                 JOIN assistance_requests a ON a.student_id = s.id
  GROUP BY c.name
  ORDER BY average_assistance_time DESC
  LIMIT 1; 