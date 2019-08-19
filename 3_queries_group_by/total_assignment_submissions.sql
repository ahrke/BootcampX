SELECT c.name, count(a.submission_date) as total_submissions
  FROM cohorts c JOIN students s
    ON s.cohort_id = c.id
  JOIN assignment_submissions a 
    ON s.id = a.student_id
  GROUP BY c.name
  ORDER BY total_submissions DESC;