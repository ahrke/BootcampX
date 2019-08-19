SELECT c.name, count(s.*) as student_count
  FROM cohorts c
  JOIN students s ON s.cohort_id = c.id
  GROUP BY c.name
  HAVING count(s.*) > 17
  ORDER BY student_count;