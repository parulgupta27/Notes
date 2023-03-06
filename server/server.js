const { json } = require("body-parser");
const express=require("express");
const app=express();
app.use(json);
app.listen(3001,(error)=>{
if(error){
    console.log("Some error occured");
}
console.log("Server running at port : 3001");
});