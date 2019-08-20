const args = process.argv.slice(2);

const { Pool } = require('pg');

const pool = new Pool({
  user: '',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT s.id, s.name, c.name as cname
FROM students s JOIN cohorts c ON s.cohort_id = c.id
WHERE c.name = '${args[0]}'
LIMIT ${args[1] || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cname} cohort`);
})})
.catch(err => console.error('query error', err.stack));