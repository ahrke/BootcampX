SELECT day, count(*) FROM assignments
  GROUP BY day
  HAVING count(*) > 9
  ORDER BY day;