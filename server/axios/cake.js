const express = require('express');
const router = express.Router();
const pool = require('../pool.js');


router.get('/check', (req, res) => {
    let uname = req.query.uname;
    let sql = 'select user_id from user where user_name=?';
    pool.query(sql, [uname], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            res.send('1');
        } else {
            res.send('0');
        }
    })
});
router.post('/reg', (req, res) => {
    let obj = req.body
    let user_name = req.body.user_name;
    //  console.log(user_name)
    //以用户名为条件进行查找操作,如果用户存在,则产生合法的错误信息
    //如果用户不存在,则将用户的相关信息写入数据表 -- xzqa_author  
    let sql = 'SELECT user_id FROM user WHERE user_name=?';
    pool.query(sql, [user_name], (err, results) => {
        // console.log(results)
        if (err) throw err;
        //此时代表用户已经存在     
        if (results.length > 0) {
            res.send('-1');
        } else {

            //完成数据写入操作
            let sql = 'INSERT INTO user SET ?';
            pool.query(sql, [obj], (err, result) => {
                if (err) throw err;
                if (result.affectedRows == 1) {
                    res.send('1')
                } else {
                    res.send('0')
                }
            });
        }
    })

});
// 普通登录路由
router.get('/login1', (req, res) => {
    let uname = req.query.uname;
    let upwd = req.query.upwd;
    // console.log(uname,upwd)
    let sql = "select user_id,nickname from user where user_name=? and user_pwd=?";
    pool.query(sql, [uname, upwd], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            res.send(a);
        } else {
            res.send('0');
        }
    })
});
// 查询购物车数量路由
router.get('/count', (req, res) => {
    let user_id = req.query.user_id;
    let sql = 'select count from ucart where user_id=?';
    pool.query(sql, [user_id], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            res.send(a);
        } else {
            res.send('0');
        }
    })
});
// 电话号码登录路由
router.get('/login2', (req, res) => {
    let phone = req.query.phone;
    let sql = "select iphone,user_id,nickname from user where iphone=?";
    pool.query(sql, [phone], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            res.send(a);
        } else {
            res.send('0');
        }
    })
});

//面包页面路由
router.get('/bread', (req, res) => {
    let sql = "select produce_name,produce_price1,image1,produce_id,specs1 from produce_detail WHERE produce_flavor =''";
    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 1, results: results });
    })
});

//商品详情页路由
router.get('/detail', (req, res) => {
    //SQL查询语句
    let produce_id = req.query.produce_id;
    // console.logreq.query.produce_id)
    let sql = 'SELECT * FROM produce_detail AS a INNER JOIN  produce_pic AS b ON a.produce_id = b.produce_id WHERE a.produce_id=?'
    //执行SQL查询语句
    pool.query(sql, [produce_id], (err, results) => {
        if (err) throw err;
        // console.log(results)
        //响应到客户端的信息
        res.send({ message: '查询成功', code: 1, results: results[0] });
    });
});


//添加到购物车中
router.post('/addtocart', (req, res) => {
    let user_id = req.body.user_id
    let product_id = req.body.product_id
    let specs = req.body.specs
    let sql1 = 'select cart_id,count from ucart where user_id=? and product_id=? and specs=?'
    pool.query(sql1, [user_id, product_id, specs], (err, b) => {
        if (err) throw err
        console.log(b)
        if (b.length > 0) {
            let cart_id = b[0].cart_id
            let count = b[0].count + 1
            // console.log(count)
            let sql2 = 'UPDATE ucart SET count=? WHERE cart_id=? '
            pool.query(sql2, [count, cart_id], (err, c) => {
                if (err) throw err
                console.log(c)
            })
            res.send({ msg: '添加成功', code: 1, b: b })
        } else {
            let obj = req.body;
            let sql = "INSERT INTO ucart SET ?"
            pool.query(sql, [obj], (err, a) => {
                if (err) throw err
                console.log(a)
                if (a.affectedRows > 0) {
                    res.send({ msg: '添加成功', code: 1, a: a })
                } else {
                    res.send({ msg: '添加失败', code: 0, a: a })
                }
            })
        }
    });
});
//详情页将商品添加到订单表中
router.post('/addord', (req, res) => {
    let user_id = req.body.user_id
    let obj = req.body
    let sql1 = 'SELECT  add_name,add_add1,add_phone FROM add_detailtab WHERE user_id=?'
    pool.query(sql1, [user_id], (err, a) => {
        if (err) throw err;
        for (let key in a[0]) {
            if (key == 'add_name') { obj['order_name'] = a[0][key] }
            if (key == 'add_add1') { obj['order_add'] = a[0][key] }
            if (key == 'add_phone') { obj['order_phone'] = a[0][key] }
        }
        let sql2 = "INSERT INTO udetailtab SET ?";
        pool.query(sql2, [obj], (err, b) => {
            if (err) throw err;
            // console.log(b);
            if (b.affectedRows > 0) {
                res.send({ msg: '添加成功', code: 1, b: b });
            } else {
                res.send({ msg: '添加失败', code: 0, b: b });
            }
        })
    });
});

// njf mypage identity 个人头像+信息
router.get('/mypageid', (req, res) => {
    let id = req.query.user_id;
    // console.log(id)
    let sql = 'SELECT nickname,user_gender,email,iphone,user_avatar FROM user WHERE user_id=?'
    pool.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 1, results: results[0] });
    });
});

// njf mypage add地址查询
router.get('/add', (req, res) => {
    let id = req.query.user_id;
    // console.log(id)
    let sql = 'SELECT userAdd_id,user_id,add_name,add_add1,add_add2,add_add3,add_add4,add_phone,add_code FROM add_detailtab WHERE user_id=?;'
    pool.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 1, results: results });
    });
});
// 删除地址
router.post('/adddel', (req, res) => {
    let user_id = req.body.user_id;
    let add_add = req.body.add_add
    let sql = `UPDATE  add_detailtab  SET ${add_add}='' WHERE user_id=?;`
    pool.query(sql, [user_id], (err, results) => {
        if (err) throw err;
        // console.log(results)
        if (results.changedRows == 1) {
            res.send({ message: '删除成功', code: 1, results: results });
        } else {

            res.send({ message: '删除失败', code: 0, results: results });
        }
    })
});
// 增加地址
router.post('/addnew', (req, res) => {
    let obj = req.body
    let user_id = req.body.user_id;
    // let add_add=req.body.add_add
    // console.log(newadd)
    console.log(req.body)
    let sql1 = "SELECT user_id FROM add_detailtab WHERE user_id=?"
    pool.query(sql1, [user_id], (err, a) => {
        if (err) throw err
        if (a.length == 0) {
            let sql2 = 'INSERT INTO add_detailtab SET ?';
            pool.query(sql2, [obj], (err, b) => {
                if (err) throw err
                console.log('b', b)
                res.send('添加一条')
            })

        } else {
            let sql = `UPDATE  add_detailtab  SET ? WHERE user_id=?;`
            pool.query(sql, [obj, user_id], (err, results) => {
                if (err) throw err;
                console.log(results)
                if (results.changedRows == 1) {
                    res.send({ message: '增加成功', code: 1, results: results });
                } else {
                    res.send({ message: '增加失败', code: 0, results: results });
                }
            })
        }
    })

    // console.log(req.body)
});
// njf的保存更新个人信息
router.post('/update', (req, res) => {
    let $nickname = req.body.nickname;
    let $user_id = req.body.user_id;
    let $email = req.body.email;
    let $user_gender = req.body.user_gender;
    let sql = 'UPDATE user SET nickname=?,email=?,user_gender=?where user_id=?';
    pool.query(sql, [$nickname, $email, $user_gender, $user_id], (err, results) => {
        // console.log(req.body);
        if (err) throw err;
        // console.log(results);
        res.send({ message: '修改成功', code: 1 });
    });

});

router.post('/updateAvatar', (req, res) => {
    let user_avatar = req.body.user_avatar;
    let user_id = req.body.user_id;
    let sql = 'update user set user_avatar=? where user_id=?';
    pool.query(sql, [user_avatar, user_id], (err, a) => {
        if (err) throw err;
        if (a.affectedRows > 0) {
            res.send('1');
        }
    })
})


// njfchangecode改密码
router.post('/changecode', (req, res) => {
    let user_id = req.body.user_id;
    let newpassword = req.body.newpassword;
    // let sql='SELECT*FROM user where user_name=? and user_pwd=MD5(?)'
    let sql = 'UPDATE  user  SET user_pwd=? WHERE user_id=?;'
    pool.query(sql, [newpassword, user_id], (err, results) => {
        if (err) throw err;
        console.log(results)
        if (results.affectedRows == 0) {
            res.send({ message: '修改失败', code: 0, results: results[0] })
        } else {
            res.send({ message: '查询成功', code: 1, results: results[0] });
        }
    })
})
//订单页面分类
router.get('/mypageord', (req, res) => {
    let count = req.query.count;
    let state = req.query.state;
    let user_id = req.query.user_id;
    count = (count - 1) * 3;
    let sum;
    let sql1 = 'select product_id,order_price,count,order_size,order_name,order_add,order_phone,order_time,order_state,produce_name,produce_card,image1 from udetailtab where order_state=? and user_id=?;';
    pool.query(sql1, [state, user_id], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            let sql2 = `select product_id,order_id,order_price,count,order_size,order_name,order_add,order_phone,order_state,order_time,produce_name,produce_card,image1 from udetailtab where order_state=? and user_id=? limit ${count},3 `;
            pool.query(sql2, [state, user_id], (err, b) => {
                if (err) throw err;
                sum = Math.ceil(a.length / 3);
                res.send({ b: b, sum: sum });
            })
        }else{
            sum=0
            res.send({b:a,sum:sum})
        }
    })
});

// 确认收货
router.post('/statecer', (req, res) => {
    let order_id = req.body.order_id;
    // console.log(order_id)
    let sql = 'UPDATE  udetailtab SET order_state=2 WHERE order_id=?'
    pool.query(sql, [order_id], (err, results) => {
        if (err) throw err;
        // console.log(results)
        res.send({ message: '收货成功', code: 1, results: results[0] });
    });
});



//mypagehistory
router.get('/mypagehistory', (req, res) => {
    let count = req.query.count;
    let user_id = req.query.user_id;
    // console.log(user_id);
    let sum;
    count = (count - 1) * 3;
    let sql1 = 'select product_id,order_price,count,order_size,order_name,order_add,order_phone,order_time,produce_name,produce_card,image1 from udetailtab where user_id=? and order_state=3';
    pool.query(sql1, [user_id], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            let sql2 = `select product_id,order_price,count,order_size,order_name,order_add,order_phone,order_time,produce_name,produce_card,image1 from udetailtab where user_id=? and order_state=3 limit ${count},3`;
            pool.query(sql2, [user_id], (err, b) => {
                if (err) throw err;
                sum = Math.ceil(a.length / 3);
                res.send({ b: b, sum: sum });
            })
        }
    })
});

//添加商品到购物车路由
router.post('/addCart', (req, res) => {
    let obj = req.body;
    let user_id = req.body.user_id;
    let product_id = req.body.product_id;
    let sql = 'select product_id from ucart where product_id=? and user_id=?';
    pool.query(sql, [product_id, user_id], (err, a) => {
        if (err) throw err;
        //   console.log(a.length);
        if (a.length > 0) {
            res.send('1');
        } else {
            let sql = 'insert into ucart set ?';
            pool.query(sql, [obj], (err, b) => {
                if (err) throw err;
                if (b.affectedRows > 0) {
                    res.send('1');
                }
            });
        }
    })

});


//检查用户是否有收货地址

router.get('/selectUserAdd', (req, res) => {
    let user_id = req.query.user_id;
    let sql = 'select add_add1,add_add2 from add_detailtab where user_id=?'
    pool.query(sql, [user_id], (err, a) => {
        if (err) throw err;
        if (a.length > 0) {
            res.send('1')
        } else {
            res.send('0');
        }
    });
})



//获取购物车内容

router.get('/cart', (req, res) => {
    let user_id = req.query.user_id;
    let sql = "select cart_id,product_id,count,specs,produce_name,produce_price,image1,add_name,add_add1,add_phone from ucart join add_detailtab on ucart.user_id=add_detailtab.user_id where ucart.user_id=?";
    pool.query(sql, [user_id], (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 1, results: results });
    });
});

//修改购物车里面商品的数量
router.get('/changeCartCount', (req, res) => {
    let cart_id = req.query.cart_id;
    let count = req.query.count;
    let sql = 'update ucart set count=? where cart_id=?';
    pool.query(sql, [count, cart_id], (err, a) => {
        if (err) throw err;
        if (a.affectedRows > 0) {
            res.send('1');
        }
    })
})


//下单提交
router.post('/cart', (req, res) => {
    let obj = req.body;
    let sql = 'INSERT INTO udetailtab SET ?';
    pool.query(sql, [obj], (err, result) => {
        if (err) throw err;
        if (result.affectedRows == 1) {
            res.send('1')
        } else {
            res.send('0')
        }
    });
});
//删除单行购物车
router.get('/deleteCart', (req, res) => {
    let obj = req.query;
    let sql = "delete from ucart where cart_id=?";
    pool.query(sql, [obj.cart_id], (err, result) => {
        if (err) throw err;
        // console.log(result);
        if (result.affectedRows === 0) {
            res.send({ code: 301, msg: 'delete error' });
        } else {
            res.send({ code: 200, msg: 'delete suc' });
        }
    });
});
//清空购物车
router.get('/cart1', (req, res) => {
    let obj = req.query;
    let sql2 = "delete from ucart where user_id=?";
    pool.query(sql2, [obj.user_id], (err, result) => {
        if (err) throw err;
        // console.log(result);
        if (result.affectedRows === 0) {
            res.send({ code: 301, msg: 'delete error' });
        } else {
            res.send({ code: 200, msg: 'delete suc' });
        }
    });
});

router.get('/classify', (req, res) => {
    let count = req.query.count;
    let result = (count - 1) * 12;
    let sun;
    let sql = 'select specs1,produce_name,produce_price1,image1,produce_flavor from produce_detail';
    pool.query(sql, (err, a) => {
        if (err) throw err;
        let sql = `SELECT specs1,produce_id,produce_name,produce_price1,image1,produce_flavor FROM produce_detail  LIMIT ${result}, 12`;
        pool.query(sql, (err, b) => {
            if (err) throw err;
            sun = a.length / 12;
            sun = Math.ceil(sun);
            res.send({ b: b, sun: sun });
        })

    })
});

router.get('/classify1', (req, res) => {
    let name1 = req.query.name1;
    let name2 = req.query.name2;
    if (name1 == '不限' && name2 != '不限') {
        let sql1 = 'select specs1,produce_id,produce_name,produce_price1,image1,produce_flavor from produce_detail where produce_flavor like ?'
        pool.query(sql1, [`%${name2}%`], (err, a) => {
            if (err) throw err;
            res.send(a);
        })
    } else if (name1 != '不限' && name2 == '不限') {
        let sql1 = 'select specs1,produce_id,produce_name,produce_price1,image1,produce_flavor from produce_detail where produce_theme=?'
        pool.query(sql1, [name1], (err, a) => {
            if (err) throw err;
            res.send(a);
        })
    } else if (name1 != '不限' && name2 != '不限') {
        let sql1 = 'select specs1,produce_id,produce_name,produce_price1,image1,produce_flavor from produce_detail where produce_theme=? and produce_flavor like ?'
        pool.query(sql1, [name1, `%${name2}%`], (err, a) => {
            if (err) throw err;
            res.send(a);
        })
    }
});

//关键词搜索
router.get("/test", (req, res) => {
    let sql = 'select produce_id,produce_name from produce_detail where produce_name like ?'
    let keyword = req.query.keyword;
    pool.query(sql, [`%${keyword}%`], (err, result) => {
        if (err) throw err;
        res.send(result);
    })
})

// 用户当日下单量
router.get("/roder", (req, res) => {
    let sql = 'select order_name as name,order_time as time,order_phone as phone from order_list';
    pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send(result);
    })
});

// lunbo图片
router.get('/lunbo', (req, res) => {
    let sql = 'select pic_img,pic_href from lunbopic';
    pool.query(sql, (err, a) => {
        if (err) throw err;
        // console.log(a)
        res.send({ code: 1, a: a })
    })
});

module.exports = router;