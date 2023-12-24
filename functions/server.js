const express = require('express');
const app = express();
const fs = require('fs');
const bodyParser = require('body-parser');

app.use(bodyParser.text()); 


app.post('/scripts', (req, res) => {
  const script = req.body; 

  const filePath = __dirname + '../scripts/test.lua';
  fs.writeFileSync(filePath, script);

  res.send('Script stored successfully');
});

app.get('/scripts', (req, res) => {
  const filePath = __dirname + '../scripts/test.lua';
  const script = fs.readFileSync(filePath, 'utf-8');

  res.send(script);
});

const PORT = process.env.PORT || 3000; 
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
