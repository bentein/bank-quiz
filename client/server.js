const express = require('express');
const app = express();

const port = 3002;
const doLog = true;

app.use(express.static('dist'))

app.listen(port, () => console.log(`Server listening on port ${port}!`));

function log(message) {
  if (doLog) console.log(message);
}
