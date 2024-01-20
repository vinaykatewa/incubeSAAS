// const express = require('express');
// const cors = require('cors');
// const perplexity = require("node_perplexityai");

// const app = express();

// let port = 5000;
// app.use(express.json(), cors());


// app.get('/test', async (req, res) => {
//   try {
//     const result = await main();
//     console.log('this is the response: '+result);
//     res.send(result);
//   } catch (error) {
//     console.error(error);
//     res.status(500).send('An error occurred while sending the message.');
//   }
// });

// app.listen(port, ()=>{
//   console.log('listening on port: '+port);
// });



const google = require('googlethis');
const express = require("express");
const app = express();
const bodyParser = require("body-parser");

app.use(bodyParser.json());
const options = {
  page: 0, 
  safe: false, // Safe Search
  parse_ads: false, // If set to true sponsored results will be parsed
  additional_params: { 
    // add additional parameters here, see https://moz.com/blog/the-ultimate-guide-to-the-google-search-parameters and https://www.seoquake.com/blog/google-search-param/
    hl: 'en' 
  }
}

app.post('/home', async (req, res) => {
    try {
      const answer = await google.search(req.body.prompt, options);;
      console.log(answer.results);
        res.json({ answer }); // Sending the response as JSON
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ error: 'An error occurred' });
    }
});

const PORT = 5000;

app.listen(PORT, () => {
    console.log('Running on PORT:'+ PORT);
});