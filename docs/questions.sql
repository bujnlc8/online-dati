/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : zaixian

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 04/02/2018 18:24:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timu` varchar(200) NOT NULL,
  `optionA` varchar(200) NOT NULL,
  `optionB` varchar(200) NOT NULL,
  `optionC` varchar(200) NOT NULL,
  `answer` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` VALUES (1, '人体细胞中含量最高的是?', '水', '蛋白质', '脂肪', 'A');
INSERT INTO `questions` VALUES (2, '4的2次方除以3的余数为？ ', '2', '1', '0', 'B');
INSERT INTO `questions` VALUES (3, '元素周期表第38位元素的元素单质在常温常压下是什么物态？ ', '气态', '液态', '固态', 'C');
INSERT INTO `questions` VALUES (4, '歌曲《你是我的眼》的作曲者？', '陈飞午', '萧煌奇', '张雨生', 'B');
INSERT INTO `questions` VALUES (5, '电影《指环王》中的指环可以让人拥有什么技能？', '隐身', '分身', '飞', 'A');
INSERT INTO `questions` VALUES (6, '“心心相印，印贼做父，父相伤害”这是在调侃东北话和哪个省的口音？', '福建', '河南', '陕西', 'A');
INSERT INTO `questions` VALUES (7, '2005年，被排出出行星范围、划为矮行星的是？', '海王星', '冥王星', '天王星', 'B');
INSERT INTO `questions` VALUES (8, '“大白汽车分期”首付10%就可开走新车，一辆10万元的新车应该首付多少？ ', '1万', '10万', '100万', 'A');
INSERT INTO `questions` VALUES (9, '元素周期表中，没有以下哪个字母？ ', 'J', 'V', 'W', 'A');
INSERT INTO `questions` VALUES (10, '某数与-25的和是18的相反数，那么这个数是？', '7', '8', '9', 'A');
INSERT INTO `questions` VALUES (11, '以下哪款酒不属于“长岛冰茶”的基酒是？', '威士忌', '伏特加', '龙舌兰', 'A');
INSERT INTO `questions` VALUES (13, '下列哪个虚拟人物的技能是“天锁斩月”？', '月光之女——露娜', '永恒之月——芈月', '死神——黑崎一护', 'C');
INSERT INTO `questions` VALUES (14, '芬兰与朝鲜间相隔国家的总面积与以下哪个面积最接近？', '冥王星', '月球', '海王星', 'A');
INSERT INTO `questions` VALUES (15, '20W、160E组成的经线圈是？ ', '南北半球的分界线', '东西半球的分界线', '李诞的发际线', 'B');
INSERT INTO `questions` VALUES (16, 'AFI百年最伟大的女演员中“奥黛丽 赫本”排名第几？', '第一', '第二', '第三', 'C');
INSERT INTO `questions` VALUES (17, '下列全部属于九叶诗派的一组诗人是？', '绿原、阿垅、王馨迪', '穆旦、郑敏、袁可嘉', '唐祈、卞之琳、鲁藜', 'B');
INSERT INTO `questions` VALUES (18, '以下哪个时期男人头上的辫子粗细能穿过铜钱？', '清朝前期', '清朝中期', '清朝晚期', 'A');
INSERT INTO `questions` VALUES (19, '在日本，若果汁饮料包装上出现一只对半切开的橙子，证明果汁含量为？', '25%', '50%', '100%', 'C');
INSERT INTO `questions` VALUES (20, '以下哪部电影不是《盗梦空间》男主角参演过的作品？', '飞行者', '海滩', '心灵捕手', 'C');
INSERT INTO `questions` VALUES (21, '下列不属于《历代神仙演义》中的72变的是？', '穿越', '吞刀', '医药', 'A');
INSERT INTO `questions` VALUES (22, '3366的三次方后，从左至右数第二个非0数字除以3的余数为？ ', '1', '2', '0', 'B');
INSERT INTO `questions` VALUES (23, '假设某人的智商为109那么他跟一般人相比可以说是？', '智力低下', '智商超群', '智力平平', 'C');
INSERT INTO `questions` VALUES (24, '周杰伦《我的地盘》中，歌词“在我地盘这”重复了几次？', '9次', '12次', '15次', 'A');
INSERT INTO `questions` VALUES (25, '与我国陆地接壤的国家当中，国土面积排行第三位的是？', '蒙古', '印度', '哈萨克斯坦', 'C');
INSERT INTO `questions` VALUES (26, '以下哪两部电影的女主角是同一个人？', '《画皮》与《画壁》', '《革命之路》与《朗读者》', '《雏菊》与《晚秋》', 'B');
INSERT INTO `questions` VALUES (27, '以下哪个建筑的设计不是出自“望京soho”的设计师之手？', '广州大剧院', '南京青奥中心', '北京中央公园广场', 'C');
INSERT INTO `questions` VALUES (28, '直角三角形中，勾股定理是指三边的关系为？', 'a²+b²=c²', 'a²-b²=c²', 'a²+b²=c²', 'A');
INSERT INTO `questions` VALUES (29, '下列哪个不是美国宝洁公司的产品？', '舒肤佳香皂', '潘婷洗发水', '纳爱斯牙膏', 'C');
INSERT INTO `questions` VALUES (30, '《海贼王》是哪位漫画师的作品？', '尾田荣一郎', '青山刚昌', '新海诚', 'A');
INSERT INTO `questions` VALUES (31, '世界智力运动会竞技项目之一五子棋最高段位为？', '九段', '十二段', '十八段', 'A');
INSERT INTO `questions` VALUES (32, '青岛海鲜很有名，下列哪组海鲜都属于软体动物？', '章鱼、蛤蜊', '鲳鱼、牡蛎', '鲍鱼、海蛇', 'A');
INSERT INTO `questions` VALUES (33, '坦克是哪个国家发明的？', '德国', '英国', '俄罗斯', 'B');
INSERT INTO `questions` VALUES (34, '用椰子和西瓜打头哪一个比较痛？', '椰子', '西瓜', '头', 'C');
INSERT INTO `questions` VALUES (35, '“有约不来过夜半，闲敲棋子落灯花”中“灯花”是？', '燃尽的灯芯', '花灯的灯烛', '灯谜', 'A');
INSERT INTO `questions` VALUES (36, '电影《投名状》改编自清末四大奇案之一，请问是哪个奇案？', '杨乃武与小白菜', '张文祥刺马案', '太原奇案', 'B');
INSERT INTO `questions` VALUES (37, '美国军用飞机编号“F”的含义是指哪类型飞机？', '反潜机', '轰炸机', '战斗机', 'C');
INSERT INTO `questions` VALUES (38, '“食、色，性也。”意思是说，贪吃、好色是人类的本性，这是谁的观点？', '孔子', '告子', '孟子', 'B');
INSERT INTO `questions` VALUES (39, '别名“洗肠草”的是哪种蔬菜？', '香菜', '韭菜', '油麦菜', 'B');
INSERT INTO `questions` VALUES (40, '《西游记》中说：“我叫你一声，你敢答应吗？”的妖精是？', '金角大王', '银角大王', '铁角大王', 'B');
INSERT INTO `questions` VALUES (41, '电影《魂断蓝桥》是以哪座城市为背景？', '西雅图', '巴黎', '伦敦', 'C');
INSERT INTO `questions` VALUES (42, '中国最早的词典叫什么？', '《尔雅》', '《新华词典》', '《有道词典》', 'A');
INSERT INTO `questions` VALUES (43, '巴西的国旗没有的颜色是？', '红色', '黄色', '蓝色', 'A');
INSERT INTO `questions` VALUES (44, '一碗100g米饭的热量是多少大卡？', '112大卡', '116大卡', '120大卡', 'B');
INSERT INTO `questions` VALUES (45, '下列哪个字有迅速的含义？', '骉', '猋', '鱻', 'B');
INSERT INTO `questions` VALUES (46, '赵又廷因为出演了哪部电视剧而得到了外号“姑父”？', '琅琊榜', '三生三世十里桃花', '白夜追凶', 'B');
INSERT INTO `questions` VALUES (47, '电视剧《情深深雨蒙蒙》中书桓当年离开依萍去的绥远，是现今的哪里？', '呼和浩特', '太原', '无锡', 'A');
INSERT INTO `questions` VALUES (48, '日常生活中经常可以依据动物的某些行为预判天气，下列对应正确的是？', '蚂蚁垒窝—晴天', '麻雀囤食—雨天', '龟背冒汗—雨天', 'C');
INSERT INTO `questions` VALUES (49, '被称为非洲平头哥，人狠话不多的是哪种动物？', '蜜獾', '猪獾', '貘', 'A');
INSERT INTO `questions` VALUES (50, '“酒”与中华文化结下了不解之缘，酒能消愁，酒能增进友谊，李白说：', '何以解忧，唯有杜康', '呼儿将出换美酒，与尔同销万古愁', '今朝有酒今朝醉，明日愁来明日愁', 'B');
INSERT INTO `questions` VALUES (51, '例行检查时发现胚胎刚具人形，请帮其判断已怀孕的大约时间是？', '8周', '16周', '24周', 'A');
INSERT INTO `questions` VALUES (52, '鱼翅是哪种动物的鳍所制成的？', '鲨鱼', '鲸鱼', '小丑鱼', 'A');
INSERT INTO `questions` VALUES (53, '“冰淇淋”最早起源于哪个国家？', '意大利', '中国', '土耳其', 'B');
INSERT INTO `questions` VALUES (54, '《西游记中》奔波儿灞与灞波儿奔中的灞波儿奔是什么鱼变成的妖精？', '黑鱼精', '鲶鱼精', '鲤鱼精', 'A');
INSERT INTO `questions` VALUES (55, '鸵鸟遇到危险时怎么办？', '跑', '把头埋进沙子', '把头低向地面', 'C');
INSERT INTO `questions` VALUES (56, '小明今年5岁，小明的妹妹今年4岁，请问5年后小明比他妹妹大几岁？', '5岁', '1岁', '6岁', 'C');
INSERT INTO `questions` VALUES (57, '完全在我国境内的8000米以上的山峰是哪一座？', '珠穆拉玛峰', '希夏邦马峰', '干城章嘉峰', 'B');
INSERT INTO `questions` VALUES (58, '大约在冬季这首歌曲原唱还唱过哪首歌曲？', '开开心心', '齐齐秦秦', '夜夜夜夜', 'C');
INSERT INTO `questions` VALUES (59, '2017年10月，美国宣布退出了联合国的哪一组织？', '教科文组织', '联合组织', '联合会组织', 'A');
INSERT INTO `questions` VALUES (60, '最早婚礼上放鞭炮是为了？', '镇妖除邪', '求子', '增添喜庆', 'A');
INSERT INTO `questions` VALUES (61, '2000年夏季奥运会是在哪个城市举办的？', '悉尼', '雅典', '米兰', 'A');
INSERT INTO `questions` VALUES (62, '《尚书》中的“尚”是什么意思？', '上古', '崇尚', '官名', 'A');
INSERT INTO `questions` VALUES (64, '在动画片《舒克贝塔历险记》中，舒克的职业是？', '飞行员', '宇航员', '列车员', 'A');
INSERT INTO `questions` VALUES (65, '以下哪个星球不属于太阳系的“八大行星”？', '水星', '海王星', '天狼星', 'C');
INSERT INTO `questions` VALUES (66, '成语“卧冰求鲤”的故事发生在我国哪个省份？', '山东', '吉林', '河北', 'A');
INSERT INTO `questions` VALUES (67, '“蜀汉三杰”指的是哪三个人？', '备、关羽、张飞', '操、刘备、孙权', '葛亮、关羽、张飞', 'C');
INSERT INTO `questions` VALUES (68, '下面的城市哪个是沿海城市？', '利物浦', '芝加哥', '布拉格', 'A');
INSERT INTO `questions` VALUES (69, '发源于我国唐古拉山的湄公河流经了几个国家？', '5个', '6个', '7个', 'B');
INSERT INTO `questions` VALUES (70, '在歌曲《火锅底料》中，gai一共提到了多少遍“老子吃火锅，你吃火锅底料”？', '5', '500', '10000', 'A');
INSERT INTO `questions` VALUES (71, '歌手林俊杰出生在哪个国家？', '中国', '新加坡', '马来西亚', 'B');
INSERT INTO `questions` VALUES (72, '以下获得过诺贝尔文学奖的作家是？', '村上春树', '加藤嘉一', '石黑一雄', 'C');
INSERT INTO `questions` VALUES (73, '小猪麦兜向往“蓝天白云，椰林树影”的地方是哪个岛？', '马尔代夫', '海南岛', '西西里岛', 'A');
INSERT INTO `questions` VALUES (74, '歌曲《光辉岁月》是beyond乐队写给谁的？', '曼德拉', '祖玛', '穆加贝', 'A');
INSERT INTO `questions` VALUES (75, '下面的球员中，被我国球迷叫做“小飞侠”的是哪位？', '麦迪', '科比', '姚明', 'B');
INSERT INTO `questions` VALUES (76, '李亚鹏王菲夫妇倡导发起的“嫣然天使基金”是专门资助哪种病的患者？', '唇腭裂', '小儿麻痹', '夜盲症', 'A');
INSERT INTO `questions` VALUES (77, '香港四大天王指的是刘德华.张学友.郭富城和谁？', '陈奕迅', '谭咏麟', '黎明', 'C');
INSERT INTO `questions` VALUES (78, '世界上被称为“教育王国”的是哪一个国家？', '中国', '以色列', '日本', 'B');
INSERT INTO `questions` VALUES (79, '霓裳羽衣是哪个朝代的戏曲？', '唐', '宋', '五代十国', 'A');
INSERT INTO `questions` VALUES (80, '网球拍+网球 一共11美元，球拍比球贵10美元，问网球多少钱？', '1美元', '5美元', '0.5美元', 'C');
INSERT INTO `questions` VALUES (81, '我国是哪个时期进入奴隶社会的？', '夏', '商', '战国', 'A');
INSERT INTO `questions` VALUES (82, '在我国习俗中，压岁钱应该放在哪里？', '别人的银行账户里', '商场的包包里', '枕头下', 'C');
INSERT INTO `questions` VALUES (83, '国际礼仪中，鸣放礼炮都是单数还是双数？', '单数', '双数', '都可以', 'A');
INSERT INTO `questions` VALUES (84, '86版西游记共有多少集？', '40集', '25集', '60集', 'B');
INSERT INTO `questions` VALUES (85, '看鱼鳞能识鱼龄，鱼鳞上的一圈是表示？', '半岁', '一岁', '两岁', 'A');
INSERT INTO `questions` VALUES (86, '“沉鱼落雁，闭月羞花”中的“落雁”形容的是古代四大美女中的哪位？', '王昭君', '西施', '貂蝉', 'A');
INSERT INTO `questions` VALUES (87, '小苏打是碳酸氢钠，那么大苏打是什么？', '硫酸钠', '硫代硫酸钠', '亚硝酸钠', 'B');
INSERT INTO `questions` VALUES (88, '现在电影院热映电影前任攻略3的投资方是？', '华谊兄弟', '光线传媒', '万达影业', 'A');
INSERT INTO `questions` VALUES (89, ' 以下哪种食物致癌物最多？', '麻辣火锅', '炸鸡', '烤羊肉串', 'C');
INSERT INTO `questions` VALUES (90, '螺蛳粉起源于哪个城市的小吃？', '柳州市', '桂林市', '泉州市', 'A');
INSERT INTO `questions` VALUES (91, '中国历史上第一个统一的，中央集权的封建王朝是什么？', '秦朝', '唐朝', '宋朝', 'A');
INSERT INTO `questions` VALUES (92, '科学研究表明，室外健身最佳的时间是？', '下午或傍晚', '早晨和下午', '早晨和晚上', 'A');
INSERT INTO `questions` VALUES (93, '下面哪个银行不是中国五大银行？', '交通银行', '中国农业银行', '中国人民银行', 'C');
INSERT INTO `questions` VALUES (94, '《东北人都是活雷锋》最后一句台词是？', '翠花，上咸菜', '翠花，上酸菜', '翠花，上榨菜', 'B');
INSERT INTO `questions` VALUES (95, '石头城遗址是下列哪个城市的？', '石家庄', '南京', '唐山', 'B');
INSERT INTO `questions` VALUES (96, '塑料在自然界可停留多少年？', '10-20年', '50-100年', '100-200年', 'C');
INSERT INTO `questions` VALUES (97, '武侠小说中的武器“玄铁重剑”中，“玄”表示哪种颜色？', '白色', '黑色', '蓝色', 'B');
INSERT INTO `questions` VALUES (98, '孙中山的籍贯是？', '中山', '南京', '长沙', 'A');
INSERT INTO `questions` VALUES (99, '中国最早的消防队出现在哪个朝代？', '清代', '新中国成立后', '民国', 'A');
INSERT INTO `questions` VALUES (100, '阐述了“宇宙起源”的《时间简史》的作者是？', '霍金', '爱因斯坦', '特斯拉', 'A');
INSERT INTO `questions` VALUES (101, '以下哪种植物的果实可以做成肥皂？', '香樟', '香椿', '皂荚', 'C');
INSERT INTO `questions` VALUES (102, '俗语“铁公鸡”是形容一个人？', '嘴硬', '固执', '抠门', 'C');
INSERT INTO `questions` VALUES (104, '国际象棋共有多少颗棋子？', '30颗', '32颗', '34颗', 'B');
INSERT INTO `questions` VALUES (105, '有才出题官汪涵在2015年《我是歌手》上为谁救场而成为经典？', '韩红', '古巨基', '孙楠', 'C');
INSERT INTO `questions` VALUES (106, '诗句“两情若是久长时，又岂在朝朝暮暮”是歌颂哪两个人的爱情故事？', '牛郎织女', '梁山伯与祝英台', '许仙和白娘子', 'A');
INSERT INTO `questions` VALUES (107, '一个正方形的周长是200厘米，那边长是多少分米？', '4', '5', '50', 'B');
INSERT INTO `questions` VALUES (108, '食品芝士的主要原料是什么？', '牛奶', '大豆', '芝麻', 'A');
INSERT INTO `questions` VALUES (109, '以下哪首歌曲不是我们有颜出题官谢娜演唱的音乐作品？', '菠萝菠萝蜜', '给不了的幸福', '九妹', 'C');
INSERT INTO `questions` VALUES (110, '可乐的最初用途是什么？', '治病', '解渴', '调味', 'A');
INSERT INTO `questions` VALUES (111, '英语中“Love me,love my（）”对应的汉语中“爱屋及乌”？', 'dog', 'cat', 'mom', 'A');
INSERT INTO `questions` VALUES (112, '以下哪个法语单词不是“你好”的意思？', 'bongjour', 'merci', 'salut', 'B');
INSERT INTO `questions` VALUES (113, '下列哪个人不是“神盾局”的前身——“战略科学军团”的成员？', '佩吉.卡特', '尼克.福瑞', '霍华德斯塔克', 'B');
INSERT INTO `questions` VALUES (114, '成语“韦编三绝”中“韦”字是指什么？', '牛皮', '苇草', '竹简', 'A');
INSERT INTO `questions` VALUES (115, '以下哪个国家的国徽包含了椰枣树的元素？', '卡塔尔', '阿拉伯联合酋长国', '沙特阿拉伯', 'C');
INSERT INTO `questions` VALUES (116, '香奈儿五号香水的中调是什么？', '玫瑰，香草，麝香', '玫瑰，依兰，鸢尾', '玫瑰，迷迭香，薰衣草', 'B');
INSERT INTO `questions` VALUES (117, '数字2与3的最小公倍数用二进制怎么表示？', '110', '111', '110110', 'A');
INSERT INTO `questions` VALUES (118, '王力宏演唱《十二生肖》的春晚是什么生肖年的春晚？', '龙', '蛇', '马', 'B');
INSERT INTO `questions` VALUES (119, '《贫民窟的百万富翁》是哪个国家的电影？', '印度', '英国', '美国', 'B');
INSERT INTO `questions` VALUES (120, '外号TMAC的NBA球星没有效力过下面哪支球队？', '克利夫兰骑士', '多伦多猛龙', '青岛雄鹰', 'A');
INSERT INTO `questions` VALUES (121, '从三双不同袜子中任意取出两只，恰好是同一双的概率是？', '1/3', '1/5', '1/6', 'B');
INSERT INTO `questions` VALUES (122, '《哈利.波特》系列小说的倒数第三集叫什么名字？', '《哈利.波特与混血王子》', '《哈利.波特与火焰杯》', '《哈利.波特与凤凰社》', 'C');
INSERT INTO `questions` VALUES (123, '达.芬奇名画《最后的晚餐》中从左数第11个人是谁？', '犹大', '耶稣', '马太', 'C');
INSERT INTO `questions` VALUES (124, '电影《功夫》中周星驰饰演的“星仔”立志要加入哪个帮派？', '剪刀帮', '斧头帮', '石头帮', 'B');
INSERT INTO `questions` VALUES (125, '我国体检通用的“新国际视力表”上使用的是那个字母？', 'D', 'E', 'F', 'B');
INSERT INTO `questions` VALUES (126, '散文篇《假如给我三天光明》是美国哪位盲人女作家的作品？', '海伦·凯勒', '玛格丽特·米切尔', '欧·亨利', 'A');
INSERT INTO `questions` VALUES (127, '我国的椰子大部分产自哪个省？', '海南', '福建', '广东', 'A');
INSERT INTO `questions` VALUES (128, '美国的“超级碗”是什么体育项目联赛的年度冠军赛？', '篮球', '棒球', '美式足球', 'C');
INSERT INTO `questions` VALUES (129, '“人生就像巧克力，没人知道下一块是什么味道”这句台词出于哪一部美国电影？', '阿甘正传', '肖生克的救赎', '当幸福来敲门', 'A');
INSERT INTO `questions` VALUES (130, '通常家用电器上，“off”表示的是什么意思？', '开', '关', '掉线', 'B');
INSERT INTO `questions` VALUES (131, '冬天玻璃上容易结冰花，那么冰花是结在玻璃的哪里？', '室内侧', '室外侧', '玻璃里面', 'A');
INSERT INTO `questions` VALUES (132, '源于基督教教义的千福年又名千禧年，下面哪位明星出生于千禧年？', '关晓彤', '易烊千玺', '吴磊', 'B');
INSERT INTO `questions` VALUES (133, '以下身体结构不是主要由蛋白质组成的是？', '头发', '牙齿', '指甲', 'B');
INSERT INTO `questions` VALUES (134, '被称为“大可汗”的是唐朝哪位皇帝？', '唐高祖', '唐玄宗', '唐太宗', 'C');
INSERT INTO `questions` VALUES (135, '贝多芬的《田园交响曲》又名“F大调第几交响曲”？', '五', '六', '九', 'B');
INSERT INTO `questions` VALUES (136, '歌曲《浮夸》《圣诞结》是哪位香港男歌手的代表作?', '张学友', '陈奕迅', '刘德华', 'B');
INSERT INTO `questions` VALUES (137, '俗语“四两拨千斤”中，体现了哪种物理原理？', '阿基米德原理', '杠杆原理', '相对论', 'B');
INSERT INTO `questions` VALUES (138, '陈凯歌导演的《无极》被网友戏称为一个什么引发的血案？', '馒头', '面包', '萝卜', 'A');
INSERT INTO `questions` VALUES (139, '化妆品中的BB霜是干什么用的？', '遮瑕', '卸妆', '擦屁股', 'A');
INSERT INTO `questions` VALUES (140, '“单独”的“单”作为姓氏时应该读成什么？', 'dān', 'chán', 'shàn', 'C');
INSERT INTO `questions` VALUES (141, '二战诺曼底登陆是指同盟国士兵渡过哪一个海峡前往法国？', '英吉利海峡', '直布罗陀海峡', '马六甲海峡', 'A');
INSERT INTO `questions` VALUES (142, '新海诚动漫《你的名字》中的女主角叫什么？', '泷泽萝拉', '宫水三叶', '滨崎步', 'B');
INSERT INTO `questions` VALUES (143, '“情人节”起源于？', '意大利', '法国', '美国', 'A');
INSERT INTO `questions` VALUES (144, '金球奖，金靴奖是体育界什么项目的奖项？', '乒乓球', '足球', '冰球', 'B');
INSERT INTO `questions` VALUES (145, '“仲夏”通常被我们用来形容农历几月份？', '四月', '五月', '六月', 'B');
INSERT INTO `questions` VALUES (146, '图像处理与修改软件photoshop是哪个公司的产品？', 'apple', 'arcSoft', 'adobe', 'C');
INSERT INTO `questions` VALUES (147, '香烟中的有害物质，尼古丁的名字最早来源于？', '地名', '人名', '植物名', 'B');
INSERT INTO `questions` VALUES (148, '我国《民法通则》规定，多少周岁以上的公民是成年人？', '16', '18', '20', 'B');
INSERT INTO `questions` VALUES (149, '火药是哪个国家发明的？', '中国', '日本', '美国', 'A');
INSERT INTO `questions` VALUES (150, '“一打”是指多少个？', '10', '11', '12', 'C');
INSERT INTO `questions` VALUES (151, '下列人物不是出自鲁迅文学作品的？', '鸣凤', '祥林嫂', '涓生', 'A');
INSERT INTO `questions` VALUES (152, '标志着新中国成立的历史事件？', '开国大典', '土地改革的完成', '第一届党代会的召开', 'A');
INSERT INTO `questions` VALUES (153, '酒精是哪种化学物质的俗称？', '甲醇', '乙醇', '甲醛', 'B');
INSERT INTO `questions` VALUES (154, '“红豆生南国”这句话来源于哪首诗？', '《红豆》', '《相思》', '《赠别》', 'B');
INSERT INTO `questions` VALUES (155, '下列哪种物质能提升皮肤胶原蛋白及弹力素蛋白的合成能力？', '葡聚糖', '灵芝三萜', '有机锗', 'A');
INSERT INTO `questions` VALUES (156, '中国民间传说“八仙过海”中唯一一位女性是谁？', '李夫人', '蓝采和', '何仙姑', 'C');
INSERT INTO `questions` VALUES (157, '“戛纳国际电影节”在哪一个国家举办的？', '法国', '美国', '英国', 'A');
INSERT INTO `questions` VALUES (158, '“有缘千里来相会，无缘对面手难牵”是哪首歌的歌词？', '《千年等一回》', '《新白娘子传奇》', '《渡情》', 'C');
INSERT INTO `questions` VALUES (159, '鹿角灵芝的苦味来自那种物质？', '灵芝多糖', '灵芝三萜', '灵芝腺苷', 'B');
INSERT INTO `questions` VALUES (160, '韩国的首都是？', '釜山   ', '仁川   ', '首尔', 'C');
INSERT INTO `questions` VALUES (161, '正月十五是中国哪个传统节日？', '元宵节   ', '中秋节    ', '端午节', 'A');
INSERT INTO `questions` VALUES (162, '黄果树瀑布位于哪个省？', '贵州省  ', '四川省     ', '广西省', 'A');
INSERT INTO `questions` VALUES (163, '河北省现在的省会是？', '石家庄     ', '保定      ', '承德', 'A');
INSERT INTO `questions` VALUES (164, '“鸡蛋仔”是哪个地区的传统街头小吃？', '广东      ', '台湾       ', '香港', 'C');
INSERT INTO `questions` VALUES (165, '市面上售卖的能有效提升免疫力的产品？', '红牛', '鹿角灵芝胶囊', '脑白金', 'B');
INSERT INTO `questions` VALUES (166, '足球比赛里的“帽子戏法”是什么意思？', '一名球员单场进三球     ', '球员带着帽子比赛    ', '换了三名替补', 'A');
INSERT INTO `questions` VALUES (167, '以下真菌中，哪种葡聚糖含量最高？', '野生灵芝', '猪苓', '鹿角灵芝', 'C');
INSERT INTO `questions` VALUES (168, '加拿大的首都是？', '渥太华        ', '温哥华     ', '多伦多', 'A');
INSERT INTO `questions` VALUES (169, '在 2017 年金马奖颁奖礼上，哪位演员获得了最佳女配角奖？', '惠英红       ', '文淇     ', '许玮甯', 'B');
INSERT INTO `questions` VALUES (170, '“七里香”在台湾是指哪种小吃？', '甜不辣      ', '臭豆腐      ', '鸡屁股', 'C');
INSERT INTO `questions` VALUES (171, '第一位两次在不同领域获得诺贝尔讲的人是？', '杨振宁       ', '田中耕一    ', '玛丽·居里', 'C');
INSERT INTO `questions` VALUES (172, '美国国旗上的小星星代表什么？', '州', '民族', '殖民地', 'A');
INSERT INTO `questions` VALUES (173, '土耳其的通用语言是？', '．土耳其语', '英语', '阿拉伯语', 'A');
INSERT INTO `questions` VALUES (174, '以下哪一位不是通过选秀节目成为歌手的 ?', '徐佳莹     ', '谭维维    ', '. 梁静茹', 'C');
INSERT INTO `questions` VALUES (175, '骆驼的驼峰是储存什么的？', '水', '脂肪', '食物', 'B');
INSERT INTO `questions` VALUES (176, '官方曾给米其林轮胎人「添加」了哪个家庭成员？', '妻子', '妈妈', '哥哥', 'A');
INSERT INTO `questions` VALUES (177, '扑克牌中黑桃Q的人物原型是谁？', '雅典娜', '圣女贞德', '玛利亚', 'A');
INSERT INTO `questions` VALUES (178, '螃蟹有几条腿？', '八条', '十条', '六条', 'B');
INSERT INTO `questions` VALUES (179, '“八小时工作制度”最早是在哪个国家出现的?', '英国', '美国', '意大利', 'A');
INSERT INTO `questions` VALUES (180, '兔子和乌龟比什么绝对不会输？', '跳远', '赛跑', '仰卧起坐', 'C');
INSERT INTO `questions` VALUES (181, '维纳斯是希腊神话中的？', '智慧女神', '爱神和美神', '自由女神', 'B');
INSERT INTO `questions` VALUES (182, '西游记》中的火焰山位于？', '甘肃', '新疆', '青海', 'B');
INSERT INTO `questions` VALUES (183, '李白笔下的“飞流直下三千尺，疑是银河落九天”指的是哪个风景区？', '华山', '庐山', '天姥山', 'B');
INSERT INTO `questions` VALUES (184, '唐代人可以称“父亲”为？', '伯伯', '哥哥', '大爷', 'B');
INSERT INTO `questions` VALUES (185, '\"红娘\"由来是出自下列哪部古典名剧？', '《琵琶记》', '《西厢记》', '《长生殿》', 'B');
INSERT INTO `questions` VALUES (186, '我国第一部有声影片是？', '《歌女红牡丹》', '《定军山》', '《玉人何处》', 'A');
INSERT INTO `questions` VALUES (187, '下列哪座山不属于我国四大佛山之一？', '雁荡山', '五台山', '九华山', 'A');
INSERT INTO `questions` VALUES (188, '奔驰汽车原产于哪一个国家?', '美国', '日本', '德国', 'C');
INSERT INTO `questions` VALUES (189, '北京大学的第一位校长是？', '严复', '蔡元培', '胡适', 'A');
INSERT INTO `questions` VALUES (190, '大汶口文化遗址在我国的什么地方？', '湖南', '山东', '甘肃', 'B');
INSERT INTO `questions` VALUES (191, '某消费者以180元的价格购买了一双皮鞋，进检验这双鞋是假冒产品，按 照《消费者权益保护法》的规定，经营者应当赔赏给消费者多少钱？', '360', '180', '3600', 'A');
INSERT INTO `questions` VALUES (192, '世界第一大教堂？', '圣彼得大教堂', '圣玛利亚教堂', '米兰大教堂', 'A');
INSERT INTO `questions` VALUES (193, '洲际导弹一般射程在多少公里以上?', '一千', '一万', '一百', 'B');
INSERT INTO `questions` VALUES (194, '“民为贵,社稷次之,君为轻”这句话出自', '《孟子》', '《孔子》', '《孙子》', 'A');
INSERT INTO `questions` VALUES (195, '不论是儿童、成年或老年缺钙都会影响健康，患各种疾病，钙的吸收与下面哪种维生素有关系？', '维生素B', '维生素C', '维生素D', 'C');
INSERT INTO `questions` VALUES (196, '奥运会旗是:\"五色环\"旗,其中黄色环代表？', '亚洲', '非洲', '美洲', 'A');
INSERT INTO `questions` VALUES (197, '味精的主要成分是?', '氯化钠', '谷氨酸钠', '醋酸', 'B');
INSERT INTO `questions` VALUES (198, '\"破釜沉舟\"这个成语出于哪次战争?', '赤壁之战', '长平之战', '巨鹿之战', 'C');
INSERT INTO `questions` VALUES (199, '世界上最大的宫殿是？', '故宫', '爱丽舍宫', '克里姆林宫', 'A');
INSERT INTO `questions` VALUES (200, '一般而言，肥胖是指超过理想体重的百分之多少?', '10%', '20%', '30%', 'B');
INSERT INTO `questions` VALUES (201, '平素体弱又不经常锻炼身体的人，当她（他）们从蹲位突然站起时，往往 出现头晕、眼前发黑是因为？', '贫血', '饥饿', '直立性高血压', 'C');
INSERT INTO `questions` VALUES (202, '《献血法》规定，献血者两次献血间隔时间不得少于?', '三个月', '六个月', '一年', 'B');
INSERT INTO `questions` VALUES (203, '具有止血功能的维生素是?', '维生素A ', '维生素E', '维生素K', 'C');
INSERT INTO `questions` VALUES (204, '世界上有很多种语言，大约有多少种？', '近2000种', '近3000种', '近4000种', 'B');
INSERT INTO `questions` VALUES (205, '世界哪一个国家的茶叶产量最多？', '中国', '日本', '印度', 'C');
INSERT INTO `questions` VALUES (206, '发烧时不宜喝什么饮料？', '果汁', '白开水', '浓茶', 'C');
INSERT INTO `questions` VALUES (207, '世界读书日是什么时候？', '2.13', '4.23', '6.21', 'B');
INSERT INTO `questions` VALUES (208, '“WHO”代表什么世界组织？', '世界绿色和平组织', '世界卫生组织', '世界贸易组织', 'B');
INSERT INTO `questions` VALUES (209, '以下历史事件中，与关羽无关的是?', '单刀赴会', '水淹七军', '七擒七纵', 'C');
INSERT INTO `questions` VALUES (210, '巴黎凯旋门是为纪念谁而建？', '丘吉尔', '拿破仑', '戴高乐', 'B');
INSERT INTO `questions` VALUES (211, '足球共有多少块补丁组成？', '32', '42', '52', 'A');
INSERT INTO `questions` VALUES (212, '弱冠指的是多少岁？', '二十', '十八', '十六', 'A');
INSERT INTO `questions` VALUES (213, '根据有关规定，职工的试用期最长不得超过', '三个月', '六个月', '一年', 'B');
INSERT INTO `questions` VALUES (214, '打蛇打七寸\"的七寸是指？', '咽喉', '心脏', '尾巴', 'B');
INSERT INTO `questions` VALUES (215, '我国古代称为“启明星”的是太阳系八大行星中的哪个？', '金星', '木星', '土星', 'A');
INSERT INTO `questions` VALUES (216, '我国第五套人民币上印着除了壮文，蒙古文，藏文，还有哪一种少数民族文字？', '哈萨克文', '维吾尔文', '满文', 'B');
INSERT INTO `questions` VALUES (217, '防毒面具是根据什么动物的脸部研制的？', '浪', '苍蝇', '猪', 'C');
INSERT INTO `questions` VALUES (218, '日常使用的电池上标有“AA”的是几号电池？', '5', '7', '1', 'A');
INSERT INTO `questions` VALUES (219, '天气预报：“今天阴有小雨。”你可知道小雨的降雨量为多少？', '10毫米以下', '10-20毫米', '20-50毫米', 'A');
INSERT INTO `questions` VALUES (220, '英超的全称是？', '英格兰足球超级联赛', '英国足球超级联赛', '英德足球超级联赛', 'A');
INSERT INTO `questions` VALUES (221, '我国第一个接到奥运会邀请书的人是？', '光绪', '李鸿章', '慈禧', 'A');
INSERT INTO `questions` VALUES (222, '五禽戏的发明者是?', '扁鹊', '喜来乐', '华佗', 'C');
INSERT INTO `questions` VALUES (223, '钓鱼岛从何时开始就明确为我国的领土？', '明朝', '唐朝', '宋朝', 'A');
INSERT INTO `questions` VALUES (224, '世界上最长的海峡是?', '莫桑比克海峡', '马六甲海峡', '土耳其海峡', 'A');
INSERT INTO `questions` VALUES (225, '双十二事变又称为？', '皖南事变', '卢沟桥事变', '西安事变', 'C');
INSERT INTO `questions` VALUES (226, '“一问三不知”出自《左传》，说的是哪三不知呢？', '起因，经过，结果', '天文，地理，文学', '孔子，孟子，老子', 'A');
INSERT INTO `questions` VALUES (227, '“月上柳梢头，人约黄昏后”描写的是我国哪一经典传统节日呢？', '元宵节', '端午节', '七夕节', 'A');
INSERT INTO `questions` VALUES (228, '义勇军进行曲作者？', '聂耳', '冼星海', '田汉', 'A');
INSERT INTO `questions` VALUES (229, 'java之父是?', '詹姆斯·高斯林', '约翰·罗梅洛', '比尔·盖茨', 'A');
INSERT INTO `questions` VALUES (230, '下列海洋中哪一个是我国最大的海?', '南海', '东海', '黄海', 'A');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
