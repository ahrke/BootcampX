SELECT st.name, AVG (s.duration) as student_average_duration, AVG (a.duration) as estimated_assignment_duration
  FROM students st
  JOIN assignment_submissions s
    ON st.id = s.student_id
  JOIN assignments a
    ON a.id = s.assignment_id
  WHERE st.end_date IS NULL
  GROUP BY st.name
  HAVING AVG (s.duration) < AVG (a.duration)
  ORDER BY student_average_duration;