#设置客户端连接服务器端编码
SET NAMES UTF8;
DROP DATABASE IF EXISTS caketeam2;
#创建数据库，设置存储的编码
CREATE DATABASE caketeam2 CHARSET=UTF8;
#进入数据库
USE caketeam2;
#创建管理员表adminuser
CREATE TABLE adminuser(
  about_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '账号id',
  adminuser_account VARCHAR(30)  NOT NULL UNIQUE COMMENT '管理员账号',
  adminuser_password VARCHAR(30) NOT NULL  COMMENT '管理员密码'
);
INSERT INTO adminuser VALUES 
(NULL,'admin_jwz','888888'),
(NULL,'admin_pyx','888888'),
(NULL,'admin_xyj','888888'),
(NULL,'admin_dqd','888888'),
(NULL,'admin_wj','888888'),
(NULL,'admin_njf','888888');

#创建用户信息表user
CREATE TABLE user(
  user_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '用户id主键且自增',
  user_name VARCHAR(30)  NOT NULL UNIQUE COMMENT '账号',
  user_pwd VARCHAR(30) NOT NULL  COMMENT '密码',
  iphone VARCHAR(11) NOT NULL  COMMENT '手机号',
  email VARCHAR(50)  COMMENT '邮箱',
  nickname VARCHAR(30)  COMMENT '用户昵称',
  user_avatar LONGTEXT  COMMENT '用户头像',
  user_gender BOOL COMMENT '用户性别(0/1)',
  user_addre VARCHAR(60)  COMMENT '用户地址 下单时必填'
);
INSERT INTO user VALUES 
(NULL,'123456781','0123456781','13512341231','761@qq.com','小明','',1,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456782','0123456782','13512341232','762@qq.com','小红','',0,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456783','0123456783','13512341233','763@qq.com','小蓝','',1,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456784','0123456784','13512341234','764@qq.com','小绿','',0,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456785','0123456785','13512341235','765@qq.com','小紫','',0,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456786','0123456786','13512341236','766@qq.com','小黑','',1,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456787','0123456787','13512341237','767@qq.com','小白','',1,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456788','0123456788','13512341238','768@qq.com','小黄','',0,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456789','0123456789','13512341239','769@qq.com','小智','',1,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'123456780','0123456780','13512341230','760@qq.com','小霞','',0,'浙江杭州火炬大厦3号楼8楼1'),
(NULL,'1234567890','012345678qwe','135123412310','7671@qq.com','nickname10','',1,'浙江杭州火炬大厦3号楼8楼1');

-- 商品类
#商品信息表待补充produce_detail
CREATE TABLE produce_detail(
  produce_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '商品id主键且自增',
  produce_name VARCHAR(25)  NOT NULL UNIQUE COMMENT '商品名称',
  produce_desc VARCHAR(255) NOT NULL  COMMENT '商品描述',
  produce_discount VARCHAR(11) DEFAULT'100%'  COMMENT '商品折扣可写可不写',
  produce_theme VARCHAR(8)  NOT NULL COMMENT '商品主题',
  produce_flavor VARCHAR(8)  NOT NULL COMMENT '商品口味',
  specs1 VARCHAR(25)  NOT NULL COMMENT '商品规格尺寸',
  produce_price1 DECIMAL(7,2)  NOT NULL COMMENT '价格',
  specs2 VARCHAR(25)   COMMENT '商品规格尺寸',
  produce_price2 DECIMAL(7,2)   COMMENT '价格',
  specs3 VARCHAR(25)   COMMENT '商品规格尺寸',
  produce_price3 DECIMAL(7,2)   COMMENT '价格',
  image1 VARCHAR(128)  COMMENT '分类页面图片',
  image2 VARCHAR(128)  COMMENT '分类页面图片',
  image3 VARCHAR(128)  COMMENT '分类页面图片',
  image4 VARCHAR(128)  COMMENT '分类页面图片',
  image5 VARCHAR(128)  COMMENT '分类页面图片'
);
INSERT INTO produce_detail VALUES (null,'橘与桔','像切开一只柑橘鲜果,可以细数的，7个风味层次//每一层都包含不同柑橘元素','','下午茶','奶油,鲜果','6英寸','158.00','8英寸','218.00','10英寸','288.00','二一1-00.jpg','二一1-0.jpg','二一1-1.jpg','二一1-2.jpg','二一1-3.jpg');
INSERT INTO produce_detail VALUES (null,'蔓生','树莓奶油与浆果慕斯蛋糕,蛋糕底部，覆盆子冻干粉喷洒，恰到好处的一抹红晕','','节庆','奶油,鲜果','6英寸','198.00','8英寸','268.00','10英寸','328.00','二一2-00.jpg','二一2-0.jpg','二一2-1.jpg','二一2-2.jpg','');
INSERT INTO produce_detail VALUES (null,'豆酪','食用前，需要拿出软糖粒儿撒在蛋糕表面，与蛋糕搭配着吃','','儿童','奶油','6英寸','298.00','8英寸','398.00','','','二一3-00.jpeg','二一3-0.jpeg','二一3-1.jpeg','二一3-2.jpeg','');

INSERT INTO produce_detail VALUES (null,'深爱','奶油中调入玫瑰甘露，整体色泽加深,夹心中增加可咀嚼的玫瑰蜜饯，丰富口感','','情人节','奶油,鲜果','8英寸','338.00','10英寸','398.00','12英寸','448.00','二一4-00.jpg','二一4-0.jpg','','','');

INSERT INTO produce_detail VALUES (null,'摩卡','世上还有摩卡，就有无尽挣扎','','下午茶','咖啡,奶油','8英寸','268.00','10英寸','328.00','','','二一5-00.jpg','二一5-0.jpg','二一5-1.jpg','二一5-2.jpg','二一5-3.jpg');

INSERT INTO produce_detail VALUES (null,'布莱克','比利时黑巧克力与中国榛子，淡苦与干脆，浓香丰满','','聚餐','巧克力','10英寸','388.00','12英寸','448.00','','','二一6-00.jpg','二一6-0.jpg','二一6-1.jpg','二一6-2.jpg','二一6-3.jpg');

INSERT INTO produce_detail VALUES (null,'黑白巧克力慕斯彼尔德','彼尔德联名款--猪年限定版','','儿童','慕斯,巧克力','8英寸','198.00','12英寸','268.00','14英寸','328.00','二一7-00.jpg','二一7-0.jpg','二一7-1.jpg','二一7-2.jpg','');

INSERT INTO produce_detail VALUES (null,'松仁淡奶','奶油与坚果的和谐、轻甜','','下午茶','奶油','8英寸','198.00','10英寸','248.00','12英寸','328.00','二一8-00.jpg','二一8-0.jpg','二一8-1.jpg','二一8-2.jpg','');

INSERT INTO produce_detail VALUES (null,'黑森林','樱桃酒味从巧克力卷的缝隙飘出,向往极北的黑森林，纷飞的雪花里有精灵的歌咏','','聚餐','巧克力','10英寸','348.00','12英寸','428.00','14英寸','488.00','二一9-00.jpg','二一9-0.jpg','二一9-1.jpg','二一9-2.jpg','二一9-3.jpg');

INSERT INTO produce_detail VALUES (null,'冻慕斯与焗芝士','平衡冰与火,新鲜奶油慕斯，平滑叠加降温至4度的现焗法国软芝士，轻盐味，诱发原香，丰富甜','','节庆','芝士,慕斯','8英寸','198.00','10英寸','268.00','12英寸','328.00','二一10-00.jpg','二一10-0.jpg','二一10-1.jpg','二一10-2.jpg','');

INSERT INTO produce_detail VALUES (null,'芒果奶油蛋糕','不使用罐头水果和植混奶油,坚持自然成熟，应季鲜切芒果,新西兰纯乳脂奶油,自研芒果百香果慕斯夹心','','母亲节','鲜果,奶油','8英寸','198.00','10英寸','268.00','12英寸','348.00','二一11-00.jpg','二一11-0.jpg','二一11-1.jpg','二一11-2.jpg','');

INSERT INTO produce_detail VALUES (null,'杰瑞','谁动了我的奶酪？!','','儿童','芝士','12英寸','288.00','14英寸','368.00','16英寸','458.00','二一12-00.png','二一12-0.jpg','二一12-1.jpg','二一12-2.jpg','二一12-3.jpg');

INSERT INTO produce_detail VALUES (null,'朗姆芝士','香滑的乳酪与打开的一瓶波多黎各朗姆酒,酒香，微苦，清新的柠檬','','情人节','芝士,奶油','12英寸','388.00','14英寸','448.00','16英寸','528.00','二一13-00.jpg','二一13-0.jpg','二一13-1.jpg','二一13-2.jpg','');

INSERT INTO produce_detail VALUES (null,'黑越橘','从苏必利尔湖西端，至安大略湖东端的1400公里，是北美五大湖所经流域,这里，是黑越橘（野生蓝莓）的天堂','','儿童','鲜果,奶油','8英寸','198.00','10英寸','268.00','12英寸','348.00','二一14-00.jpg','二一14-0.jpg','二一14-1.jpg','二一14-2.jpg','');

INSERT INTO produce_detail VALUES (null,'黑白巧克力慕斯','口感冰凉细腻，白巧克力慕斯的甜，与底部黑巧克力酱的苦','','生日','巧克力','8英寸','198.00','10英寸','268.00','12英寸','348.00','二一15-00.jpg','二一15-0.jpg','二一15-1.jpg','二一15-2.jpg','');

INSERT INTO produce_detail VALUES (null,'新卡','低温乳脂奶油冷萃耶加雪菲,配马达加斯加香草戚风','','下午茶','咖啡','8英寸','268.00','10英寸','368.00','12英寸','468.00','二一16-00.jpg','二一16-0.jpg','二一16-1.jpg','二一16-2.jpg','');

INSERT INTO produce_detail VALUES (null,'心雨心愿','椰子香气，蛋糕坯的颗粒感平衡奶油的软滑，烛光','','情人节','巧克力,奶油','10英寸','298.00','12英寸','368.00','14英寸','438.00','二一17-00.jpg','二一17-0.jpg','二一17-1.jpg','二一17-2.jpg','二一17-3.jpg');

INSERT INTO produce_detail VALUES (null,'清境','当薄荷的清新，遇上青柠的淡香','','情人节','鲜果,奶油','10英寸','248.00','12英寸','328.00','14英寸','388.00','二一18-00.jpg','二一18-0.jpg','二一18-1.jpg','二一18-2.jpg','');

INSERT INTO produce_detail VALUES (null,'冰淇淋蛋糕','白兰地让人分神，有些记忆与酒有关,一边融化，香味渐浓......','','生日','冰激凌','10英寸','198.00','','','','','二一19-00.jpg','二一19-0.jpg','二一19-1.jpg','二一19-2.jpg','二一19-3.jpg');

INSERT INTO produce_detail VALUES (null,'汉砖','设计师限量款,千年以前的平行世界,巧克力，未央宫。','','聚会','巧克力','10英寸','128.00','12英寸','198.00','','','二一20-00.jpg','二一20-0.jpg','二一20-1.jpg','二一20-2.jpg','');

INSERT INTO produce_detail VALUES (null,'咖啡软芝士蛋糕','多孔蛋糕坯，深深沉浸墨西哥咖啡甘露,加杯咖啡，忘记提拉米苏','','情人节','咖啡,芝士','14英寸','390.00','','','','','二一21-00.jpg','二一21-0.jpg','二一21-1.jpg','二一21-2.jpg','');

INSERT INTO produce_detail VALUES (null,'爱尔兰咖啡','真正的爱从未中断，也不会消失，它永远在守候下一刻就要坐到对面......','','生日','咖啡','12英寸','260.00','','','','','二一22-00.jpg','二一22-0.jpg','二一22-1.jpg','','');


INSERT INTO produce_detail VALUES (NULL,'萌萌熊','可爱的小熊唤起童心，柔软的戚风和爽滑果冻布丁，伴随着抹茶风味的奶油一起融化在舌尖。','','儿童','奶油','6英寸','168.00','8英寸','228.00','','','k1-0.jpg','k1-1.jpg','k1-2.jpg','k1-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'蓝莓雪芭','伴随香甜奶香，绵软蛋糕与馥郁蓝莓果泥酱碰撞甜蜜口感，搭配爽滑布蕾布丁，点缀酸甜蓝莓，口感活泼有趣。','','儿童','鲜果','6英寸','168.00','8英寸','228.00','','','k2-0.jpg','k2-1.jpg','k2-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'花涧蜜语','松软蛋糕胚遇上入口即化的稀奶油，搭配柔滑细腻的切达乳酪味克林姆酱，惊喜不断。','','情人节','奶油','6英寸','168.00','8英寸','228.00','','','k3-0.jpg','k3-1.jpg','k3-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'威廉巧克力慕斯','慕斯中调入朗姆酒，入口清爽柔滑，戚风蛋糕胚的柔软，混合香甜的混合奶油和微苦的可可粉，苦涩带甘甜的味觉冲击，呈现经典而富有层次味道。','','下午茶','慕斯','6英寸','158.00','8英寸','218.00','','','k4-0.jpg','k4-1.jpg','k4-2.jpg','k4-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'唯爱珍言','奶香扑鼻的稀奶油，入口柔软的蛋糕胚，夹杂着甜蜜果冻。一缕奶香，一丝甜蜜，口感浓郁有回味。','','情人节','奶油','6英寸','158.00','8英寸','218.00','','','k5-0.jpg','k5-1.jpg','k5-2.jpg','k5-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'甜心美莓','爽滑的果冻布丁，清新菠萝碎，搭配着表层酸酸甜甜的树莓混合奶油，每一口皆是幸福。','','儿童','鲜果','6英寸','168.00','8英寸','228.00','','','k6-0.jpg','k6-1.jpg','k6-2.jpg','k6-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'椰香心语','诱人巧克力淋面、蛋糕融入法国利口酒的甜、西班牙椰子朗姆的醇，奇妙碰撞凝聚层层滋味。','','情人节','慕斯','8英寸','228.00','10英寸','308.00','12英寸','398.00','k7-0.jpg','k7-1.jpg','k7-2.jpg','k7-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'满溢香柠','一口绵密的抹茶奶油，回甘悠长。柠檬味乳酪馅与原味蛋糕胚融为一体，点缀着时令草莓、马卡龙、酸酸甜甜， 激活味觉。','','情人节','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298','k8-0.jpg','k8-1.jpg','k8-2.jpg','k8-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'熊古力','选取进口稀奶油、白桃口味果冻与爽滑布蕾布丁搭配出柔滑的惊喜口感，巧克力淋面的香浓诱人，让它更加萌萌惹人爱。','','儿童','巧克力','6英寸','158.00','8英寸','218.00','','','k9-0.jpg','k9-1.jpg','','','');
INSERT INTO produce_detail VALUES (NULL,'鲜果星光','草莓与蓝莓的酸甜、蛋糕胚的蓬松绵软、 搭配着果冻的香甜清爽，属于春天的味道。','','聚餐','鲜果','10英寸','228.00','12英寸','358.00','14英寸','468.00','k10-0.jpg','k10-1.jpg','k10-2.jpg','k10-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'盛果满园','缤纷水果的味觉盛宴，夹杂爽滑果冻内馅，口感清新，回味悠长。','','生日','鲜果','10英寸','288.00','12英寸','358.00','14英寸','468.00','k11-0.jpg','k11-1.jpg','k11-2.jpg','k11-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'福寿齐天','柔软的蛋糕胚，搭配着什锦水果与内层的爽滑果冻， 一颗颗寿桃，寓意着寿比南山。','','生日','奶油','12英寸','428.00','14英寸','528.00','16英寸','698.00','k12-0.jpg','k12-1.jpg','k12-2.jpg','k12-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'法香君度慕斯','芝士混合稀奶油，调入君度力娇酒， 别有一番风味。乳酪慕斯的香滑，稀奶油的入口即化， 风味与层次，远超所见。','','下午茶','慕斯','6英寸','168.00','8英寸','228.00','','','k13-0.jpg','k13-1.jpg','k13-2.jpg','k13-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'朗姆咖啡慕斯','调入白兰地提味的咖啡慕斯蛋糕， 酒香馥郁，与各种水果搭配， 醉人美味在舌尖绽放。','','下午茶','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298.00','k14-0.jpg','k14-1.jpg','k14-2.jpg','k14-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'经典提拉米苏','稀奶油的香滑、力娇酒的苦涩带甘、朗姆酒的辛烈，交织成馥郁难忘的意大利风味。','','下午茶','慕斯','6英寸','158.00','8英寸','218.00','','','k15-0.jpg','k15-1.jpg','k15-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'草莓缇娜花园','酸甜的草莓、稀奶油的绵密顺滑，君度力娇酒的苦涩带甘与细腻香草味慕斯相融合，浓郁香滑。加上满满的巴旦木，口感层次丰富。','','情人节','慕斯','6英寸','168.00','8英寸','228.00','','','k16-0.jpg','k16-1.jpg','k16-2.jpg','k16-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'甜蜜之约','香浓的巧克力味胚芽乳脂奶油，内层是柔软的蛋糕胚，配上爽滑果冻与多种水果，浓烈与清新的全新体验。','','婚礼','奶油','10英寸','288.00','12英寸','358.00','14英寸','468.00','k17-0.jpg','k17-1.jpg','k17-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'莓果精灵','绵软的蛋糕胚搭配丝滑稀奶油，清新淡雅，回味无穷。','','聚餐','奶油','6英寸','168.00','8英寸','228.00','10英寸','298.00','k18-0.jpg','k18-1.jpg','k18-2.jpg','k18-3.jpg','k18-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'仲夏夜之梦','微咸的海盐和醇厚的稀奶油形成口感上的奇妙搭配，配合缤纷水果的点缀，酸酸甜甜带来幸福。','','情人节','慕斯','6英寸','168.00','8英寸','228.00','10英寸','308.00','k19-0.jpg','k19-1.jpg','k19-2.jpg','k19-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'蓝莓香颂','醇香润滑的稀奶油，蓝莓果粒，松软绵密的可可蛋糕，层层滋味瞬间冲击味蕾。','','下午茶','奶油','8英寸','218.00','','','','','k20-0.jpg','k20-1.jpg','k20-2.jpg','k20-3.jpg','k20-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'洛林甜心','醇厚的稀奶油混合着法式海盐风味的夹心内陷，甜而不腻，丝丝入味，呼应着草莓的酸甜，层层滋味清新怡人。','','生日','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298.00','k21-0.jpg','k21-1.jpg','k21-2.jpg','k21-3.jpg','k21-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'香芒物语','绵密稀奶油搭配原味蛋糕胚，碰撞出美妙的惊喜，芒果慕斯夹心，汇合在稀奶油中，甜蜜之余夹带奶香。','','生日','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298.00','k22-0.jpg','k22-1.jpg','k22-2.jpg','k22-3.jpg','k22-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'浪漫花环','浓香柔滑的稀奶油，酸甜爽口的果肉夹心，搭配香喷喷的蛋糕胚，那是一种幸福的味道。','','情人节','奶油','6英寸','168.00','8英寸','228.00','10英寸','308.00','k23-0.jpg','k23-1.jpg','k23-2.jpg','k23-3.jpg','k23-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'红丝绒圆舞曲','热情浪漫的红丝绒蛋糕润泽绵绵，稀奶油醇香丝滑，夹杂着粒粒果肉，口感丰富回味浓郁。','','聚餐','奶油','6英寸','158.00','8英寸','218.00','10英寸','298.00','k24-0.jpg','k24-1.jpg','k24-2.jpg','k24-3.jpg','k24-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'鲜莓雪舞','浓情巧克力慕斯，覆盆子奶冻，醇香稀奶油碰撞出奇妙口感，令人怦然心动。','','情人节','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298.00','k25-0.jpg','k25-1.jpg','k25-2.jpg','k25-3.jpg','k25-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'鲜果奇缘','清新草莓邂逅可爱蓝莓，酸甜升级，撒上果仁碎粒，与柔软蛋糕交织出层叠美味。','','情人节','奶油','8英寸','218.00','','','','','k26-0.jpg','k26-1.jpg','k26-2.jpg','k26-3.jpg','k26-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'天籁之音','抹茶红豆慕斯，清新绵软的抹茶蛋糕，配以醇香的稀奶油，茶香四溢甜蜜享受在心头。','','生日','慕斯','6英寸','158.00','8英寸','218.00','10英寸','298.00','k27-0.jpg','k27-1.jpg','k27-2.jpg','k27-3.jpg','k27-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'巴伐利亚风光','甜甜的奶酪，带着清晨朝露的气息，咸咸的海盐味道，杂糅着海洋冰蓝的深邃，搭配着松脆香甜的巴旦木片，一切都是那么恰到好处。','','聚餐','慕斯','6英寸','168.00','8英寸','228.00','10英寸','308.00','k28-0.jpg','k28-1.jpg','k28-2.jpg','k28-3.jpg','k28-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'硕果满园','柔软的戚风蛋糕，搭配巧克力慕斯与覆盆子奶冻，被香酥手指饼紧紧包围，令人心动的硕果满园。','','下午茶','慕斯','8英寸','218.00','10英寸','298.00','','','k29-0.jpg','k29-1.jpg','k29-2.jpg','k29-3.jpg','k29-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'奇幻彩虹','清新的香草味慕斯，柔软的蛋糕胚与酸甜樱桃馅的绝妙组合，伴随着浓郁奶香，造就了丰富的口感层次。','','儿童','慕斯','6英寸','138.00','','','','','k30-0.jpg','k30-1.jpg','k30-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'心形提拉米苏','意大利的经典甜品，复合甜酒的醇香，乳酪和鲜奶油的柔滑，可可粉的浓郁芬芳，冲击着整个味觉。','','下午茶','巧克力','5英寸','88.00','','','','','k31-0.jpg','k31-1.jpg','k31-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'汽车总动员','柔软的蛋糕胚与奥利奥饼干，配以浓郁的植脂奶油，柔滑与香脆并重，实现你的“汽车梦”。','','儿童','奶油','6英寸','138.00','','','','','k32-0.jpg','k32-1.jpg','k32-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'恋恋芒果','甜软而明丽的芒果，带着具有识别度的香甜，和稀奶油激情碰撞出热情风味，表面满满的黄桃果肉清清爽爽，咬一口，甜蜜滋味在舌尖流淌。','','情人节','奶油','6英寸','168.00','8英寸','228.00','10英寸','308.00','k33-0.jpg','k33-1.jpg','k33-2.jpg','k33-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'公主梦','柔软戚风搭配香滑果冻与多种水果，梦幻的植脂奶油令人不禁浮想联翩，一圆你的公主梦。','','儿童','奶油','6英寸','138.00','8英寸','168.00','','','k34-0.jpg','k34-1.jpg','','','');
INSERT INTO produce_detail VALUES (NULL,'玫瑰圆舞','以各种缤纷水果为点缀，激发出香甜浓醇的口感，加上内层的爽滑果冻，共同谱写一首别出心裁的圆舞曲。','','聚餐','奶油','10英寸','288.00','12英寸','358.00','14英寸','468.00','k35-0.jpg','k35-1.jpg','k35-2.jpg','','');
INSERT INTO produce_detail VALUES (NULL,'福寿满堂','清爽果冻的邂逅，缤纷水果，香甜柔滑的口感妙不可言，是赠与长辈的诚意之礼。','','生日','奶油','10英寸','288.00','12英寸','358.00','14英寸','468.00','k36-0.jpg','k36-1.jpg','k36-2.jpg','k36-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'红粉佳人','浓郁醇厚的稀奶油，清新的草莓蛋糕，还有浪漫的粉色马卡龙陪伴，风情弥漫，甜蜜惊艳。','','情人节','奶油','6英寸','168.00','8英寸','228.00','10英寸','298.00','k37-0.jpg','k37-1.jpg','k37-2.jpg','k37-3.jpg','');

INSERT INTO produce_detail VALUES (NULL,'儿童套餐','核桃派*1+蓝莓可颂*1+阳光葡萄卷*1+果酱*1','','','','230g/一份','48.00','','','','','bread1.png','bread1-1.jpg','bread1-2.jpg','bread1-3.jpg','bread1-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'全家福套餐','北海道吐司*1+果酱*2+原味可颂*1+阳光葡萄卷*1+蓝莓可颂*1+核桃派*1+咖啡*1','','','','445g/一份','78.00','','','','','bread2.png','bread2-1.jpg','bread2-2.jpg','bread2-3.jpg','bread2-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'经典套餐','北海道吐司*1+果酱*2+原味可颂*1+阳光葡萄卷*1+咖啡*2','','','','305g/一份','58.00','','','','','bread3.jpeg','bread3-1.jpg','bread3-2.jpg','bread3-3.jpg','bread3-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'家常面包套餐','北海道吐司1份、蓝莓可颂1个、阳光葡萄卷1个','','','','265g/一份','41.40','','','','','bread4.jpg','bread4-1.jpg','bread4-2.jpg','bread4-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'红糖红枣桂圆软欧','传统红糖搭配新疆红枣，与甜润桂圆干，熟悉的食材带来甜软、踏实的口感，比中式点心营养更丰富，非常适合秋冬进补，家里吃不惯面包的老人，也可以从尝试【养】开始，养成食用面包的习惯。','','','','90g/一份','12.8','','','','','bread5.jpg','bread5-1.jpg','bread5-2.jpg','bread5-3.jpg','bread5-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'北海道吐司（4片）','不是每个人都能够享有新鲜空气，洁净的水，和有机小麦、天然乳制品制作的面包。','','','','150g/一份','13.80','','','','','bread6.jpg','bread6-1.jpg','bread6-2.jpg','bread6-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'原味可颂','一只可颂就是一个面包师傅的一天，反复折叠33次，烤制出均匀分布，蜂窝状内部气孔。有机小麦粉，零误差融入，最高食品标准黄油，与纯正瑞士鲜奶，整个过程不添加一滴水。','','','','45g/一份','12.00','','','','','bread7.jpg','bread7-1.jpg','bread7-2.jpg','bread7-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'阳光葡萄卷','为儿童设计，太阳造型，天天晴朗。','','','','70g/一份','13.80','','','','','bread8.jpg','bread8-1.jpg','bread8-2.jpg','bread8-3.jpg','');
INSERT INTO produce_detail VALUES (NULL,'蓝莓丹麦','金黄，酥脆，内部孔洞均匀舒展，咬它的口感，像踩在雪上，野生蓝莓，手工熬制酱心，抿一下，蓝莓酱融化在油脂香气中。','','','','66g/一份','13.80','','','','','bread9.jpg','bread9-1.jpg','bread9-2.jpg','bread9-3.jpg','bread9-4.jpg');
INSERT INTO produce_detail VALUES (NULL,'核桃派','焦糖核桃满嵌酥皮，酥甜，温暖，让你在这个寒冬，还想期待一场雪。','','','','80g/一份','18.80','','','','','bread10.jpg','bread10-1.jpg','bread10-2.jpg','bread10-3.jpg','');

#商品详情规格表produce_pic
CREATE TABLE produce_pic(
  picture_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '商品图片自增主键',
  produce_id INT  NOT NULL  COMMENT '外键约束' ,
  dimage1 VARCHAR(128) NOT NULL  COMMENT '详情页面1',
  dimage2 VARCHAR(128)  COMMENT '详情页面2',
  dimage3 VARCHAR(128)  COMMENT '详情页面3',
  dimage4 VARCHAR(128)  COMMENT '详情页面4',
  dimage5 VARCHAR(128)  COMMENT '详情页面5',
  dimage6 VARCHAR(128)  COMMENT '详情页面6'
);
INSERT INTO produce_pic VALUES 
(NULL,1,'二一1-4.jpg','二一1-5.jpg','二一1-6.jpg','二一1-8.jpg','二一1-9.jpg',''),
(NULL,2,'二一2-3.jpg','二一2-4.jpg','二一2-5.jpg','二一2-6.jpg','二一2-7.jpg','二一2-8.jpg'),
(NULL,3,'二一3-3.jpg','二一3-4.jpg','二一3-5.jpg','二一3-6.jpg','二一3-7.jpg',''),
(NULL,4,'二一4-2.jpg','二一4-3.jpg','二一4-4.jpg','二一4-5.jpg','二一4-6.png',''),
(NULL,5,'二一5-4.jpg','二一5-5.jpg','二一5-6.jpg','二一5-7.png','',''),
(NULL,6,'二一6-4.jpg','二一6-5.jpg','二一6-6.jpg','二一6-7.png','',''),
(NULL,7,'二一7-3.gif','二一7-4.png','','','',''),
(NULL,8,'二一8-3.jpg','二一8-4.jpg','二一8-5.png','','',''),
(NULL,9,'二一9-4.jpg','二一9-5.jpeg','二一9-6.png','','',''),
(NULL,10,'二一10-3.jpg','二一10-4.jpg','二一10-5.jpg','二一10-6.jpg','二一10-7.png',''),
(NULL,11,'二一11-3.jpg','二一11-4.jpg','二一11-5.jpg','二一11-6.png','',''),
(NULL,12,'二一12-4.jpg','二一12-5.jpg','二一12-6.jpg','二一12-7.jpg','二一12-8.png',''),
(NULL,13,'二一13-3.jpg','二一13-4.jpg','二一13-5.jpg','二一13-6.png','',''),
(NULL,14,'二一14-3.jpg','二一14-4.jpg','二一14-5.jpg','二一14-6.png','',''),
(NULL,15,'二一15-3.jpg','二一15-4.png','','','',''),
(NULL,16,'二一16-3.jpg','二一16-4.jpg','二一16-5.jpg','二一16-6.jpg','二一16-7.png',''),
(NULL,17,'二一17-4.jpg','二一17-5.jpg','二一17-6.jpg','二一17-7.png','',''),
(NULL,18,'二一18-3.jpg','二一18-4.jpg','二一18-5.jpg','二一18-6.png','',''),
(NULL,19,'二一19-4.jpg','二一19-5.jpg','二一19-6.jpg','二一19-7.png','',''),
(NULL,20,'二一20-3.jpg','二一20-4.jpg','二一20-5.jpg','二一20-6.jpg','二一20-7.jpg',''),
(NULL,21,'二一21-3.gif','二一21-4.gif','二一21-5.jpg','二一21-6.png','',''),
(NULL,22,'二一22-2.jpg','二一22-3.jpg','二一22-4.jpg','二一22-5.jpg','二一22-6.png',''),

(NULL,23,'k1-4.jpg','k1-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,24,'k2-3.jpg','k2-4.jpg','k2-5.jpg','k2-6.jpg','k1-6.jpg','k1-7.jpg'),
(NULL,25,'k3-3.jpg','k3-4.jpg','k3-5.jpg','k1-6.jpg','k1-7.jpg',''),
(NULL,26,'k4-4.jpg','k4-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,27,'k5-4.jpg','k5-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,28,'k6-4.jpg','k6-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,29,'k7-4.jpg','k7-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,30,'k8-4.jpg','k8-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,31,'k9-2.jpg','k1-6.jpg','k1-7.jpg','','',''),
(NULL,32,'k10-4.jpg','k10-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,33,'k11-4.jpg','k11-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,34,'k12-4.jpg','k12-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,35,'k13-4.jpg','k13-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,36,'k14-4.jpg','k14-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,37,'k15-3.jpg','k15-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,38,'k16-4.jpg','k16-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,39,'k17-3.jpg','k17-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,40,'k18-6.jpg','k18-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,41,'k19-4.jpg','k19-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,42,'k20-6.jpg','k20-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,43,'k21-6.jpg','k21-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,44,'k22-5.jpg','k22-6.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,45,'k23-6.jpg','k23-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,46,'k24-6.jpg','k24-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,47,'k25-6.jpg','k25-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,48,'k26-6.jpg','k26-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,49,'k27-6.jpg','k27-7.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,50,'k28-5.jpg','k28-6.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,51,'k29-4.jpg','k29-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,52,'k30-3.jpg','k30-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,53,'k31-3.jpg','k31-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,54,'k32-3.jpg','k32-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,55,'k33-4.jpg','k33-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,56,'k34-2.jpg','k34-3.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,57,'k35-3.jpg','k35-4.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,58,'k36-4.jpg','k36-5.jpg','k1-6.jpg','k1-7.jpg','',''),
(NULL,59,'k37-4.jpg','k37-5.jpg','k1-6.jpg','k1-7.jpg','',''),

(NULL,60,'bread1-5.jpg','bread1-6.jpg','bread1-7.jpg','bread1-8.jpg','bread1-9.jpg','bread1-10.jpg'),
(NULL,61,'bread2-5.jpg','bread2-6.jpg','bread2-7.jpg','bread2-8.jpg','bread2-9.jpg','bread2-10.jpg'),
(NULL,62,'bread3-5.jpg','bread3-6.jpg','bread3-7.jpg','bread3-8.jpg','bread3-9.jpg','bread3-10.jpg'),
(NULL,63,'bread4-4.jpg','bread4-6.jpg','bread4-7.jpg','','',''),
(NULL,64,'bread5-5.jpg','bread5-6.jpg','bread5-7.jpg','bread5-8.jpg','bread5-9.jpg','bread5-10.jpg'),
(NULL,65,'bread6-4.jpg','bread6-5.jpg','bread6-6.jpg','bread6-7.jpg','bread6-8.jpg','bread6-9.jpg'),
(NULL,66,'bread7-4.jpg','bread7-5.jpg','bread7-6.jpg','bread7-7.jpg','bread7-8.jpg',''),
(NULL,67,'bread8-4.jpg','bread8-5.jpg','bread8-6.jpg','bread8-7.jpg','bread8-8.jpg','bread8-9.jpg'),
(NULL,68,'bread9-5.jpg','bread9-6.jpg','bread9-7.jpg','bread9-8.jpg','bread9-9.jpg','bread9-10.jpg'),
(NULL,69,'bread10-4jpg','bread10-5.jpg','bread10-6.jpg','bread10-7.jpg','bread10-8.jpg','bread10-9.jpg');
-- 





-- 轮播类
#轮播图图片lunbopic
CREATE TABLE lunbopic(
  picture_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '轮播图id',
  pic_img VARCHAR(128)  NOT NULL COMMENT '图片路径',
  pic_title VARCHAR(64) NOT NULL  COMMENT '图片描述',
  pic_href VARCHAR(128) NOT NULL  COMMENT '点击图片后跳转的路径'
);
INSERT INTO lunbopic VALUES 
(NULL,'cake1.png','蛋糕1','/detail?produce_id=5'),
(NULL,'cake2.png','蛋糕2','/detail?produce_id=28'),
(NULL,'cake3.png','蛋糕3','/detail?produce_id=32'),
(NULL,'cake4.png','蛋糕4','/detail?produce_id=45');
--(NULL,'cake5.png','蛋糕5','/detail?id=13');

-- 用户类

#用户购物车表ucart
CREATE TABLE ucart(
  cart_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '购物车id',
  user_id INT  NOT NULL COMMENT '用户id外键',
  product_id INT NOT NULL  COMMENT '产品id外键 待补充',
  count INT NOT NULL  COMMENT '购买数量',
  specs VARCHAR(25)  NOT NULL COMMENT '商品尺寸',
  produce_name VARCHAR(25)  NOT NULL  COMMENT '商品名称',
  -- produce_card VARCHAR(25)  NOT NULL  COMMENT '生日牌',
  produce_price DECIMAL(7,2)  NOT NULL COMMENT '单价',
  -- produce_allprice DECIMAL(7,2)  NOT NULL COMMENT '总价'
  image1 VARCHAR(128)  COMMENT '分类页面图片'
);

INSERT INTO ucart VALUES (NULL,1,1,1,'6英寸','橘与桔',158.00,'二一1-00.jpg');
INSERT INTO ucart VALUES (NULL,1,1,2,'6英寸','蓝莓雪芭',168.00,'k2-0.jpg');

#订单表udetailtab
CREATE TABLE udetailtab(
  order_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '购物车id',
  user_id INT  NOT NULL COMMENT '用户id',
  product_id INT NOT NULL  COMMENT '产品id外键 待补充',
  order_state INT(1) NOT NULL  COMMENT '订单状态 0：已付款 1：已发货 2：已收货 3：已完成',
  order_price DECIMAL(7,2) NOT NULL   COMMENT '总价',
  count INT NOT NULL  COMMENT '购买数量',
  order_size varchar(8)  COMMENT '产品规格',
  order_name VARCHAR(30) NOT NULL  COMMENT '收货人姓名',
  order_add VARCHAR(60)  COMMENT '收货人用户地址',
  order_phone VARCHAR(11) NOT NULL  COMMENT '手机号',
  order_time varchar(30)  NOT NULL COMMENT '订单时间',
  produce_name VARCHAR(25)  NOT NULL  COMMENT '商品名称',
  produce_card VARCHAR(25)    COMMENT '生日牌',
  image1 VARCHAR(128)  COMMENT '分类页面图片'
);
 INSERT INTO udetailtab VALUES (NULL,1,1,0,158.00,1,'10英寸','小明','浙江杭州火炬大厦3号楼8楼',13512341234,'2020/08/16','橘与桔','生日快乐','二一1-00.jpg');
 INSERT INTO udetailtab VALUES (NULL,1,2,1,336.00,2,'10英寸','小明','浙江杭州火炬大厦3号楼8楼',13512341234,'2020/08/16','蓝莓雪芭','生日快乐','k2-0.jpg');
 INSERT INTO udetailtab VALUES (NULL,2,8,0,336.00,1,'10英寸','小红','浙江杭州火炬大厦3号楼8楼',13512341235,'2020/08/16','eeee','生日快乐','01be175d04cdc4a801205e4ba0779e.jpg');
INSERT INTO udetailtab VALUES (NULL,2,10,1,336.00,1,'10英寸','小红','浙江杭州火炬大厦3号楼8楼',13512341236,'2020/08/16','dddd','生日快乐','k9-0.jpg');
INSERT INTO udetailtab VALUES (NULL,2,21,2,336.00,1,'10英寸','小红','浙江杭州火炬大厦3号楼8楼',13512341235,'2020/08/16','cccc','生日快乐','k13-0.jpg');
INSERT INTO udetailtab VALUES (NULL,2,25,3,336.00,2,'10英寸','小红','浙江杭州火炬大厦3号楼8楼',13512341235,'2020/08/16','bbbb','生日快乐','k15-0.jpg');
INSERT INTO udetailtab VALUES (NULL,1,33,3,336.00,2,'10英寸','小明','浙江杭州火炬大厦3号楼8楼',13512341236,'2020/08/16','aaaa','生日快乐','k20-0.jpg');

#用户地址详情表
CREATE TABLE add_detailtab(
  userAdd_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '地址id',
  user_id INT  NOT NULL COMMENT '用户id',
  add_name VARCHAR(30) NOT NULL  COMMENT '收货人姓名',
  add_add1 VARCHAR(60)  COMMENT '收货人用户地址1',
  add_add2 VARCHAR(60)  COMMENT '收货人用户地址2',
  add_add3 VARCHAR(60)  COMMENT '收货人用户地址3',
  add_add4 VARCHAR(60)  COMMENT '收货人用户地址4',
  add_phone VARCHAR(11) NOT NULL  COMMENT '手机号',
  add_code VARCHAR(6) NOT NULL  COMMENT '邮编'
  -- add_default BOOL COMMENT'是否为默认地址'
);
INSERT INTO add_detailtab VALUES (NULL,1,'小明','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341231,'311200');
INSERT INTO add_detailtab VALUES (NULL,2,'小红','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341232,'311200');
INSERT INTO add_detailtab VALUES (NULL,3,'小蓝','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341233,'311200');
INSERT INTO add_detailtab VALUES (NULL,4,'小绿','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341234,'311200');
INSERT INTO add_detailtab VALUES (NULL,5,'小紫','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341235,'311200');
INSERT INTO add_detailtab VALUES (NULL,6,'小黑','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341236,'311200');
INSERT INTO add_detailtab VALUES (NULL,7,'小白','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341237,'311200');
INSERT INTO add_detailtab VALUES (NULL,8,'小黄','浙江杭州火炬大厦3号楼8楼1','浙江杭州火炬大厦3号楼8楼2','浙江杭州火炬大厦3号楼8楼3','浙江杭州火炬大厦3号楼8楼4',13512341238,'311200');

#用户以下单主页播放表
CREATE TABLE order_list(
  order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '展示用户下单表',
  order_name VARCHAR(30) NOT NULL  COMMENT '用户姓名',
  order_time VARCHAR (6) COMMENT '下单时间',
  order_phone VARCHAR(30) NOT NULL  COMMENT '手机号'
);

INSERT INTO order_list VALUES (NULL,'李建','8:50',  "13445678491");
INSERT INTO order_list VALUES (NULL,'王二蛋','9:30',"17745678441");
INSERT INTO order_list VALUES (NULL,'张全蛋','8:00',"13345678561");
INSERT INTO order_list VALUES (NULL,'鲍珠','7:54',  "17845678291");
INSERT INTO order_list VALUES (NULL,'邵咸蛋','10:00',"13375678991");
INSERT INTO order_list VALUES (NULL,'裘李克','8:11',"13645678499");
INSERT INTO order_list VALUES (NULL,'潘琪','9:00',  "15845678961");
INSERT INTO order_list VALUES (NULL,'吴二龙','9:38',"15845678771");
INSERT INTO order_list VALUES (NULL,'张铭铭','8:49',"13345678441");
INSERT INTO order_list VALUES (NULL,'倪妹','11:11' ,"13345678478");
INSERT INTO order_list VALUES (NULL,'王渝州','10:20',"13745678483");
INSERT INTO order_list VALUES (NULL,'川建国','12:00',"13567846657");
INSERT INTO order_list VALUES (NULL,'中发白','11:55',"15845678401");
INSERT INTO order_list VALUES (NULL,'缪宁宁','9:38',"17845678400");
INSERT INTO order_list VALUES (NULL,'林丹','10:05', "13356788741");

#用户收藏表ucollect
CREATE TABLE ucollect(
  collect_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '收藏表',
  user_id INT  NOT NULL COMMENT '用户id外键',
  product_id INT NOT NULL  COMMENT '产品id外键 待补充'
);
INSERT INTO ucollect VALUES 
(NULL,2,1),
(NULL,2,1);












