const args = process.argv.slice(2);

const { Pool } = require('pg');

const pool = new Pool({
  user: '',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT distinct t.name as teacher, c.name as cohort
  FROM teachers t JOIN assistance_requests r 
      ON t.id = r.teacher_id
    JOIN students s ON s.id = r.student_id
    JOIN cohorts c ON c.id = s.cohort_id
  WHERE c.name = '${args[0]}'
  ORDER BY t.name;
`)
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`);
})})
.catch(err => console.error('query error', err.stack));