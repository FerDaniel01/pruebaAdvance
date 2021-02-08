const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());
app.use(express.json());


const db =mysql.createConnection({
    user: 'usuariomio',
    host:'localhost',
    password: 'clavemia',
    database:'enterprises',

});


app.post('/create', (req, res)=>{

    const firstname = req.body.firstname;
    const lastname = req.body.lastname;
    const gender= req.body.gender;
    const email = req.body.email;
    const phonenumber = req.body.phonenumber;
    const adress = req.body.adress;
    const documenttype = req.body.documenttype;
    const documentnumber = req.body.documentnumber;
    var todaydate = new Date();

    var date1=todaydate.getFullYear() +'-'+(todaydate.getMonth()+1)+'-'+todaydate.getDate();
    var hour1=todaydate.getHours()+':'+todaydate.getMinutes()+':'+todaydate.getSeconds();
    const created= date1+ ' '+ hour1;

    db.query("INSERT INTO employee ( firstname, lastname, gender, email, phonenumber, adress, documenttype, documentnumber, created ) VALUES(?,?,?,?,?,?,?,?,? )",
    [firstname, lastname, gender, email,phonenumber, adress, documenttype, documentnumber, created],
    (err, result)=>{
        if(err){

                console.log(err);

        }else {
            res.send("Values Inserted");

        }

    }
    );
    

});

app.get('/employees', (req, res)=>{
 db.query("SELECT * FROM employee", (err, result)=>{
    if (err){
        console.log(err);


    }else {
        res.send(result);

    }


 });


});

app.put('/update', (req, res)=>{
    const employeeid = req.body.employeeid;
    const firstname =req.body.firstname;
    const lastname = req.body.lastname;
    const gender= req.body.gender;
    const email = req.body.email;
    const phonenumber = req.body.phonenumber;
    const adress= req.body.adress;
    const documenttype= req.body.documenttype;
    const documentnumber = req.body.documentnumber;
    
    
    //const updated = "2030-02-02 12:12:54"
    var todaydate = new Date();

    var date1=todaydate.getFullYear() +'-'+(todaydate.getMonth()+1)+'-'+todaydate.getDate();
    var hour1=todaydate.getHours()+':'+todaydate.getMinutes()+':'+todaydate.getSeconds();
    const updated= date1+ ' '+ hour1;


    db.query(
        "UPDATE employee set firstname=?, lastname=?, gender=?, email=?, phonenumber =?, adress=?, documenttype=?, documentnumber=?, updated =?   WHERE employeeid = ?", 
        [firstname, lastname, gender ,email,  phonenumber, adress, documenttype, documentnumber, updated, employeeid], 
        (err, result)=>{
        if (err){
            console.log(err);


    } else {
        res.send(result);

      }


    }
    );



});



app.delete('/delete/:employeeid', (req, res)=>{
    const employeeid = req.params.employeeid
    db.query("DELETE FROM employee WHERE employeeid = ?", employeeid, (err, result)=>{
        if(err){
            console.log(err);


        }else{

            res.send(result);
        }


    });
});


app.listen(3001, ()=>{
    console.log("Yes, your server is running on port 3001");

});


