var express = require('express');
var app = express();
var mysql = require('mysql');
var moment = require('moment-timezone');
var connection = mysql.createConnection({
  host: "localhost",
  user: "looby10120",
  password: "",
  database:'database_people'
});

var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});
//router.use(express.static(path.resolve(__dirname, 'client')));

connection.connect(function(err){
if(!err) {
    console.log("Database is connected ... nn");    
} else {
    console.log("Error connecting database ... nn");    
}
});

app.listen(process.env.PORT || 4424, function(){
  console.log("Chat server listening at port 7777!");
  
app.use(express.static(__dirname + '/client'));
  
function tagHeadTitle(title)
{
  return `
  <head>
    <title>`+title+` - Database Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    
  </head>
  <body>
  <div>
    <ul>
      <li><a class="active" href="#home">Home</a></li>
      <li><a href="#news">News</a></li>
      <li><a href="#contact">Contact</a></li>
      <li><a href="#about">About</a></li>
    </ul>
  </div>`;
}


app.get("/a",function(req,res){
  res.send(tagHeadTitle('Homepage')+`
      <div class="w3-container">
        <h2>Bordered Table</h2>
        <p>The w3-bordered class adds a bottom border to each table row:</p>
      
        <table class="w3-table-all w3-hoverable">
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Points</th>
          </tr>
          <tr>
            <td>Jill</td>
            <td>Smith</td>
            <td>50</td>
          </tr>
        </table>
      </div>
      <div>
        <form >
        First name: <input type="text" name="FirstName" value="Mickey"><br>
        Last name: <input type="text" name="LastName" value="Mouse"><br>
        <input type="submit" value="Submit">
        </form>
      </div>
      <div>
        <form action="/select_all_type">
          <input type="submit" value="Go to Google s " />
        </form>
      </div>
    </body>
  </html>
  `);
});

  app.get('/select_all_type', function(req, res) {
      var sql = "SELECT * FROM Running_types";
      connection.query(sql, function(err, result) {
          if (!err && res.statusCode == 200){
              res.status(200);
              res.json(result);
          }
          else {
              //throw err
              res.status(404);
              res.send('Not Found');
          }
          //res.send('OK');
          //console.log(res.statusCode,res.statusMessage)
      });
  });

  app.post('/select_type', function(req, res) {
    var type_ID = req.body.running_type_ID;
    var sql = "SELECT * FROM Running_types WHERE Running_type_ID = " + type_ID;
    console.log(type_ID);
    if(type_ID == undefined){
      res.status(404)
      res.send("Error")
    }else{
      connection.query(sql, function(err, result) {
          if (!err && res.statusCode == 200){
              res.status(200);
              res.json(result);
          }
          else {
              //throw err
              res.status(404);
              res.send('Not Found');
          }
          //res.send('OK');
          //console.log(res.statusCode,res.statusMessage)
      });
    }
  });
  
  app.post('/insert', function(req, res) {
    
    function generate_running_no(user_type){
    var sql = "SELECT COUNT(running_no) AS runner_count FROM User WHERE running_no LIKE '%"+ user_type +"%'";
    console.log(sql);
      connection.query(sql, function(err, result){
          if(!err && res.statusCode == 200) {
              var running_no = user_type+(result[0].runner_count+1);
              insert_runner_data(running_no);
              console.log("Generated Complete");
          } else {
              //res.status(404);
              res.send('Not Found');
              console.log("Error");
          }
      });
    }
    
  function insert_runner_data(running_no){
    var sql = 'INSERT INTO User SET ?';
    var date = new Date();
    var format = 'YYYY-MM-DD HH:mm:ss';
    var time = moment(date, format).tz("Asia/Jakarta").format(format);
    console.log(time,date);
    var data = {
            "name" : req.body.name, 
            "gender" : gender,
            "age" : age,
            "email" : req.body.email,
            "address" : req.body.address, 
            "telephone" : req.body.telephone,
            "running_no" : running_no,
            "created_on" : time
        };
    console.log(sql);
      connection.query(sql,data, function(err, result){
          if(!err && res.statusCode == 200) {
              res.send(data);
              console.log("Insert Data Complete");
          } else {
              //res.status(404);
              res.send('Not Found');
              console.log("Error");
          }
      });
    }
    
    function user_check(age,gender){
      var running_type = "";
      var age_range = [19,29,39,45,59];
      
      if(gender == 1){
        running_type += "M";
      }else{
        running_type += "F";
      }
      
    if(age >= 60){
      running_type += "60";
    }else if(age < 10){
          running_type = "";
    }else{
      for(var i=0; i< age_range.length; i++){
        //console.log(age_range[i] - age)
        if(age_range[i] - age >= 0 && age_range[i] - age < 10){
          running_type += (i+1)*10;
        }
      }
    }
      return running_type;
    }
    
    
    var gender = req.body.gender;
    var age = req.body.age;
    var user_type = user_check(age,gender);
    generate_running_no(user_type);
    //res.send(data);
    /*if(gender == 0){
      count_data_lenght(gender);
      //console.log("Male");
    }else{
      count_data_lenght(gender);
      //console.log("Female");
    }*/
    
  });
});
