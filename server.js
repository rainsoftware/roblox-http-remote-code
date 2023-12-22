const express = require('express');
const app = express();
const fs = require('fs');
const bodyParser = require('body-parser');

app.use(bodyParser.text()); // To parse text/plain content type in the request body

// Handle POST request to /scripts
app.post('/scripts', (req, res) => {
  const script = req.body; // Assuming the script is sent in the request body

  // Save the script to a file in the 'scripts' folder
  const filePath = __dirname + '/scripts/test.lua';
  fs.writeFileSync(filePath, script);

  res.send('Script stored successfully');
});

// Handle GET request to /scripts
app.get('/scripts', (req, res) => {
  // Read the script from the file in the 'scripts' folder
  const filePath = __dirname + '/scripts/test.lua';
  const script = fs.readFileSync(filePath, 'utf-8');

  res.send(script);
});

const PORT = process.env.PORT || 3000; // Use the provided port or default to 3000
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
