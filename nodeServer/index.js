const axios = require('axios');
const express = require('express');
const cheerio = require('cheerio');
const cors = require('cors');
const { json } = require('body-parser');
const app = express();

let port = 5000;

//we need to use app.use, its a middleware
app.use(express.json(), cors());
//lets make the post method that will talk to google ai api
// Define the web page to scrape
const url = 'https://www.linkedin.com/company/incube-club/';

// Make a request to the web page using axios
app.get('/scrape', (req, res) => {
  // Make a request to the web page using axios
  axios.get(url)
    .then(response => {
      // Load the html into cheerio
      const $ = cheerio.load(response.data);

      // Initialize a JSON object to store the scraped data
      const scrapedData = {
        title: $('title').text(),
        metaDescription: $('meta[name="description"]').attr('content'),
        jsonLD: JSON.parse($('script[type="application/ld+json"]').html() || '{}')
      };

      // Send the scraped data as response
      res.json(scrapedData);
    })
    .catch(error => {
      // Handle any errors
      console.error(error);
      res.status(500).send('An error occurred while scraping');
    });
});

async function aiPost(prompt, company) {
let data = JSON.stringify({
  "contents": [
    {
      "parts": [
        {
          "text": prompt+ 'give me detail of '+ company +'from the data in formate of keys and values, if any key and value is not present then provide empty string to it. We need these keys and values, Name, linkedin links of company and founders, description ,total funding, Sector, Industry, city, state, country, stage'
        }
      ],
    }
  ],
  "generationConfig": {
    "temperature": 0,
    "top_p": 1,
"top_k": 1,
"max_output_tokens": 4048,
  }
});

let config = {
  method: 'post',
  url: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBv-635iuGgse8YjaKz1The0LFyNgS6Gh0',
  headers: { 
    'Content-Type': 'application/json'
  },
  data : data,

};

try {
  let magicResponse = await axios.request(config);
  return magicResponse.data;
} catch (error) {
  console.log(error);
  return {error: 'Something went wrong'};
}
}
async function putUserImage(base64Data, name){
  const axios = require('axios');

let config = {
  method: 'put',
  maxBodyLength: Infinity,
  url: 'https://mkb27guk1m.execute-api.eu-north-1.amazonaws.com/incubeFileApiStaging/userimages3/' + name,
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

async function getUserImage(name){
let config = {
  method: 'get',
  maxBodyLength: Infinity,
  url: 'https://mkb27guk1m.execute-api.eu-north-1.amazonaws.com/incubeFileApiStaging/userimages3/'+name,
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

async function searchingGoogle(searchprompt){
let config = {
  method: 'get',
  maxBodyLength: Infinity,
  url: 'https://www.googleapis.com/customsearch/v1?key=AIzaSyBcb-5I5nzJ8CO_gtYuyl1y7HF-ODPzAAI&cx=8193ef8548e04483c&q='+searchprompt,
  headers: { }
};

async function makeRequest() {
  try {
    const response = await axios.request(config);
    return response.data;
  }
  catch (error) {
    console.log(error);
  }
}

return makeRequest();

}
async function startupIndia(companyName){
let data = JSON.stringify({
  "query": companyName,
  "focusSector": false,
  "industries": [],
  "sectors": [],
  "states": [],
  "cities": [],
  "stages": [],
  "badges": [],
  "roles": [],
  "page": 0,
  "sort": {
    "orders": [
      {
        "field": "registeredOn",
        "direction": "DESC"
      }
    ]
  },
  "dpiitRecogniseUser": true,
  "internationalUser": false
});

let config = {
  method: 'post',
  maxBodyLength: Infinity,
  url: 'https://api.startupindia.gov.in/sih/api/noauth/search/profiles',
  headers: { 
    'Content-Type': 'application/json'
  },
  data : data
};

async function makeRequest() {
  try {
    const response = await axios.request(config);
    return JSON.stringify(response.data)
  }
  catch (error) {
    console.log(error);
  }
}

return makeRequest();

}

async function openAi(prompt, company){
  let data = JSON.stringify({
    "model": "gpt-3.5-turbo",
    "messages": [
      {
        "role": "system",
        "content": "The use will provide a json response of an api and you have to fillter that data and provide the name of the company that metioned in that provided json reponse"
      },
      {
        "role": "user",
        "content": 'This is the response from an api '+ prompt,
      }
    ]
  });
  let config = {
    method: 'post',
    maxBodyLength: Infinity,
    url: 'https://api.openai.com/v1/chat/completions',
    headers: { 
      'Content-Type': 'application/json', 
      'Authorization': 'Bearer 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', 
      'Cookie': '__cf_bm=SIpXp2zzHKkE7wwUWZG_XOK.Kp1tD6.W7zmbEUYktx4-1705401730-1-AbrkfhBoJE58SlYBpwrYT17TtH3qzHkg35nE0nl21c7y43w+lwXbeO0ZpAKz1H/DQFN3DjVYel3RgSsBvNPj6a8=; _cfuvid=cejnnLgaO0_ruUVhPI6kHv3Hs8e9XtihIE7uxbBdKXs-1705398770804-0-604800000'
    },
    data : data
  };
  async function makeRequest() {
    try {
      const response = await axios.request(config);
      // console.log(JSON.stringify(response.data));
      return response.data;
    }
    catch (error) {
      console.log(error);
    }
  }
  const response = await makeRequest();
  return response;
}

async function getSheetAllData(){
let config = {
  method: 'get',
  maxBodyLength: Infinity,
  url: 'https://script.google.com/macros/s/AKfycbzowixFCmuyNSzoHbI3UTo7Tk4opJLk7yqQ23V-WIqHz5GqE2snmI9VsGTegZ7gswHrUQ/exec',
  headers: { }
};
async function makeRequest() {
  try {
    const response = await axios.request(config);
    console.log(JSON.stringify(response.data));
    return response.data;
  }
  catch (error) {
    console.log(error);
  }
}

return makeRequest();

}

app.get('/getSheetData', async(req, res) => {
  let response = await getSheetAllData();
  res.send(response);
});

app.post('/gettingCompanyDetails', async(req, res)=> {
  try {
    const searchResponse = await searchingGoogle(req.body.name);
    // const itemsArray = searchResponse.items || [];
    const string1 = JSON.stringify(searchResponse);
    const searchStartupIndia = await startupIndia(req.body.name);
    const string2 = JSON.stringify(searchStartupIndia);
    const string3 = string1 + "\n" + string2;
    const aiResponse2 = await aiPost(string3, req.body.name);
    res.send(aiResponse2);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Something went wrong' });
  }
});


app.get('/getUserImage', async(req, res) => {
  let name = req.query.name;
  console.log('this is the key that we are using: '+ name);
  let response = await getUserImage(name);
  console.log('we are done running getItem method');
  // console.log('this is the response: ' + response);
  res.send(response);
});
app.get('/getItemMethod', async(req, res) => {
  console.log('now we going to run getItem()');
  let name = req.query.name;
  console.log('this is the key that we are using: '+ name);
  let response = await getItem(name);
  console.log('we are done running getItem method');
  // console.log('this is the response: ' + response);
  res.send(response);
});



app.post('/putUserImage', async(req, res) => {
  let response = await putUserImage(req.body.data, req.body.name)
  console.log(response);
  res.send(response);
})
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

app.post('/fetchData', async (req, res) => {
  try {
    const response = await axios.get('https://script.google.com/macros/s/AKfycbztUplT59vruhzrWjZekKA5biKU108NTYAvn5kaHlhD06bAdVZVatwuEa66DUTYSZUJOA/exec', {
      params: {
        id: req.body.id,
      },
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Cookie': '__Host-GAPS=1:o6CQoKSscVhY7ac_MVuNvrQOnZqzRg:j4m1EQIc7nH06Nl-',
      },
    });

    res.json(response.data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred while fetching data.' });
  }
})

app.listen(port, ()=>{
  console.log('listening on port: '+port);
});
