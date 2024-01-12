const axios = require('axios');
const express = require('express');
const cors = require('cors');
const app = express();

let port = 5000;

//we need to use app.use, its a middleware
app.use(express.json(), cors());
//lets make the post method that will talk to google ai api
async function aiPost(prompt) {
let data = JSON.stringify({
  "contents": [
    {
      "parts": [
        {
          "text": prompt
        }
      ]
    }
  ]
});

let config = {
  method: 'post',
  url: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBv-635iuGgse8YjaKz1The0LFyNgS6Gh0',
  headers: { 
    'Content-Type': 'application/json'
  },
  data : data
};

try {
  let magicResponse = await axios.request(config);
  return magicResponse.data;
} catch (error) {
  console.log(error);
  return {error: 'Something went wrong'};
}
}
async function putItemToS3(base64Data, name){
  const axios = require('axios');

let config = {
  method: 'put',
  maxBodyLength: Infinity,
  url: 'https://mkb27guk1m.execute-api.eu-north-1.amazonaws.com/incubeFileApiStaging/incubefilesystem/' + name,
  headers: {
    'Content-Type': 'application/pdf'
  },
  data : base64Data
};

async function makeRequest() {
  try {
    const response = await axios.request(config);
    console.log(JSON.stringify(response.data));
  }
  catch (error) {
    console.log(error);
  }
}

  return await makeRequest();
}

async function getItem(name){
let config = {
  method: 'get',
  maxBodyLength: Infinity,
  url: 'https://mkb27guk1m.execute-api.eu-north-1.amazonaws.com/incubeFileApiStaging/incubefilesystem/'+name,
};
async function makeRequest() {
  try {
    const response = await axios.request(config);
    // console.log(JSON.stringify(response.data));
    return JSON.stringify(response.data);
  }
  catch (error) {
    console.log(error);
  }
}
  return makeRequest();
}


app.get('/getItemMethod', async(req, res) => {
  console.log('now we going to run getItem()');
  let name = req.query.name;
  console.log('this is the key that we are using: '+ name);
  let response = await getItem(name);
  console.log('we are done running getItem method');
  // console.log('this is the response: ' + response);
  res.send(response);
});



app.post('/putItem', async(req, res) => {
  let response = await putItemToS3(req.body.data, req.body.name)
  console.log(response);
  res.send(response);
})


app.post('/aiPrompting', async(req, res) => {
  let response = await aiPost(req.body.prompt)
  console.log(response);
  res.send(response);
})

app.listen(port, ()=>{
  console.log('listening on port: '+port);
});
