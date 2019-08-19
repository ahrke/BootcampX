SELECT s.name, s.start_date, c.name as cohort_name, c.start_date as cohort_start_date
  FROM students s JOIN cohorts c ON s.cohort_id = c.id
  WHERE s.start_date < c.start_date; 