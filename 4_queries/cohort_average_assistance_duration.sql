SELECT AVG (subq.total_duration) FROM (
  SELECT c.name, SUM (r.completed_at - r.started_at) as total_duration
  FROM cohorts c JOIN students s ON s.cohort_id = c.id
                 JOIN assistance_requests r ON r.student_id = s.id
  GROUP BY c.name
  ORDER BY total_duration
) subq;