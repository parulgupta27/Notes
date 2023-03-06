const mongoose=require("mongoose");
const url="mongodb+srv://parul:<password>@cluster1.xqidgj3.mongodb.net/Notes";
mongoose.set("strictquery",false);
mongoose.connect(url);
