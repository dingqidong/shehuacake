
const express=require('express');
//加载cors模块
const cors=require('cors');

const bodyParser=require('body-parser');
const app=express();
app.listen(3000);
//使用cros模块
app.use(cors({
    origin:['http://localhost:8080','http://127.0.0.1:8080']
}));
app.use(cors({
    origin:['http://127.0.0.1:8081','http://localhost:8081']
}));


app.use(bodyParser.urlencoded({
    extended:false
}));




const proRouter=require('./axios/cake.js');
app.use('/case',proRouter);

const serverRouter=require('./axios/cake_server.js');
app.use('/server',serverRouter);


