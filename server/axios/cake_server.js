const express=require('express');
const router=express.Router();
const pool=require('../pool.js');


router.get('/aLogin',(req,res)=>{
    let admin=req.query.admin;
    let apwd=req.query.apwd;
    let sql='select about_id from adminuser where adminuser_account=? and adminuser_password=?'
    pool.query(sql,[admin,apwd],(err,a)=>{
        if(err)throw err;
        if(a.length>0){
            res.send(a);
        }
    })
})

router.get('/goodList',(req,res)=>{
    let sql="select produce_id from produce_detail";
    let sum=0;
    pool.query(sql,(err,a)=>{
        if(err) throw err;
        sum=Math.ceil(a.length/5);
        let sql="SELECT * FROM produce_detail  LIMIT 0, 5";
        pool.query(sql,(err,result)=>{
          if(err)throw err;
          res.send({sum:sum,result:result});
        })
    })
});
router.get('/goodList1',(req,res)=>{
    let count=req.query.count;
    count=(count-1)*5;
    let sql=`select * from produce_detail limit ${count},5`;
    pool.query(sql,(err,a)=>{
        if(err)throw err;
        res.send(a);
    })
});

router.get('/cakeDelete',(req,res)=>{
   let i=req.query.i;
   let sql='delete from produce_detail where produce_id=?';
   pool.query(sql,[i],(err,a)=>{
       if(err)throw err;
       if(a.affectedRows>0){
           let sql='delete from produce_pic where produce_id=?';
           pool.query(sql,[i],(err,b)=>{
               if(err)throw err;
               if(b.affectedRows>0){
                   res.send('1');
               }
           })
       }
   })
});

router.get('/detailPic',(req,res)=>{
    let id=req.query.id;
    let sql='select produce_name,image2,image3,image4,image5 from produce_detail where produce_id=?';
    pool.query(sql,[id],(err,a)=>{
        if(err)throw err;
        let sql='select dimage1,dimage2,dimage3,dimage4,dimage5,dimage6 from produce_pic where produce_id=?';
        pool.query(sql,[id],(err,b)=>{
            if(err)throw err;
            res.send({a:a,b:b});
        })
    })
});

router.post('/change',(req,res)=>{
    let produce_id=req.body.id;
    let image2=req.body.image2;
    let image3=req.body.image3;
    let image4=req.body.image4;
    let image5=req.body.image5;
    let dimage1=req.body.dimage1;
    let dimage2=req.body.dimage2;
    let dimage3=req.body.dimage3;
    let dimage4=req.body.dimage4;
    let dimage5=req.body.dimage5;
    let dimage6=req.body.dimage6;
    let sql='update produce_detail set image2=?,image3=?,image4=?,image5=? where produce_id=?';
    pool.query(sql,[image2,image3,image4,image5,produce_id],(err,a)=>{
        if(err)throw err;
        if(a.affectedRows>0){
        let sql='update produce_pic set dimage1=?,dimage2=?,dimage3=?,dimage4=?,dimage5=?,dimage6=? where produce_id=?';
        pool.query(sql,[dimage1,dimage2,dimage3,dimage4,dimage5,dimage6,produce_id],(err,b)=>{
            if(err)throw err;
            if(b.affectedRows>0){
            res.send('1')
            }
        })
        }
    })
});

router.get('/changeCake1',(req,res)=>{
    let id=req.query.id;
    let sql='select produce_name,produce_desc,produce_discount,produce_theme,produce_flavor,specs1,produce_price1,specs2,produce_price2,specs3,produce_price3,image1 from produce_detail where produce_id=?';
    pool.query(sql,[id],(err,a)=>{
        if(err)throw err;
        res.send(a);
    })
})

router.post('/changeCake',(req,res)=>{
    let id=req.body.produce_id;
    let name=req.body.produce_name;
    let desc=req.body.produce_desc;
    let discount=req.body.produce_discount;
    let theme=req.body.produce_theme;
    let flavor=req.body.produce_flavor;
    let specs1=req.body.specs1;
    let price1=req.body.produce_price1;
    let specs2=req.body.specs2;
    let price2=req.body.produce_price2;
    let specs3=req.body.specs3;
    let price3=req.body.produce_price3;
    let image1=req.body.image1;
    let sql='update produce_detail set produce_name=?,produce_desc=?,produce_discount=?,produce_theme=?,produce_flavor=?,specs1=?,produce_price1=?,specs2=?,produce_price2=?,specs3=?,produce_price3=?,image1=?  where produce_id=?'
    pool.query(sql,[name,desc,discount,theme,flavor,specs1,price1,specs2,price2,specs3,price3,image1,id],(err,a)=>{
        if(err)throw err;
        if(a.affectedRows>0){
            res.send('1');
        }
    })
})

router.post('/addCake',(req,res)=>{
   let obj=req.body;
   let sql='insert into produce_detail set ?';
   pool.query(sql,[obj],(err,a)=>{
       if(err)throw err;
       if(a.affectedRows>0){
           let produce_name=req.body.produce_name;
           let sql='select produce_id from produce_detail where produce_name=?'
           pool.query(sql,[produce_name],(err,b)=>{
               if(err)throw err;
               res.send({a:1,b:b});
           })
           
       }
   });
});

router.post('/add1',(req,res)=>{
    let obj=req.body;
    let sql='insert into produce_pic set ?';
    pool.query(sql,[obj],(err,a)=>{
        if(err)throw err;
        if(a.affectedRows>0){
            res.send('1');
        }
    })
});

router.get('/user',(req,res)=>{
    let count=req.query.count;
    let sum;
    count=(count-1)*5;
    let sql='select * from user';
    pool.query(sql,(err,a)=>{
        if(err)throw err;
        if(a.length>0){
            let sql=`select * from user limit ${count},5`;
            pool.query(sql,(err,b)=>{
                if(err)throw err;
                 sum=Math.ceil(a.length/5);
                 res.send({sum:sum,b:b});
            });
        }
    })
});

router.get('/lunbo',(req,res)=>{
      let sql='select picture_id,pic_img,pic_title,pic_href from lunbopic';
      pool.query(sql,(err,a)=>{
          if(err)throw err;
          if(a.length>0){
              res.send(a);
          }
      });
});

router.post('/lunbo1',(req,res)=>{
    let obj=req.body;
    let sql='insert into lunbopic set ?';
    pool.query(sql,[obj],(err,a)=>{
        if(err)throw err;
        if(a.affectedRows>0){
            res.send('1');
        }
    })
});

router.get('/lunboDelete',(req,res)=>{
    let id=req.query.id;
    let sql='delete from lunbopic where picture_id=?';
    pool.query(sql,[id],(err,a)=>{
        if(err)throw err;
        if(a.affectedRows>0){
            res.send('1');
        }
    })
});

router.post('/lunboChange',(req,res)=>{
    let id=req.body.picture_id;
    let obj=req.body;
    let sql='update lunbopic set ? where picture_id=?';
    pool.query(sql,[obj,id],(err,a)=>{
        if(err)throw err;
       if(a.affectedRows>0){
           res.send('1')
       }
    })
});

router.get('/order',(req,res)=>{
     let count=req.query.count; 
     let sum;
     count=(count-1)*4;
     let sql='select * from udetailtab';
     pool.query(sql,(err,a)=>{
         if(err)throw err;
         if(a.length>0){
             let sql=`select * from udetailtab limit ${count},4`;
             pool.query(sql,(err,b)=>{
                if(err) throw err;
                sum=Math.ceil(a.length/4);
                res.send({b:b,sum:sum});
             })
         }
     })
});

router.post('/changeState',(req,res)=>{
    let order_id=req.body.order_id;
    let order_state=req.body.order_state;
    console.log(order_id,order_state);
    let sql='update udetailtab set order_state=? where order_id=?';
    pool.query(sql,[order_state,order_id],(err,a)=>{
        if(err) throw err;
        if(a.affectedRows>0){
            res.send('1');
        }
    })
});

router.get('/getOrderState',(req,res)=>{
    let count = req.query.count;
    let order_state=req.query.order_state;
    let sum;
    let sql='select * from udetailtab where order_state=?';
    pool.query(sql,[order_state],(err,a)=>{
        if(err)throw err;
        if(a.length>0){
          sum=Math.ceil(a.length/4);
          count=(count-1)*4;
          let sql='select * from udetailtab where order_state=? limit ?,4';
          pool.query(sql,[order_state,count],(err,b)=>{
              if(err)throw err;
              res.send({sum:sum,b:b})
          })
        }else{
            res.send('0');
        }
    })
});



module.exports=router;