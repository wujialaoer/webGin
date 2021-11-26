/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 127.0.0.1:3306
 Source Schema         : kbs

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 16/11/2021 11:01:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alias
-- ----------------------------
DROP TABLE IF EXISTS `alias`;
CREATE TABLE `alias`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `standard_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `alias_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alias
-- ----------------------------
INSERT INTO `alias` VALUES ('09b78eb04a924779ad0cbc341c8b3972', '社保公积金', '[{\'aliasName\': \'五险一金\'}]');
INSERT INTO `alias` VALUES ('0d25355ad31a41a1980ea88c12333628', '名片', '[{\'aliasName\': \'namecard\'}]');
INSERT INTO `alias` VALUES ('0f348123439b4d96afbd9a1d4194bc15', '邮箱', '[{\'aliasName\': \'mailbox\'}, {\'aliasName\': \'邮件\'}]');
INSERT INTO `alias` VALUES ('0f7e0596579c4570bd5aeaace7c5ed85', '婚假', '[{\'aliasName\': \'婚嫁\'}, {\'aliasName\': \'结婚休假\'}, {\'aliasName\': \'结婚请假\'}]');
INSERT INTO `alias` VALUES ('151ab13070f5494badb6e9ceaef63b6d', '借款', '[{\'aliasName\': \'借钱\'}]');
INSERT INTO `alias` VALUES ('1aea67942d324174abbbc7c72a5f61dc', '公寓', '[{\'aliasName\': \'apt\'}, {\'aliasName\': \'apartment\'}]');
INSERT INTO `alias` VALUES ('2bc1e98a62594bb58218a43be7794048', '主播', '[{\'aliasName\': \'小姐姐\'}, {\'aliasName\': \'博主\'}]');
INSERT INTO `alias` VALUES ('3793493a289d4cd7a702aad6f63ae93e', '博彦', '[{\'aliasName\': \'bys\'}]');
INSERT INTO `alias` VALUES ('4e1fcf7376c2453ba1f1fe76df89881b', '微软项目组安全办公室', '[{\'aliasName\': \'of\'}]');
INSERT INTO `alias` VALUES ('566909ecf4cd483ab053d106f28ef26d', '年假', '[{\'aliasName\': \'公休\'}, {\'aliasName\': \'公假\'}]');
INSERT INTO `alias` VALUES ('5f4c230aa78c475a9b3142d7fb26ef4c', '安全培训', '[{\'aliasName\': \'bysdn\'}]');
INSERT INTO `alias` VALUES ('74414ed068034927884e3762f9dc98f8', '团建', '[{\'aliasName\': \'拓展\'}, {\'aliasName\': \'tb\'}, {\'aliasName\': \'teambuilding\'}]');
INSERT INTO `alias` VALUES ('77213e398f8f4d7aad2126d26f55e4e3', '通讯费', '[{\'aliasName\': \'电话费\'}, {\'aliasName\': \'话费\'}, {\'aliasName\': \'手机费\'}]');
INSERT INTO `alias` VALUES ('bbad7298dcb84120a399ff751a7b2e6a', '病假', '[{\'aliasName\': \'sl\'}, {\'aliasName\': \'医疗期\'}]');
INSERT INTO `alias` VALUES ('ccdd14ccf3ff41dba3e032721b02354b', '办公系统', '[{\'aliasName\': \'oa系统\'}, {\'aliasName\': \'ecology\'}, {\'aliasName\': \'oa\'}, {\'aliasName\': \'e-cology\'}]');
INSERT INTO `alias` VALUES ('d1307b75006b418ab6edbcc0decd0f80', '服务公寓', '[{\'aliasName\': \'service\'}]');
INSERT INTO `alias` VALUES ('d13e72016b224655a4793cbfa5886459', '工作分解结构', '[{\'aliasName\': \'wbs\'}]');
INSERT INTO `alias` VALUES ('e129e08990b34a308ddbcab38723496e', '人才公寓', '[{\'aliasName\': \'talents\'}, {\'aliasName\': \'talent\'}]');
INSERT INTO `alias` VALUES ('e3164a4092e5494facae1340971e329b', '车补', '[{\'aliasName\': \'打车费\'}, {\'aliasName\': \'交通费\'}, {\'aliasName\': \'用车费\'}, {\'aliasName\': \'车费\'}]');
INSERT INTO `alias` VALUES ('e62c1e5f36d44a66b097fccd8e9802fa', '腾讯软件', '[{\'aliasName\': \'qq\'}]');
INSERT INTO `alias` VALUES ('efc03fd800404c26b7ac30d62388284f', '薪资', '[{\'aliasName\': \'工资\'}, {\'aliasName\': \'薪酬\'}, {\'aliasName\': \'月薪\'}, {\'aliasName\': \'收入\'}, {\'aliasName\': \'报酬\'}]');
INSERT INTO `alias` VALUES ('f639d4ca64a6436ab4f499e28fa0e04e', '餐补', '[{\'aliasName\': \'餐费补助\'}, {\'aliasName\': \'补助\'}]');

-- ----------------------------
-- Table structure for business_unit
-- ----------------------------
DROP TABLE IF EXISTS `business_unit`;
CREATE TABLE `business_unit`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_unit
-- ----------------------------
INSERT INTO `business_unit` VALUES ('4e57febd97ee483f9f3442b363a7d4b4', '直播平台-演示');
INSERT INTO `business_unit` VALUES ('99742c85728c4625ad0e6bbdce5ce460', '人力资源');
INSERT INTO `business_unit` VALUES ('ef4b22082c3f4e44b447e00225a7e44d', '碧云社区');
INSERT INTO `business_unit` VALUES ('ef816449fdeb4f8599c868b340fb1a36', '广州总部经济协会');

-- ----------------------------
-- Table structure for faq
-- ----------------------------
DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `faq_package_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `problem` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `faq_type` bigint NULL DEFAULT NULL,
  `last_modifier_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `last_modification_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faq
-- ----------------------------
INSERT INTO `faq` VALUES ('019d2385add24c8bad5e8026ad72e5c3', 'a8df77a68c5742449ec2eabf606d96e2', '食：是否做饭？', '<p>虽然自己碗里有，可我也想吃主播碗里的</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 15:15:46.567');
INSERT INTO `faq` VALUES ('02ff5e4b63114b2994dad4346295b5fa', '913c316105bc4fa081a57f9e25068897', 'House', 'Do you want to inquire about housing resources? You may directly reply to the number questions?&nbsp;<br>1. Villa&nbsp;<br>2. Apartment&nbsp;<br>3. Service Apt.&nbsp;<br>4. Talents Apt.&nbsp;', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-30 16:17:34.247');
INSERT INTO `faq` VALUES ('157db2cbbd7b43478d3a149c0659efb6', '5bc9d57808e544c8aa74f852d4ea2fb8', '黄氏响声丸', '<strong>黄氏响声丸，中医方剂名</strong>。出自《中国药典》2005版。具有疏风清热，化痰散结，利咽开音之功效。主治风热外束、痰热内盛所致的急、慢性喉瘠，症见声音嘶哑、咽喉肿痛、咽干灼热、咽中有痰，或寒热头痛，或便秘尿赤;急、慢性喉类及声带小结、声带息肉初起见上述证候者。临床常用于(1)风热上受、痰热内盛证,临床应用以声音嘶哑、咽喉肿痛、咽千灼热有痰为辨证要点。(2)用于急性、慢性喉炎及声带小结,声带息肉初起见上述证候者。<br /><img src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/2020080409091535dc43fc-c983-4bfe-a64f-20b11df2c030.png\" alt=\"\" width=\"1359\" height=\"1176\" />', 0, '31904579-348e-48af-ac33-a1bb59f49099', '2020-08-04 09:09:21.482');
INSERT INTO `faq` VALUES ('2a297e840b1c4170bbdae5ed62a1a33c', 'a1f1b2783e5a4c84a7e9f04a40170f3c', '纳税总额，纳税证明相关问题', '<p>请问您想咨询以下哪类税收相关的问题，回复数字获得答案<br>1.纳税总额的核算统计时间范围<br>2.企业纳税总额和常见可扣除的税费项<br>3.纳税证明打印<br>4.预缴税费是否涵盖在纳税总额<br>5.企业在不同区的纳税总额<br>6.企业开具的纳税证明要求</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-07 16:34:19.651');
INSERT INTO `faq` VALUES ('2f0a7c8deabf4817baa2e8632c94b966', '5bc9d57808e544c8aa74f852d4ea2fb8', '羟苯磺酸钙胶囊', '本品内容物为白色或类白色粉末或颗粒。<br /><strong>1.微血管病的治疗：</strong><br />　　糖尿性微血管病变--视网膜病病变、肾小球病变。<br />　　非糖尿性微血管病变--与慢性器质性疾病如高血压、动脉硬化和肝硬变等微关循环障碍。<br /><strong>2.静脉曲张综合症的治疗：</strong><br />　　原发性静脉曲张--手足发绀，紫癜性皮炎，肌肉痛性痉挛，疼痛、下至沉重感。<br />　　静脉曲张状态--血栓综合症，静脉炎及表浅性血栓性静脉炎，静脉曲张性溃疡，妊娠性静脉曲张，慢性静脉功能不全(CVI)。<br /><strong>3.与微循环障碍伴发静脉功能不全的治疗：</strong><br />　　痔疮综合症。<br />　　静脉曲张性。<br /><strong>4.静脉剥离和静脉硬化法的辅助治疗：<br /></strong>预防术后综合症，水肿及组织浸润。', 0, '31904579-348e-48af-ac33-a1bb59f49099', '2020-08-04 10:35:47.538');
INSERT INTO `faq` VALUES ('3ca89e0153e348a19fd30f6e1e055275', '4a8a7af95cd2468fb19d008894d0b5fb', '材料提交过程中发生的问题：表格锁定，电子版材料，页码编写，公章要求，行业重新组合，法人，内容显示，打印和装订', '请问您想咨询以下哪类申请材料的相关问题，回复数字获得答案<br />1.表格锁定或需要密码以启用宏保护<br />2.企业提交的电子版材料包括哪些？<br />3.材料如何编页码？<br />4.企业信息表需要同时有法人签字和加盖公章吗？<br />5.如果不符合行业划分，有机会重新组合吗？<br />6.表格内容显示不完整<br />7.打印和装订要求<br />8.申请资料哪些需要盖章', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-08 14:40:15.196');
INSERT INTO `faq` VALUES ('3d4ffd9caa494c8abdc3057544b7963c', 'a8df77a68c5742449ec2eabf606d96e2', '住：主播住哪里', '<p>可人儿，住你心里~😀点了关注，随时到达</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 15:14:55.944');
INSERT INTO `faq` VALUES ('3e8ae076b0ab4940bf9d4b1940b6c24a', '4f5b030d06954178887ea2d25f57eb99', '企业购房奖励补贴的申请条件和自由办公用房的解释', '<p>请问您想咨询以下哪类企业购房奖励补贴的问题，回复数字获得答案<br>1.联合申报企业中有企业有自有房产，可以申请办公用房补贴吗？<br>2.购地建设办公用房是否属于企业购房奖励？<br>3.办公用房配套设施包括哪些？<br>4.厂房，仓库算自有办公用房吗？</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-07 15:41:13.364');
INSERT INTO `faq` VALUES ('4665043405ec4bbcb09ff89f7bab5519', '5bc9d57808e544c8aa74f852d4ea2fb8', '缬沙坦氨氯地平片(Ⅰ)', '缬沙坦氨氯地平片(Ⅰ)<br>80/5mg x 7片<br>参考均价：¥59.90<br>有效日期至：2022-12-31<br>请问您想咨询药物相关哪项？回复Bot对应数字即可哦<br>1.适应症<br>2.用法<br>3.不良反应<br>4.完整说明书', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-08-06 13:32:27.348');
INSERT INTO `faq` VALUES ('4e7018ae793b469ba3cf1e014fdae51e', 'f0100438208a4508b9f315d4ad727c72', '企业并购重组奖励，是否需要有关部门出文件', '证明股权是否改变，并购重组股权变更需要在工商局进行备案', 0, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-08 13:53:55.993');
INSERT INTO `faq` VALUES ('5350f8b661e84fd69796a2f55cbcd6cb', '56d2039dde7142f5bb97af84d241020b', '入职相关知识:账号，系统链接，邮箱登录地址，BYSDN网站，安全培训，WBS，考勤填写，社保转移，公章，在职证明，薪资异常', '<p>欢迎入职^^<br>入职后哪里有疑惑，可以尝试回复小彦数字哦~<br>1.博彦账号查询<br>2.OA系统链接地址<br>3.公司邮箱登录地址<br>4.安全培训相关问题<br>5.WBS添加及其他<br>6.考勤相关问题<br>7.社保或公积金转移<br>8.公章资料申请<br>9.在职证明申请<br>10.薪资发放异常<br>11.劳动合同</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-20 13:29:41.884');
INSERT INTO `faq` VALUES ('54c0a41d225e47d3b851f44c7a94b126', '5bc9d57808e544c8aa74f852d4ea2fb8', '消炎镇痛药洛索洛芬钠片乐松', '镇痛药洛索洛芬钠片乐松<strong>用于</strong><br />1.类风湿性关节炎、骨性关节炎、腰痛症、肩关节周围炎、颈肩腕综合征、牙痛的消炎和镇痛。<br />2.手术后，外伤后、及拔牙后的镇痛和消炎。<br />3.急性上呼吸道炎的解热和镇痛。', 0, '31904579-348e-48af-ac33-a1bb59f49099', '2020-08-04 10:23:45.655');
INSERT INTO `faq` VALUES ('589de948efbc4ec1b77f0b1bdd84ffa7', 'e3721d6649ca4b60b4196ea086b0b0d9', '总部企业认定基本提问', '<p>请问您想咨询以下哪类认定相关的问题，回复数字获得答案<br>1.企业是否需要重新认定<br>2.集团申报条件<br>3.企业个体行业填写要求<br>4.认定的营业收入核算要求<br>5.企业属性手工录入<br>6.公司注册资本变更，申请材料如何填写<br>7.\"一企一策”解读<br>8.传统交通业的申报认定<br>9.专题政策扶持要求<br>10.企业章程，验资报告等材料要求<br>11.注册资金在认定表格中的转换<br>12.从业人数填写要求<br>13.财务报表填写要求</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-08 09:42:28.567');
INSERT INTO `faq` VALUES ('5ca00f914a194eee8202ffee3f4da7c7', 'e3a8274893364194b62f8f15e208ad83', '公司假期相关政策：婚假、年假、事假等', '<p>请问您想咨询哪个假期类别？<br>1. 年假<br>2. 司龄假<br>3. 事假<br>4. 病假<br>5. 丧假<br>6. 调休<br>7. 婚假<br>8. 产假/孕检假/生育假/流产假<br>9. 哺乳假<br>10. 陪产假</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 13:38:49.953');
INSERT INTO `faq` VALUES ('5f769f03b97746fdbb4e5fb21636a472', 'a088e715e8154c47b51785e79d0e2789', '公司备用区及信息安全的相关规定是什么', '<p>请问您想咨询什么内容？<br>1. 备用区规定<br>2. 安全规定</p>', 1, '238c6282-0e8c-4dcb-97d5-3ba395568cd8', '2020-06-29 16:32:53.354');
INSERT INTO `faq` VALUES ('6778028ba61d49ad8dd8e6663eb2c6ad', 'a8df77a68c5742449ec2eabf606d96e2', '来自火星的朋友送了一个小星星、跑车、火箭', '感谢亲送来的礼物~比心', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-16 14:13:26.828');
INSERT INTO `faq` VALUES ('75efe6709da34fa3ab726098685126a8', 'a088e715e8154c47b51785e79d0e2789', '用户忘记密码进行重置', '密码重置', 0, '31904579-348e-48af-ac33-a1bb59f49099', '2020-08-03 09:38:13.834');
INSERT INTO `faq` VALUES ('86f1238daf384bb885a27f6aaf44a3f6', '9c96eb5c8f9b4d1b8dc1c5d76cfe7130', '日常、差旅、生育津贴等报销流程咨询', '<p>请问您要咨询报销相关？<br>1.公司的发票抬头&nbsp;<br>2.报销的一二三类城市分类<br>3.加班餐补<br>4.加班或公务车补<br>5.通讯费报销要求<br>6.公务借款<br>7.团建费用<br>8.培训报销<br>9.差旅报销<br>10.生育津贴/生育保险报销</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-09 09:50:38.742');
INSERT INTO `faq` VALUES ('96d2d65cc3d549c482ff70e438b7258c', '954adc93ce00432981c393efef8cbd59', '员工项目组内部调动，跨公司调动流程', '<p>请问您是<br>1.项目组内部调动<br>2.跨公司调动</p>', 1, '238c6282-0e8c-4dcb-97d5-3ba395568cd8', '2020-06-29 16:25:55.017');
INSERT INTO `faq` VALUES ('9715c8e4af5e481d811b4a17d1c232d6', 'a8df77a68c5742449ec2eabf606d96e2', '联系方式、手机、电话、微信、qq、邮箱、抖音号是多少？', '<p>想要我的联系方式，请先给主播关注并打赏哦~</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 15:15:04.222');
INSERT INTO `faq` VALUES ('9d0b13bc5ec74698b7e23fa534ad27e9', '0345db595087493eba1fb6567dc02226', '家政相关咨询', '请问您是想咨询家政相关问题么？可直接回复数字提问哦？<br />1.家政招募<br />2.家政投诉', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-30 15:53:41.252');
INSERT INTO `faq` VALUES ('c0462fc3db024ad192a5bddedf0b5472', '56d2039dde7142f5bb97af84d241020b', '离职申请，离职年假处理及当天是否可以办理', '<p>请问你想咨询离职相关哪些事宜？<br>1.离职流程申请<br>2.离职年假处理</p>', 1, '238c6282-0e8c-4dcb-97d5-3ba395568cd8', '2020-06-29 16:28:09.302');
INSERT INTO `faq` VALUES ('d12b695aed904c3a8e86d58be3c0c8c5', 'a8df77a68c5742449ec2eabf606d96e2', '衣:喜欢主播的衣服妆容和身材', '<p>谢谢亲爱的喜欢我们主播！点关注让她更喜欢你呀❤</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 15:15:31.877');
INSERT INTO `faq` VALUES ('d84c952711294304b1d4fc5b3fc9a5a0', '56d2039dde7142f5bb97af84d241020b', '员工按期或提前转正流程', '<p>请问您想咨询以下哪类事项？<br>1. 实习生转正<br>2. 非实习生转正<br>3. 劳务合同变更</p>', 1, '238c6282-0e8c-4dcb-97d5-3ba395568cd8', '2020-06-29 16:21:53.801');
INSERT INTO `faq` VALUES ('df7518ce93774af9b2eb522d5cf7b46c', 'd99d35e4aedd4e96ba68e96de609d52d', '联合申报相关咨询', '<p>请问您想咨询以下哪类联合申报相关的问题，回复数字获得答案<br>1.联合申报企业所属行业确定<br>2.同公司/字母公司的跨区联合申报<br>3.控股企业联合申报<br>4.联合申报盖章要求<br>5.联合申报的财报要求<br>6.无法合并申报的情况<br>7.关联企业控股人及控股要求</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-08 13:16:26.111');
INSERT INTO `faq` VALUES ('fbb847800a65419fa83bf70fe57e1665', 'a8df77a68c5742449ec2eabf606d96e2', '行：上班通勤', '<p>悄悄点关注凹，上班再进来也能看到我</p>', 1, '31904579-348e-48af-ac33-a1bb59f49099', '2020-07-03 15:15:22.112');

-- ----------------------------
-- Table structure for faq_package
-- ----------------------------
DROP TABLE IF EXISTS `faq_package`;
CREATE TABLE `faq_package`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `business_unit_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faq_package
-- ----------------------------
INSERT INTO `faq_package` VALUES ('0345db595087493eba1fb6567dc02226', '家政', 'ef4b22082c3f4e44b447e00225a7e44d');
INSERT INTO `faq_package` VALUES ('4a8a7af95cd2468fb19d008894d0b5fb', '材料提交', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('4f5b030d06954178887ea2d25f57eb99', '企业购房', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('56d2039dde7142f5bb97af84d241020b', '入离职政策', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('5bc9d57808e544c8aa74f852d4ea2fb8', '药物咨询', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('8538aa64673940a0b2ec30f52f203f8e', '购置、租房通用', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('89e405ebad4c4746bb2510cb49f73826', '人才租房补贴', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('913c316105bc4fa081a57f9e25068897', '物业', 'ef4b22082c3f4e44b447e00225a7e44d');
INSERT INTO `faq_package` VALUES ('954adc93ce00432981c393efef8cbd59', '员工关系调动', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('9c96eb5c8f9b4d1b8dc1c5d76cfe7130', '报销流程', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('a088e715e8154c47b51785e79d0e2789', '信息安全', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('a1f1b2783e5a4c84a7e9f04a40170f3c', '税收', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('a8df77a68c5742449ec2eabf606d96e2', '秀场直播', '4e57febd97ee483f9f3442b363a7d4b4');
INSERT INTO `faq_package` VALUES ('c55523a3478c4cab970f2e65dc57c100', '中高管奖励', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('d99d35e4aedd4e96ba68e96de609d52d', '联合申报', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('e3721d6649ca4b60b4196ea086b0b0d9', '认定', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('e3a8274893364194b62f8f15e208ad83', '假期政策', '99742c85728c4625ad0e6bbdce5ce460');
INSERT INTO `faq_package` VALUES ('e7361c147efc4f86a553259cc85d167f', '企业租房', 'ef816449fdeb4f8599c868b340fb1a36');
INSERT INTO `faq_package` VALUES ('f0100438208a4508b9f315d4ad727c72', '并购重组', 'ef816449fdeb4f8599c868b340fb1a36');

-- ----------------------------
-- Table structure for filter_words
-- ----------------------------
DROP TABLE IF EXISTS `filter_words`;
CREATE TABLE `filter_words`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `word` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filter_words
-- ----------------------------
INSERT INTO `filter_words` VALUES ('006ffc4f742a4b92b0ff802df6cd1c9d', '噢');
INSERT INTO `filter_words` VALUES ('06f87e8f3e01483a855b52bbbc44972a', '啊');
INSERT INTO `filter_words` VALUES ('16e6b1ad083f46edbba263e75d92f426', '谢谢');
INSERT INTO `filter_words` VALUES ('1972c6d8a12942a48ceccd8e128cca15', '请问');
INSERT INTO `filter_words` VALUES ('238ad0a8fc0a4728908cb7e103d930d0', '嘛');
INSERT INTO `filter_words` VALUES ('3800cf94230d4f63b370220af01c2be9', '你好');
INSERT INTO `filter_words` VALUES ('6e00c91906094239839fba37cca2d075', '呢');
INSERT INTO `filter_words` VALUES ('730494c04d314bb989a465e7e48f4eb9', '？');
INSERT INTO `filter_words` VALUES ('d2ce027ad6f249d193f8570846148c7a', '啦');

-- ----------------------------
-- Table structure for glossary
-- ----------------------------
DROP TABLE IF EXISTS `glossary`;
CREATE TABLE `glossary`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `noun` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `explain` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `transliteration` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_default` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of glossary
-- ----------------------------
INSERT INTO `glossary` VALUES ('177b35af18d948a8944206df14ea37f3', '名片', '', '我想申请名片', 0);
INSERT INTO `glossary` VALUES ('530d08e448e94e71ac00ca73e45a2000', 'test', 'test', '', 0);
INSERT INTO `glossary` VALUES ('acd2c3383ffd48009e9bb2152c1c50c4', '女神', '糟糕啊啊啊啊啊啊，是心动啊', '', 0);
INSERT INTO `glossary` VALUES ('b28543dd02a949599ddb1e3df31a0428', '新帕尔克', '<strong>新帕尔克（酚麻美敏片）</strong>口服，成人和12岁以上儿童每6小时1次，每次1片，24小时内不超过4次。<br /><strong>适应症:</strong>用于普通感冒引起的发热、头痛、周身四肢酸痛、打喷嚏、流涕、鼻塞、咳嗽、咽痛等症状。', '', 0);
INSERT INTO `glossary` VALUES ('b99023388cea41be990647d79658c836', '泡腾片', '<p><strong>泡腾片</strong>服用可用温开水将片剂置入水杯中，待药物气泡消退，药物完全溶化后，搅拌均匀后服用即可，通常药物经过溶解后，更利于肠胃吸收，对调节身体起到辅助作用。而<strong>不宜用茶水或者碳酸饮料</strong>，果汁等服用，会引起药物化学反应，反而不利于吸收，还需多注意。而泡腾片主要作用是起效迅速，可降低药物对肠胃刺激影响等，泡腾片不宜长时间大量服用易诱发一些疾病风险，<strong>还需在合理范围内用药。</strong></p>', '维生素的使用', 0);
INSERT INTO `glossary` VALUES ('eb1cb53ea26c43b1925a9db18eb70eec', '男神', '糟糕！是心动呀！', '', 0);
INSERT INTO `glossary` VALUES ('f26f0258ebfa4a63b6a1de5e2653b97d', '名片', '申请名片需要发邮件至****@hotmail.com', '', 0);

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node`  (
  `node_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `node_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `node_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `top` double NULL DEFAULT NULL,
  `left` double NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `process_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`node_id`) USING BTREE,
  UNIQUE INDEX `node_id`(`node_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('01fb9570a9f811eab79cab3001cc087d', '选项', '选项', 304, 20, '<p>请问您要咨询报销相关？<br>1.公司的发票抬头&nbsp;<br>2.报销的一二三类城市分类<br>3.加班餐补<br>4.加班或公务车补<br>5.通讯费报销要求<br>6.公务借款<br>7.团建费用<br>8.培训报销<br>9.差旅报销<br>10.生育津贴/生育保险报销</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('06696430a96611ea8a7e11d4ec826f36', '选项', '选项', 716, 414, '<p>产假为128天，遇节假日不顺延：其中产前可提前15天休假，难产（剖腹产）可增加产假15天；多胞胎生育，每多生育一个婴儿，可增加产假15天。 <br><strong>申请产假所需材料：</strong> <br>a、婴儿出生前申请：<br> 结婚证；诊断证明（注有预产期加盖医院章）；生育服务单。<br>b、婴儿出生后申请：<br> 结婚证；诊断证明（注有分娩方式及孕周数加盖医院章）；生育服务单；婴儿出生证明 <br><strong>申请方法：</strong><br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传上述材料），待定额假期完成后，在提交员工请假流程即可。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('067f9720c01611eab1dd2bae4f3c75e3', '开始', '开始', 76, 20, '      \n              开始\n              \n              \n              \n              \n              \n              ', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('06d099f0a9f411ea91be7f259e1bd9ba', '开始', '开始', 70, 23, '             \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('0757a7a0c01611eab1dd2bae4f3c75e3', '问题', '问题', 158, 21, '<p>联合申报相关咨询</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('07742cf0a9f411ea91be7f259e1bd9ba', '问题', '问题', 142, 27, '<p>员工项目组内部调动，跨公司调动流程</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('08cfc060a96711ea8a7e11d4ec826f36', '答案', '答案', 1151, 441, '<p>公司男员工在公司任职期间，法定配偶按国家级北京市有关政策生育的，享受15天陪产假，遇节假日不顺延。<br> <strong>申请陪产假方法：</strong><br> 员工申请陪产假需先邮件给项目经理（抄送考勤员），等项目经理批准后，在OA系统中，新建流程--考勤管理--假别定额申请流程（需上传结婚证及婴儿出生证明的扫描件。），待定额假期完成后，在提交员工请假流程即可。<br>注：未申请陪产假的男员工，视为自动放弃。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('0916e3d0c01611eab1dd2bae4f3c75e3', '选项', '选项', 360, 5, '<p>请问您想咨询以下哪类联合申报相关的问题，回复数字获得答案<br>1.联合申报企业所属行业确定<br>2.同公司/字母公司的跨区联合申报<br>3.控股企业联合申报<br>4.联合申报盖章要求<br>5.联合申报的财报要求<br>6.无法合并申报的情况<br>7.关联企业控股人及控股要求</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('09a94750a9f211ea91be7f259e1bd9ba', '答案', '答案', 1148, 490, '<p>员工在职证明申请:OA系统-新建流程-用章审批流程-人事章审批流程</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('0a8087c0b13511eaac8147578f007e03', '答案', '答案', 86, 776, '<p>实习生拿到毕业证书后，方可身份变更至正式员工。身份变更为每月1号，具体请咨询当地招聘组同事。</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('0a99be10d30011ea87de4f72b22c127f', '答案', '答案', 379, 355, '【用法】<br>用单药治疗不能充分控制血压的患者，可以改用本品；通常开始用药或改变剂量后2周内达到绝大部分的治疗效应。<br>为方便给药，接受氨氯地平和缬沙坦单药联合治疗的患者可以改用相同剂量的本品进行治疗', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('0b77e5a0c01311ea9c95a96aec82f490', '答案', '答案', 226, 379, '<p>认定可以由一个集团可以组合成多个总部企业申报</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('0d384aa0a96711ea8a7e11d4ec826f36', '答案', '答案', 1243, 479, '<p>上海地区的陪产假<br>Ⅰ 公司男员工在公司任职期间，法定配偶按国家及上海市有关政策生育的，享受 10天陪产假，遇法定节假日顺延，须在女方产假期间内一次性休完；<br>Ⅱ 员工请陪产假须在 OA 系统提交定额申请，并按照要求上传《结婚证》、《出生医学证明》复印件，定额配置后可请休陪产假。陪产假须在女方产假期间内一次性休完；<br>Ⅲ 陪产假期间工资不变，设定绩效工资、绩效奖金的员工无绩效工资和绩效奖金。<br>Ⅳ 未主动在女方产假期间内申请陪产假的男员工，视为自动放弃。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('0f4e68e0a9f511ea91be7f259e1bd9ba', '开始', '开始', 55, 23, '             \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('0f77acb0a9fe11eab79cab3001cc087d', '选项', '选项', 1068, 88, '<p>请问您要咨询差旅报销的哪项事宜<br>1.住宿发票要求<br>2.差旅补贴和用餐发票要求<br>3.住宿标准<br><br></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('106e2140a96711ea8a7e11d4ec826f36', '答案', '答案', 1328, 524, '<p>公司男员工在公司任职期间，法定配偶按国家及陕西省有关政策生育的，享受 15天陪产假，须在女方产假期间内一次性休完。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('1086081d9a9e461ca74db4ada13bdef8', '答案', '答案', 300, 300, '本品内容物为白色或类白色粉末或颗粒。<br /><strong>1.微血管病的治疗：</strong><br />　　糖尿性微血管病变--视网膜病病变、肾小球病变。<br />　　非糖尿性微血管病变--与慢性器质性疾病如高血压、动脉硬化和肝硬变等微关循环障碍。<br /><strong>2.静脉曲张综合症的治疗：</strong><br />　　原发性静脉曲张--手足发绀，紫癜性皮炎，肌肉痛性痉挛，疼痛、下至沉重感。<br />　　静脉曲张状态--血栓综合症，静脉炎及表浅性血栓性静脉炎，静脉曲张性溃疡，妊娠性静脉曲张，慢性静脉功能不全(CVI)。<br /><strong>3.与微循环障碍伴发静脉功能不全的治疗：</strong><br />　　痔疮综合症。<br />　　静脉曲张性。<br /><strong>4.静脉剥离和静脉硬化法的辅助治疗：<br /></strong>预防术后综合症，水肿及组织浸润。', '803e8e252998477ab3feee3bde453583');
INSERT INTO `node` VALUES ('1375f6b0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 16, 448, '<p>博彦账号会在 入职后的次日，登陆个人私人邮箱查收邮件\"博彦员工入职欢迎信\"。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('13b64760a96711ea8a7e11d4ec826f36', '答案', '答案', 1384, 566, '<p>1、公司男员工在公司任职期间，法定配偶按国家及苏州市有关政策生育的，享受 15天陪产假，遇法定节假日不顺延，须在婴儿出生之日起三个月内一次性休完；<br>2、员工请陪产假须在 OA 系统提交定额申请，并按照要求上传《结婚证》、《出生医学证明》复印件，定额配置后可请休陪产假。陪产假须在女方产假期间内一次性休完；<br>3、陪产假期间工资不变，设定绩效工资、绩效奖金的员工无绩效工资和绩效奖金。<br>4、未主动在婴儿出生之日起三个月内申请陪产假的男员工，视为自动放弃。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('13ef3d30c01a11eab1dd2bae4f3c75e3', '结束', '结束', 551, 815, '      \n              结束\n              \n              \n              \n              \n              \n              ', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('1414ab10b16a11ea84abb32d92922ac7', '选项', '选项', 590, 455, '<p>请问您的合同所在地是哪里？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('156cb130c0e511eabc5cbf4ccf21b331', '答案', '答案', 494, 397, '因法人代表签字那块是需要企业承诺的，如果法人代表不在本地，可授权其他人签字，提供授权委托书。', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('156eaab0a9f411ea91be7f259e1bd9ba', '选项', '选项', 256, 97, '<p>请问您是<br>1.项目组内部调动<br>2.跨公司调动</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('17609dd0d30011ea87de4f72b22c127f', '答案', '答案', 596, 360, '【不良反应】<br>已经在超过2600名高血压患者中进行了缬沙坦氨氯地平片的安全性评价；不良反应通常轻微且短暂，只有极少数情况下需要停药。<br>不良反应的总体发生率为非剂量依赖性，且与性别、年龄和种族均无关。', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('17ae8bf0c01611eab1dd2bae4f3c75e3', '答案', '答案', 105, 417, '<p>Ⅰ.联合申报的企业中无房地产企业的：<br>属于同一行业类别的企业税收额占比超过50%的，该联合申报企业可认定为该行业类别；属于同一行业类别的税收额比重未超过50%的，无法进行行业归类的，认定为总部企业需同时满足以下三条件：上一年度营业收入5亿元以上、上一年度纳税总额不低于1亿元、注册资本200万以上。<br>Ⅱ.联合申报的企业中有房地产企业的：联合申报企业的行业分类为房地产业。</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('193a0ec0a9ed11ea91be7f259e1bd9ba', '选项', '选项', 265, 0, '<p>欢迎入职^^<br>入职后哪里有疑惑，可以尝试回复小彦数字哦~<br>1.博彦账号查询<br>2.OA系统链接地址<br>3.公司邮箱登录地址<br>4.安全培训相关问题<br>5.WBS添加及其他<br>6.考勤相关问题<br>7.社保或公积金转移<br>8.公章资料申请<br>9.在职证明申请<br>10.薪资发放异常<br>11.劳动合同</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('1f3bcea6d58446c881c7b13dc8b6afbd', '答案', '答案', 300, 300, '证明股权是否改变，并购重组股权变更需要在工商局进行备案', 'ae494584044449fd898edbeb54565509');
INSERT INTO `node` VALUES ('1f9bf4d0b13c11eaac8147578f007e03', '答案', '答案', 1341, 891, '<p>生育津贴所需材料：<br>1、《北京市申领生育津贴人员信息登记表》二份（需要手签）表格可联系当地部门助理；<br>2、北京户籍人员应提供《北京市生育服务证》原件及复印件或《北京市生育登记服务单》原件及复印件或《北京市再生育确认服务单》（第三个及以上子女）原件及复印件；非京籍人员提供《北京市外地来京人员生育服务联系单》（生育保险专用）原件及复印件或《北京市流动人口生育登记服务单》原件及复印件或《北京市流动人口再生育确认服务单》原件及复印件；<br>3、《婴儿出生证明》原件及复印件；<br>4、医疗机构出具的《医学诊断证明书》原件及复印件（需要带有分娩方式的）；<br>5、结婚证复印件<br>注：产假结束后请尽快把上述材料提交到部门助理</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('20a634a01b4c494b8de67ff5bd201a4e', '↵                结束', '↵                结束', 500, 500, '↵                结束', '20ac7c045eeb49f6bb6e835804087977');
INSERT INTO `node` VALUES ('221bcb70a9f511ea91be7f259e1bd9ba', '选项', '选项', 381, 530, '<p>Ⅰ <strong>按期转正</strong>：HR提前一个月OA发起流程—HEAR OA确认—员工完成“试用期个人工作效果分析”—DM确认及完成打分—BU Head确认—员工关系组（归档完成）；<br>Ⅱ <strong>提前转正</strong>：DM按照员工表现给予提前转正（邮件至HEAR知晓）—员工本人OA系统发起申请—HEAR确认（提前没有邮件不予确认）—DM确认&amp;完成打分（80分以上）—BU Head确认—员工关系组（归档完成）</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('222f70f0b13c11eaac8147578f007e03', '答案', '答案', 1632, 541, '<p>请咨询当地HR部门。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('22f6e860c01e11eab1dd2bae4f3c75e3', '答案', '答案', 642, 317, '<p>企业在不同区的纳税总额，以最后税局核定数为准。</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('2388d7b0a9ef11ea91be7f259e1bd9ba', '选项', '选项', 506, 24, '<p>请问您想咨询<br>1.如何填写考勤<br>2.本月考勤周期<br>3.考勤节点当天入职怎么办</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('240e2cf0a9f211ea91be7f259e1bd9ba', '选项', '选项', 1303, 260, '<p>请问您的办公地在哪个城市？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('2601e4b0bccc11ea9ce23960bec20268', '开始', '开始', 96, 65, '  \n              开始\n              \n              ', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('260a3f00b9e011ea851a51443f2ba287', '答案', '答案', 717, 661, '<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200629161203d0fdf760-49f8-40fc-866f-09f56e176a4f.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('263fe840d23a11eaaa2207ad01666ef1', '答案', '答案', 228, 382, '<strong>Green Villas Phase I-III</strong><br><img src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/2020073015583169a77514-f327-4d0f-ae5a-72b13ae30d59.jpg\" alt=\"\" width=\"375\" height=\"220\"><br>Green Villas phrase I-III designed by Australian designer was the first estate introduced features residential concept in Shanghai. With a total area of <strong>185400</strong> square meters, divided into A-G 8 waterscape islands, have to build <strong>102 independent</strong> light wood structure villa. They are environmental protection, ecology and energy saving. A meandering river throughout the district and 60 kinds of nearly 10 thousand precious trees and flowers made up <strong>70%</strong> of the green rate, which created a standard residential vision of “the garden on the island”.', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('277cebf0bccc11ea9ce23960bec20268', '结束', '结束', 288, 1246, '  \n              结束\n              \n              ', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('27f53180a9fa11eab79cab3001cc087d', '选项', '选项', 26, 453, '<p>请问您想咨询哪个城市的发票信息？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州<br>提交电子发票进行报销，必须填写发票的电子发票号，以方便财务审核。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('28d3cf00d23911eaaa2207ad01666ef1', '结束', '结束', 332, 600, ' \n              结束\n              ', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('291a01b0a96611ea8a7e11d4ec826f36', '答案', '答案', 725, 679, '<p>妊娠不满16周休15天，16周及以上的休42天。 <br>申请方法： <br>Ⅰ 第一步：<br> 申请流产假需向项目经理邮件申请（邮件中附上结婚证及诊断证明，抄送考勤员），<br>Ⅱ 第二步：<br> 在OA系统中提交流程，新建流程--考勤管理--假别定额申请流程（需上传结婚证及诊断证明）等定额流程归档后方可提交请假流程。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('297e4b20bcd511eaa872912b9807cf65', '开始', '开始', 145, 37, '    \n              开始\n              \n              \n              \n              ', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('2a537ac0c01d11eab1dd2bae4f3c75e3', '答案', '答案', 300, 340, '<p>纳税总额不含：代扣代缴、代收代缴、海关关税及费。<br>常见需扣除的税费包括：个人所得税、进口增值税、出口增值税、残疾人保障金、地方教育附加、其他收入等</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('2a935f30a9fe11eab79cab3001cc087d', '答案', '答案', 1059, 401, '<p>员工出差住宿费，按职务级别参照住宿标准在限额内报销。需要提供住宿费专用发票，同时提供加盖酒店印章的住宿清单。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('2af2a820a9fc11eab79cab3001cc087d', '选项', '选项', 546, 338, '<p>请问您想咨询<br>1.通讯费报销要求<br>2.通讯费报销备案<br>3.通讯费报销额度</p>\n<p>&nbsp;</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('2b134300bcd511eaa872912b9807cf65', '问题', '问题', 215, 62, '<p>行：上班通勤</p>', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('2be32a70d30011ea87de4f72b22c127f', '答案', '答案', 857, 383, '说明书<br><img src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200731153529d4280ca0-c60f-42ab-a59f-46460d0a7f8a.jpg\" alt=\"\" width=\"954\" height=\"1680\">', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('2d742030d23b11eaaa2207ad01666ef1', '答案', '答案', 1729, 371, 'U-HOME is specially service to the white-collar in the district. The apartment has lobby, restaurants, convenience stores, laundry room, basketball court and room facilities,', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('2d967c20a9f511ea91be7f259e1bd9ba', '答案', '答案', 280, 837, '<p><strong>按期转正</strong>：HR提前一个月OA发起流程—HEAR OA确认—员工完成“试用期个人工作效果分析”—DM确认及完成打分—BU Head确认—员工关系组（归档完成）</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('2de06750a9fe11eab79cab3001cc087d', '答案', '答案', 1070, 642, '<p>员工出差工作餐费金额按出差天数乘以日标准计算；员工需提供出差期间内在出差地发生的合法用餐发票</p>\n<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200622101106ed91eb03-0106-4a8e-87ab-9540c29afef8.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('2e03ae71eef848c7af7e433fbd2c9cab', '问题', '问题', 200, 200, '黄氏响声丸', '8bed108da3ac46fd9ac0f443d2d03e9a');
INSERT INTO `node` VALUES ('2fb871c0a9f511ea91be7f259e1bd9ba', '答案', '答案', 431, 845, '<p><strong>提前转正</strong>：DM按照员工表现给予提前转正（邮件至HEAR知晓）—员工本人OA系统发起申请—HEAR确认（提前没有邮件不予确认）—DM确认&amp;完成打分（80分以上）—BU Head确认—员工关系组（归档完成）</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('3066d340d2ff11ea87de4f72b22c127f', '开始', '开始', 119, 59, '  \n              开始\n              \n              ', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('306b7f00a9fe11eab79cab3001cc087d', '答案', '答案', 1259, 534, '<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200622101127b2935665-4e09-4aa6-a68f-e99d7b5acee1.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('312911d0d2ff11ea87de4f72b22c127f', '问题', '问题', 202, 54, '缬沙坦氨氯地平片(Ⅰ)', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('31a15520c0e211eabc5cbf4ccf21b331', '开始', '开始', 95, 30, ' \n              开始\n              ', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('32178ce0a9f411ea91be7f259e1bd9ba', '答案', '答案', 475, 492, '<p>由DM发起调动需求至HEAR Team，经确认后，由员工本人在OA发起相关调动流程。</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('32760a40c0e211eabc5cbf4ccf21b331', '问题', '问题', 173, 20, '材料提交过程中发生的问题：表格锁定，电子版材料，页码编写，公章要求，行业重新组合，法人，内容显示，打印和装订', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('32bf4230d2ff11ea87de4f72b22c127f', '选项', '选项', 281, 58, '缬沙坦氨氯地平片(Ⅰ)<br>80/5mg x 7片<br>参考均价：¥59.90<br>有效日期至：2022-12-31<br>请问您想咨询药物相关哪项？回复Bot对应数字即可哦<br>1.适应症<br>2.用法<br>3.不良反应<br>4.完整说明书', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('338923a0c00011ea9c95a96aec82f490', '开始', '开始', 89, 32, '           \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('340736a0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 78, 490, '<p>公司的OA网址:<a href=\"https://e-cology.beyondsoft.com\" target=\"_blank\" rel=\"noopener\">https://e-cology.beyondsoft.com</a></p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('34979320b16a11ea84abb32d92922ac7', '答案', '答案', 559, 850, '<p>北京身份变更日期为每月1号。<br>由DM发起变更需求邮件至HEAR Team，部门助理将协助在OA发起相关审批流程。</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('34bcc1a0c00011ea9c95a96aec82f490', '问题', '问题', 165, 39, '<p>总部企业认定基本提问</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('35cbe7b0c00011ea9c95a96aec82f490', '选项', '选项', 585, 4, '<p>请问您想咨询以下哪类认定相关的问题，回复数字获得答案<br>1.企业是否需要重新认定<br>2.集团申报条件<br>3.企业个体行业填写要求<br>4.认定的营业收入核算要求<br>5.企业属性手工录入<br>6.公司注册资本变更，申请材料如何填写<br>7.\"一企一策”解读<br>8.传统交通业的申报认定<br>9.专题政策扶持要求<br>10.企业章程，验资报告等材料要求<br>11.注册资金在认定表格中的转换<br>12.从业人数填写要求<br>13.财务报表填写要求</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('386e9c00b9df11ea851a51443f2ba287', '答案', '答案', 714, 666, '<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200629160818314592b0-b888-4548-b9ed-fca24c5f747f.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('3f1424f0c0e511eabc5cbf4ccf21b331', '答案', '答案', 647, 345, 'EXCEL表格无法编译及调整格式，只需保证表格内容填写的完整性即可，审核部门导入系统后能显示完整。', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('3f17eb10a96311ea8a7e11d4ec826f36', '答案', '答案', 139, 361, '<p>Ⅰ 在职12个月以上且年假已休完；在公司满一年享受一 天，每多一年增加一天，最多不超过5天。 <br>Ⅱ 司龄假期间发放全薪。 <br>Ⅲ 司龄假使用期限为每年的1月1日~12月31日，不可转到下一年度。 <br>Ⅳ 有下列情形之一的，不享受当年的司龄假，若已享受当年司龄假，不享受下一年度的司龄假。<br>&nbsp; &nbsp; a、已休病假，事假，产假累计30天及以上的；<br>&nbsp; &nbsp; b、 已记旷工的；<br>&nbsp; &nbsp; c、 迟到早退累计次数超过5次以上 的。<br>Ⅴ 申请方法：<br>&nbsp; &nbsp; 请登录公司“OA系统-新建流程-考勤管理-员工请假流程来申请司龄假</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('3f934610b13911eaac8147578f007e03', '答案', '答案', 126, 651, '<p>微软项目组办公人员，有着基于微软策略的安全规范，所有新入职员工在进入OF办公区前都需申请一个 v-alias （V账号），在V账号还未下达时，只能先行至“备用区”进行相关的微软101 Training&amp;相关的安全规定培训。待V账号生成后，并完成相关培训后方才能进去办公场所OF。</p>', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('40ad68a0b13911eaac8147578f007e03', '答案', '答案', 401, 718, '<p>登录内部系统BYSDN： https://bysdn.beyondsoft.com，博彦账号密码登录，主页右边“Training—新员工培训—基础知识—安全培训” 进入相关考试内容。</p>', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('417cdee0b13f11eaac8147578f007e03', '问题', '问题', 101, 97, '<p>员工按期或提前转正流程</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('427e18f0bcc911ea9ce23960bec20268', '开始', '开始', 100, 48, '     \n              开始\n              \n              \n              \n              \n              ', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('431d87d0a9f211ea91be7f259e1bd9ba', '答案', '答案', 1289, 560, '<p>北京薪资发放异常:请联系HR，会为您查询解答</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('434bf040bcc911ea9ce23960bec20268', '结束', '结束', 422, 1228, '     \n              结束\n              \n              \n              \n              \n              ', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('440b1fd0d23911eaaa2207ad01666ef1', '选项', '选项', 408, 354, 'Please fill in the relevant complaint reasons and information', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('447e67e0a96411ea8a7e11d4ec826f36', '结束', '结束', 858, 1331, '                                      \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('44e6cec0a9f511ea91be7f259e1bd9ba', '结束', '结束', 430, 1370, '            \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('45cc2d10a9f211ea91be7f259e1bd9ba', '答案', '答案', 1327, 573, '<p>上海薪资发放异常:邮件至wangjing30@beyondsoft.com，将会有专业HR人员为您解答。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('474230b0bcc911ea9ce23960bec20268', '问题', '问题', 223, 112, '<p>联系方式、手机、电话、微信、qq、邮箱、抖音号是多少？</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('48daf3b0a9f211ea91be7f259e1bd9ba', '答案', '答案', 1383, 597, '<p>西安薪资发放异常:邮件至askhr-xa@beyondsoft.com，将会有专业HR人员为您解答。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('495c5580a9ee11ea91be7f259e1bd9ba', '答案', '答案', 138, 515, '<p>博彦邮箱登陆地址：https://imail.beyondsoft.com</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('4c46257ce8754c4da07861296aefced4', '↵                开始', '↵                开始', 100, 100, '↵                开始', '803e8e252998477ab3feee3bde453583');
INSERT INTO `node` VALUES ('4c9b7b5154b447b7b6a9dfcb263ca862', '答案', '答案', 300, 300, '<strong>黄氏响声丸，中医方剂名</strong>。出自《中国药典》2005版。具有疏风清热，化痰散结，利咽开音之功效。主治风热外束、痰热内盛所致的急、慢性喉瘠，症见声音嘶哑、咽喉肿痛、咽干灼热、咽中有痰，或寒热头痛，或便秘尿赤;急、慢性喉类及声带小结、声带息肉初起见上述证候者。临床常用于(1)风热上受、痰热内盛证,临床应用以声音嘶哑、咽喉肿痛、咽千灼热有痰为辨证要点。(2)用于急性、慢性喉炎及声带小结,声带息肉初起见上述证候者。<br /><img src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/2020080409091535dc43fc-c983-4bfe-a64f-20b11df2c030.png\" alt=\"\" width=\"1359\" height=\"1176\" />', '8bed108da3ac46fd9ac0f443d2d03e9a');
INSERT INTO `node` VALUES ('4ce55cd0bcd411eaa872912b9807cf65', '开始', '开始', 98, 44, '  \n              开始\n              \n              ', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('4cea3a60a9f211ea91be7f259e1bd9ba', '答案', '答案', 1447, 616, '<p>苏州薪资发放异常：请联系HR，会为您查询解答</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('4d7c93c0bcd411eaa872912b9807cf65', '问题', '问题', 174, 45, '<p>食：是否做饭？</p>', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('4e941bd0b12f11eaac8147578f007e03', '答案', '答案', 2, 695, '<p>部门内部换组请DM发邮件至 <a href=\"mailto:zhouyan@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">zhouyan@beyondsoft.com</a>&amp;<a href=\"mailto:yinkun@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">yinkun@beyondsoft.com</a>，另需CC北京HEAR相关人员；产假人员需提前15天发起调动流程。</p>\n<p>员工内部调动需由员工本人在OA系统发起流程。</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('4ef773b0a9eb11ea91be7f259e1bd9ba', '开始', '开始', 59, 32, '        \n              开始\n              \n              \n              \n              \n              \n              \n              \n              ', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('4f16d020d23b11eaaa2207ad01666ef1', '结束', '结束', 1212, 741, '  \n              结束\n              \n              ', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('4f3af020bcd511eaa872912b9807cf65', '选项', '选项', 343, 86, '<p>悄悄点关注凹，上班再进来也能看到我</p>', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('5021c450a96611ea8a7e11d4ec826f36', '选项', '选项', 826, 414, '<p>西安员工产假共98个自然日+《陕西省人口与计划生育条例》增加60个自然日+孕前检查奖励10个自然日+难产15个自然日+多胞胎，每多一个婴儿增加15个自然日产假。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('50c812d0b12f11eaac8147578f007e03', '答案', '答案', 91, 730, '<p>部门内部换组请DM发邮件至 <a href=\"mailto:zhouyan@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">zhouyan@beyondsoft.com</a>，另需CC人员<a href=\"mailto:liuying11@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">liuying11@beyondsoft.com</a>及上海HEAR相关人员；产假人员需提前15天发起调动流程。</p>\n<p>员工内部调动需由员工本人在OA系统发起流程。</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('52ef3ac0a9eb11ea91be7f259e1bd9ba', '问题', '问题', 144, 49, '<p>离职申请，离职年假处理及当天是否可以办理</p>', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('53159860a9f411ea91be7f259e1bd9ba', '结束', '结束', 497, 1274, '             \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('54990250a96b11ea8a7e11d4ec826f36', '选项', '选项', 54, 347, '<p>Ⅰ 正式员工连续缴纳社保满一年且在本公司已转正（新入职员工需提供连续社保缴纳一年证明）。<br>Ⅱ 时间界定：<br>&nbsp; &nbsp;1年≤累计工作年限&lt;10年=5天；10年≤累计工作年限&lt;20年=10天；累计工作年限≥20年=15天。 <br>Ⅲ 有下列情形之一的，不享受当年的年休假，若已享受当年年假，不享受下一年度的年假。<br>&nbsp; &nbsp;a.事假累计超过30天（含）；<br>&nbsp; &nbsp;b.1年=累计工作&lt;10年：请病假累 计2个月以上；<br>&nbsp; &nbsp;c.10年=累计工作&lt;20年：请病假累计3个月以上；<br>&nbsp; &nbsp;d.累计工作≥20年：请病假累计4个月以上。 <br>Ⅳ 年假期间发放全薪 <br>Ⅴ 申请方法：<br>&nbsp; &nbsp; 请登录公司“OA系统-新建流程-考勤管理-员工请假流程</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('56085f70b12f11eaac8147578f007e03', '选项', '选项', 103, 372, '<p>您需要了解项目组内部调动流程，请问您的办公地是在哪个城市？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('56528d30a9ef11ea91be7f259e1bd9ba', '答案', '答案', 478, 484, '<p>您需要登陆考勤网址：https://e-cology.beyondsoft.com，手动填写考勤（填写工作小时数：全勤为8小时）</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('574432b0bcd311eaa872912b9807cf65', '开始', '开始', 109, 54, '       \n              开始\n              \n              \n              \n              \n              \n              \n              ', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('5766a786df14422d8a89a113576f4aaa', '问题', '问题', 200, 200, '羟苯磺酸钙胶囊', '803e8e252998477ab3feee3bde453583');
INSERT INTO `node` VALUES ('57df6140bcd311eaa872912b9807cf65', '问题', '问题', 177, 37, '<p>住：主播住哪里</p>', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('5a01e9c0a96411ea8a7e11d4ec826f36', '选项', '选项', 578, 364, '<p>请问您想咨询哪个地方的婚假/奖励假政策？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('5a42d680d23911eaaa2207ad01666ef1', '答案', '答案', 533, 554, 'It has been recorded and the customer service personnel will contact you as soon as possible.', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('5aec94a0c01d11eab1dd2bae4f3c75e3', '答案', '答案', 406, 341, '<p>可通过电子税务局、自主办税终端、广东税务微信公众号等开具电子版完税证明（电子税票），也可以到办税服务厅前台开具纸质版完税证明。</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('5cf0fbb0c01311ea9c95a96aec82f490', '答案', '答案', 347, 387, '<p>企业个体所属行业的确定，请按照统计口径进行分类</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('5dd81ef0c0e511eabc5cbf4ccf21b331', '答案', '答案', 576, 370, '如果已经经过税局测算的企业，有机会进行重新组合', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('5e5bd760bcd311eaa872912b9807cf65', '选项', '选项', 281, 89, '<p>可人儿，住你心里~😀点了关注，随时到达</p>', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('5e8dda80a96411ea8a7e11d4ec826f36', '选项', '选项', 737, 98, '<p>请问您想咨询哪个地方的产假政策？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('5f402770bcd411eaa872912b9807cf65', '选项', '选项', 297, 48, '<p>虽然自己碗里有，可我也想吃主播碗里的</p>', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('5f747bd0c01f11eab1dd2bae4f3c75e3', '问题', '问题', 191, 23, '<p>企业购房奖励补贴的申请条件和自由办公用房的解释</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('5f81217a83e94ad79875435ed8137edb', '↵                开始', '↵                开始', 100, 100, '↵                开始', 'ae494584044449fd898edbeb54565509');
INSERT INTO `node` VALUES ('5fddebc09d244317b5afce8fb6f182ac', '↵                结束', '↵                结束', 500, 500, '↵                结束', 'ae494584044449fd898edbeb54565509');
INSERT INTO `node` VALUES ('602a5e50c01f11eab1dd2bae4f3c75e3', '选项', '选项', 309, 40, '<p>请问您想咨询以下哪类企业购房奖励补贴的问题，回复数字获得答案<br>1.联合申报企业中有企业有自有房产，可以申请办公用房补贴吗？<br>2.购地建设办公用房是否属于企业购房奖励？<br>3.办公用房配套设施包括哪些？<br>4.厂房，仓库算自有办公用房吗？</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('60a70630b16a11ea84abb32d92922ac7', '答案', '答案', 785, 817, '<p>请咨询HR部门。</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('611d10e0a96411ea8a7e11d4ec826f36', '选项', '选项', 992, 4, '<p>请问您想咨询哪个地方的陪产假政策？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('6278e230c01f11eab1dd2bae4f3c75e3', '开始', '开始', 91, 20, '    \n              开始\n              \n              \n              \n              ', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('63982ba0d23811eaaa2207ad01666ef1', '开始', '开始', 119, 47, ' \n              开始\n              ', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('6408d3d0b13311eaac8147578f007e03', '答案', '答案', 1605, 505, '<p>员工入职签署的劳动合同，一般需15-20天后才能加盖好公司公章，具体请咨询各地HEAR Team人员。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('644cfcb0d23811eaaa2207ad01666ef1', '问题', '问题', 215, 42, '家政相关咨询', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('65b36d60c01711eab1dd2bae4f3c75e3', '答案', '答案', 405, 457, '<p>以企业及其关联企业和分支机构联合申报的，原则上没禁止以下属企业为申报主体，但建议由股权关系最顶层的企业来做为申报主体。</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('6610a100a9fc11eab79cab3001cc087d', '答案', '答案', 544, 638, '<p>员工因岗位及公务需要使用移动通讯工具所发生的通讯费用；需报销人员需在OA系统填写《员工通讯费备案申请》进行备案申请，填写报销原因，手机号码，有效期限，报销额度，经批准后方生效。当备案内容发生变化应重新提交申请。每月凭运营商开具的月结发票在备案限额内进行报销，姓名须与备案号码，姓名一致，每月报销额度不跨月，不累计，需逐月在额度内报销。每月15日之前入职的员工及每月15日之后离职的员工可以报销当月通讯费。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('66505e90a9fb11eab79cab3001cc087d', '答案', '答案', 314, 454, '<p>周一到周五20:30以后及节假日因工作需要产生的餐费，员工凭实际发生的票据在标准内报销；上限标准为：北上广深等一线城市30元/人.餐；其他地区20元/人.餐</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('67be99c0b13c11eaac8147578f007e03', '答案', '答案', 1462, 897, '<p>产检生育保险所需材料：<br>1、收费票据（开药处方，明细单及发票）<br>2、结婚证复印件<br>3、诊断证明（带有分娩方式及孕周数的，需加盖医院章）<br>4、服务单或准生证复印件<br>5、外地生产还需当地医院开具的等级证明（加盖医院章）；个人声明（公司模板，公章）<br>个人声明申请方法：<br>请登录公司OA系统，新建流程--用章审批流程--公章审批流程（需在流程当中的用章信息摘要里备注上使用公司模板及开具个人声明的原因）<br>注：自生产之日最长一年内可报，每月15日可提交至北京博彦大厦一层红领巾会议室FESCO相关人员。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('6820cd50bcc911ea9ce23960bec20268', '选项', '选项', 331, 414, '<p>想要我的联系方式，请先给主播关注并打赏哦~</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('692f7590a9ee11ea91be7f259e1bd9ba', '选项', '选项', 231, 492, '<p>请问您想咨询<br>1.BYSDN网站地址<br>2.怎么完成“安全培训”<br>3.安全培训是否通过考核</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('69bb4460a9fa11eab79cab3001cc087d', '答案', '答案', 150, 531, '<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200622100922753487f3-2580-4c78-80d3-e6ddd50da151.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('6c6a5e10a96611ea8a7e11d4ec826f36', '答案', '答案', 1026, 749, '<p>根据《陕西省实施女职工劳动保护特别规定》，<br>Ⅰ 正式女员工妊娠4个月以下流产的，享受产假15天；<br>Ⅱ 妊娠4个月不满7个月流产的，享受产假为42天；<br>Ⅲ 妊娠满7个月以上终止的，符合国家生育规定的，享受产假98天。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('6cca8130a9ef11ea91be7f259e1bd9ba', '答案', '答案', 515, 501, '<p>每月22号为当月考勤周期（具体见OA系统-个人门户-右上角通知）需填写当月整月工时，检查上月周期后22-30号工时。如考勤周期后（22号后）当月工资正常发放，次月工资将会回算扣除请假多发工资。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('6d6a57c0a9fc11eab79cab3001cc087d', '答案', '答案', 611, 648, '<p>需报销人员需在OA系统填写《员工通讯费备案申请》进行备案申请，填写报销原因，手机号码，有效期限，报销额度，经批准后方生效。当备案内容发生变化应重新提交申请。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('6d8d8ab0bcd511eaa872912b9807cf65', '答案', '答案', 217, 405, '<p>上班路上注意安全凹</p>', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('6e504e50c01e11eab1dd2bae4f3c75e3', '答案', '答案', 787, 198, '<p>按入库期，最终以税务机关复核数据为准</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('6ef33b40a85b433b85468a360b87e364', '↵                结束', '↵                结束', 500, 500, '↵                结束', '803e8e252998477ab3feee3bde453583');
INSERT INTO `node` VALUES ('6f9e7a80d23811eaaa2207ad01666ef1', '选项', '选项', 297, 52, 'Do you want to inquire about housekeeping? You may directly reply to the number questions?&nbsp;<br>1. Recruitment&nbsp;<br>2. Customer Service', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('70d53110bcd411eaa872912b9807cf65', '答案', '答案', 158, 368, '<p>我那么优秀，可以自己做，但肯定你做的更好吃</p>', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('71da9540c01811eab1dd2bae4f3c75e3', '答案', '答案', 750, 364, '<p>以下三种情况，请留意为不能合并进行联合申报<br>Ⅰ.B公司与C公司为关联企业，C公司如果不在广州，以B公司为申报主体，C公司在广州有下属企业D（控股公司或分支机构）不能进行合并申报<br>Ⅱ.A公司拥有B、C两家控股公司，C不在广州，C下属有D公司（控股公司或分支机构）在广州，不能进行合并申报<br>Ⅲ.关联企业申报，控股比例要求50%或以上，是否能间接控股？以上市公司B为申报主体，集团A对其控股44%，但通过别的全资子公司C对B控股14%，实为间接控股58%，则B能否与A的另外几家控股企业DE以关联企业组合申报？申报主体对下属公司控股41%，但是实际控制人，这样的情况也不能合并</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('729052c0bccd11eaa872912b9807cf65', '开始', '开始', 83, 35, '          \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('732d07f0bccd11eaa872912b9807cf65', '问题', '问题', 164, 37, '<p>衣:喜欢主播的衣服妆容和身材</p>', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('737c5a40a96211ea8a7e11d4ec826f36', '开始', '开始', 53, 13, '                                      \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('74c559f0a9ef11ea91be7f259e1bd9ba', '答案', '答案', 570, 527, '<p>OA系统-个人门户-右上角通知-考勤周期，如考勤节点当天入职，工时不用填写，次月周期时补填。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('76c10bb0a96711ea8a7e11d4ec826f36', '答案', '答案', 1438, 476, '<p>自婴儿出生之日起，每天1小时，共计365小时。需在OA流程中提供孩子出生证明扫描件。哺乳假期间薪资不变 <br><strong>申请方法：</strong><br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传出生证明），待定额假期完成后，在提交员工请假流程即可。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('77d4e980a96311ea8a7e11d4ec826f36', '答案', '答案', 191, 590, '<p>Ⅰ 员工因个人原因不能正常上班，且无其他休假定额可用，可申请事假<br>Ⅱ 事假不得连续超过30天或1年内累计超过30天<br>Ⅲ 事假期间待遇：事假期间无薪资<br><strong>申请方法：</strong><br>请登录公司“OA系统-新建流程-考勤管理-员工请假流程来申请事假</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('78d055f0a96211ea8a7e11d4ec826f36', '问题', '问题', 159, 4, '<p>公司假期相关政策：婚假、年假、事假等</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('79aed9a0a96311ea8a7e11d4ec826f36', '答案', '答案', 289, 540, '<p>Ⅰ &lt;=1天无需提供病假条<br>Ⅱ 1&lt;X&lt;=3天，需在考勤周内提交病假条给考勤员<br>Ⅲ &gt;3天，进入医疗期，每周提供诊断证明及病假证明。<br>* 如果需要医疗期协议，请联系当地助理。<br><strong>病假薪资核减方法：</strong> <br>a、病假期间：<br> 病假核减额=工资日标准*0.5*病假天数<br> 工资日标准=工资月标准/21.75<br>b、医疗期期间待遇：<br> 医疗期工资不低于当地最低工资标准的80%</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('79e918f0a96211ea8a7e11d4ec826f36', '选项', '选项', 319, 2, '<p>请问您想咨询哪个假期类别？<br>1. 年假<br>2. 司龄假<br>3. 事假<br>4. 病假<br>5. 丧假<br>6. 调休<br>7. 婚假<br>8. 产假/孕检假/生育假/流产假<br>9. 哺乳假<br>10. 陪产假</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('7a8b1f20d30011ea87de4f72b22c127f', '结束', '结束', 417, 742, '  \n              结束\n              \n              ', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('7aace8b0a96311ea8a7e11d4ec826f36', '答案', '答案', 358, 591, '<p>Ⅰ 公司正式员工的直系亲属（父母、岳父母、公婆、配偶、子女）去世时，享有3个工作日丧假；公司员工的旁系亲属去世时，享有1个工作日的丧假；<br>Ⅱ 员工申请丧家须说明与去世者关系，丧家须在亲人去世一个月内一次性休完；<br>Ⅲ 丧家期间工资不变 <br><strong>申请方法：</strong><br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传死亡证明；火化证明，并在签字意见中写清与去世者的关系），待定额假期完成后，在提交员工请假流程即可</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('7afa6e70bcd511eaa872912b9807cf65', '答案', '答案', 353, 412, '<p>不知道你的是不是玛莎拉蒂</p>', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('7b16bd7eebea438e82e3497b2e2ba0e7', '答案', '答案', 300, 300, '镇痛药洛索洛芬钠片乐松<strong>用于</strong><br />1.类风湿性关节炎、骨性关节炎、腰痛症、肩关节周围炎、颈肩腕综合征、牙痛的消炎和镇痛。<br />2.手术后，外伤后、及拔牙后的镇痛和消炎。<br />3.急性上呼吸道炎的解热和镇痛。', '20ac7c045eeb49f6bb6e835804087977');
INSERT INTO `node` VALUES ('7b419710a9f111ea91be7f259e1bd9ba', '选项', '选项', 727, 402, '<p>小彦明白了，您想问的是社保公积金相关事宜。那请问您的办公地在哪个城市呢？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('7b95fd10bcd311eaa872912b9807cf65', '答案', '答案', 225, 410, '<p>我来自火星</p>', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('7bded4a0bccd11eaa872912b9807cf65', '选项', '选项', 275, 58, '<p>谢谢亲爱的喜欢我们主播！点关注让她更喜欢你呀❤</p>', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('7c6e5bb0bcd311eaa872912b9807cf65', '答案', '答案', 400, 410, '<p>我是买不起房的可怜人QAQ</p>', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('7eca1350d23a11eaaa2207ad01666ef1', '答案', '答案', 814, 377, '<strong>Green Court Phase I</strong><br><img src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/20200730160045b8022398-9742-4271-a1a6-f9e4676542f7.jpg\" alt=\"\" width=\"375\" height=\"220\"><br>Green Court phase I is the most charmful school apartments of <strong>Chicago construction style</strong>. Large vertical windows, column structure and convex roof form the significant medieval architecture symbol, while retaining the independence residential courtyard and large free space division architectural characteristics, which formed a strong architecture morphology of classical school. The project covers an area of<strong> 61,000</strong> square meters with more than 300 sets of apartments, and all of them are American large flat layer over<strong> 200 square meters</strong> .', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('7f754960a96711ea8a7e11d4ec826f36', '答案', '答案', 1525, 492, '<p>上海地区的哺乳假<br>Ⅰ 公司正式女员工子女不满１周岁的，每个工作日内可有两次哺乳时间，每次 30 分钟；多胞胎生育的，每多哺乳１个婴儿，每次哺乳时间增加 30 分钟；<br>Ⅱ 同一工作日的两次哺乳时间可以合并使用，其它情况不可以合并使用，哺乳时间算作劳动时间；<br>Ⅲ 员工须在 OA 系统提交哺乳假的假别定额申请流程，并按要求上传子女出生证明资料，定额配置后可请休哺乳假。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('7f837af0a9fb11eab79cab3001cc087d', '选项', '选项', 448, 451, '<p>因业务需要发生的交通费用经领导批准后可以报销：<br>Ⅰ因公外出办事的交通费；<br>Ⅱ周一至周五20:30以后及节假日因工作需要产生的交通费；根据发票实报实销，须逐笔详细写明乘车时间、起讫地点、事由等方能报销，滴滴出行开具的发票，需提供行程单。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('80781030a96311ea8a7e11d4ec826f36', '答案', '答案', 438, 462, '<p>Ⅰ 按政策要求申报、并获批准为按\"加班补休”方式补偿加班时数的正式员工，自获批准后的实际加班次日起半年内可享有相应小时的加班补休；<br>Ⅱ 如因工作原因无法安排补休的，可延期一次，延期不得超过180天；<br>Ⅲ 加班补休期间工资不变</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('80e91a20a96611ea8a7e11d4ec826f36', '选项', '选项', 794, 451, '<p>1、公司正式女员工，符合国家及上海市有关生育政策的，产假为 98 天，遇法定节假日不顺延：其中产前休假 15 天；难产的，增加产假 15 天；多胞胎生育的，每多生育一个婴儿，增加产假 15 天；</p>\n<p>2、本市公司女员工，怀孕未满 4 个月流产的，享受产假 15 天（依据医院开具的诊断证明），怀孕满 4 个月流产的，享受产假为 42 天；</p>\n<p>3、员工请产假前须在 OA 系统提交产假的假别定额申请流程，并按照要求上传《诊断证明》、《出生医学证明》等资料。定额配置后可请休产假，产假最早不得早于产前15 天，最晚不得晚于生产当天，遇节假日不顺延。</p>\n<p>4、女员工须在生产后 80 天内，或流产后 15 天内，向人力资源部提交医院诊断证明原件、结婚证等资料；</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('80f456e0c0e211eabc5cbf4ccf21b331', '选项', '选项', 307, 50, '请问您想咨询以下哪类申请材料的相关问题，回复数字获得答案<br>1.表格锁定或需要密码以启用宏保护<br>2.企业提交的电子版材料包括哪些？<br>3.材料如何编页码？<br>4.企业信息表需要同时有法人签字和加盖公章吗？<br>5.如果不符合行业划分，有机会重新组合吗？<br>6.表格内容显示不完整<br>7.打印和装订要求<br>8.申请资料哪些需要盖章', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('811edab0a96711ea8a7e11d4ec826f36', '答案', '答案', 1618, 525, '<p>自婴儿出生之日起，每天1小时，共计365小时。需在OA流程中提供孩子出生证明扫描件。哺乳假期间薪资不变 <br><strong>申请方法：</strong><br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传出生证明），待定额假期完成后，在提交员工请假流程即可。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('813980d0c01f11eab1dd2bae4f3c75e3', '答案', '答案', 207, 327, '<p>总部企业（如为联合申报的，则为申报主体、关联企业及下属控股企业）在广州市内拥有其它自有产权办公场所的，不得申请租赁及购置办公用房补贴。本补贴申请对象为无自有办公用房的企业（如为联合申报，则奖励主体为申报主体）于2018年租用或购买的办公用房。<br>联合申报企业中只要有自有房产的，都没法申请办公用房补贴哦。</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('818e5340bccc11ea9ce23960bec20268', '问题', '问题', 274, 184, '<p>来自火星的朋友送了一个小星星、跑车、火箭</p>', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('82a616f0a96711ea8a7e11d4ec826f36', '答案', '答案', 1690, 549, '<p>自婴儿出生之日起，每天1小时，共计365小时。需在OA流程中提供孩子出生证明扫描件。哺乳假期间薪资不变 <br><strong>申请方法：</strong><br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传出生证明），待定额假期完成后，在提交员工请假流程即可。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('82dc8270c01f11eab1dd2bae4f3c75e3', '答案', '答案', 308, 406, '<p>企业购房奖励只限于奖励购置办公用房（如写字楼），购地进行建设的不属于奖励范畴。</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('82e181f0aa1a11ea8f321fde55a346bf', '答案', '答案', 931, 741, '<p>Ⅰ 需提供结婚证，诊断证明，孕检计划表。<br>Ⅱ 孕检假发放全薪。<br>Ⅲ 申请孕检假的方法：<br> 申请孕检假需向项目经理邮件申请（附上以上所需材料，抄送考勤员），在OA系统中提交流程，新建流程--考勤管理--假别定额申请流程（需上传以上材料）等定额流程归档后方可提交请假流程。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('83943020c01311ea9c95a96aec82f490', '答案', '答案', 464, 360, '\n              回答', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('83d169c0c01f11eab1dd2bae4f3c75e3', '答案', '答案', 407, 323, '<p>办公用房配套设施包括车库、仓库、工厂、健身房、活动中心、饭堂、宿舍等</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('84b53d010485448e80b74aad9842357b', '问题', '问题', 200, 200, '消炎镇痛药洛索洛芬钠片乐松', '20ac7c045eeb49f6bb6e835804087977');
INSERT INTO `node` VALUES ('84ce9080bcd411eaa872912b9807cf65', '答案', '答案', 328, 364, '<p>烤一个</p>', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('85052ed0c01f11eab1dd2bae4f3c75e3', '答案', '答案', 541, 324, '<p>厂房、仓库均不属于办公用房</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('87e63940c02011eab1dd2bae4f3c75e3', '选项', '选项', 579, 50, '<p>请问您想咨询<br>1.企业购房补贴<br>2.企业租房补贴</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('88b803e0bccd11eaa872912b9807cf65', '答案', '答案', 96, 382, '<p>喜欢主播的衣服，快问问主播有没有挂链接</p>', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('8a163c245a624075ba9489b5d6161906', '↵                结束', '↵                结束', 500, 500, '↵                结束', '8bed108da3ac46fd9ac0f443d2d03e9a');
INSERT INTO `node` VALUES ('8b1d1d00bccd11eaa872912b9807cf65', '答案', '答案', 210, 396, '<p>我也钟意主播的颜，快问问她美颜秘笈</p>', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('8b7ca880bcd511eaa872912b9807cf65', '答案', '答案', 456, 406, '<p>大家都是做几个亿的交通工具出行的人</p>', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('8d73916652dd4131bf5c322608d90e19', '↵                开始', '↵                开始', 100, 100, '↵                开始', '20ac7c045eeb49f6bb6e835804087977');
INSERT INTO `node` VALUES ('8da91be0bcc911ea9ce23960bec20268', '答案', '答案', 216, 797, '<p>你要电话嘛？匪警请拨110，火警请拨119，看病请拨120，查号请拨114😂</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('9207a4b0b13c11eaac8147578f007e03', '选项', '选项', 1412, 540, '<p>请问您想咨询生育津贴还是生育保险？<br>1.生育津贴报销所需材料<br>2.产检生育保险所需材料</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('920ad5ceebf34c319a99acd10fb7b942', '↵                开始', '↵                开始', 100, 100, '↵                开始', '8bed108da3ac46fd9ac0f443d2d03e9a');
INSERT INTO `node` VALUES ('92ae5b50bcc911ea9ce23960bec20268', '答案', '答案', 320, 838, '<p>先刷火箭后加V</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('94123110bcc911ea9ce23960bec20268', '答案', '答案', 453, 825, '<p>企鹅最近有麻烦了，你还要么？</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('951f3470a96611ea8a7e11d4ec826f36', '答案', '答案', 873, 714, '<p>依照孕检计划表，公司正式女员工怀孕期间，在劳动时间内进行产前检查，应当算作劳动时间。孕检假原则上不超过 120 小时；</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('95b6b950bcc911ea9ce23960bec20268', '答案', '答案', 559, 797, '<p>伦家声音不会抖~</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('964fee00a9ef11ea91be7f259e1bd9ba', '结束', '结束', 1280, 1058, '                   \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('966bcfe0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 162, 861, '<p>BYSDN安全培训网站网址：https://bysdn.beyondsoft.com</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('967c5ef0c01911eab1dd2bae4f3c75e3', '答案', '答案', 885, 308, '<p>Ⅰ.关联企业控股人可以为自然人<br>Ⅱ.只能直接控股，关联企业申报，控股比例要求50%或以上</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('9930b0e0c01611eab1dd2bae4f3c75e3', '答案', '答案', 210, 463, '<p>Ⅰ.联合申报按照纳税关系分区，如该企业跨A区和B区，因此应属跨区联合申报。直接报市发改委。<br>Ⅱ.联合申报企业 如2018年母公司和子公司同在A区，2018年子公司改变注册地在B区，也属于联合申报，直接报市发改委。</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('999cd050bccd11eaa872912b9807cf65', '答案', '答案', 359, 383, '<p>身体好才是真的好，快问问主播的维密配方</p>', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('9a4e2aa0c01d11eab1dd2bae4f3c75e3', '答案', '答案', 514, 334, '<p>“纳税总额已含预缴税费”为咨询国税的答复，只关注纳税总额即可</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('9b617e20c01711eab1dd2bae4f3c75e3', '答案', '答案', 528, 425, '<p>联合申报盖章要求：统一盖申报主体的章即可。</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('9bed8af0a9f111ea91be7f259e1bd9ba', '答案', '答案', 722, 669, '<p>北京社保公积金转移流程，请联系专业HR</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('9dbc0860a9fc11eab79cab3001cc087d', '选项', '选项', 697, 388, '<p>个人因工作需要，可以申请借款日常借款，申请人需在OA系统上提交借款申请，写明符合公司规定的借款用途，经相关负责人批准后，方可支付；借款应在三个月内及时清还或以报销冲抵</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('9e427770a9f111ea91be7f259e1bd9ba', '答案', '答案', 770, 681, '<p>上海社保公积金转移流程:转上海，1.封存&nbsp;2.提供新单位的名称和公积金账号，专业HR会为您操作</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('9ed45990c01e11eab1dd2bae4f3c75e3', '结束', '结束', 673, 652, '  \n              结束\n              \n              ', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('9fa9dd60a9f611ea91be7f259e1bd9ba', '答案', '答案', 800, 684, '<p>Ⅰ 公司正式女员工符合国家及上海市有关生育政策的，可享受生育假 30 天，生育 假需在产假之后且合并连续使用，遇法定节假日顺延； <br>Ⅱ 生育假期间工资同产假工资政策。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('a0758410a9f111ea91be7f259e1bd9ba', '答案', '答案', 816, 676, '<p>西安员工，请咨询社保专员，谢鲁莹<a href=\"mailto:xieluying01@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">xieluying01@beyondsoft.com</a>， <a href=\"tel:02981105576\">029-81105576-8070</a></p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('a0accf70a9eb11ea91be7f259e1bd9ba', '选项', '选项', 281, 49, '<p>请问你想咨询离职相关哪些事宜？<br>1.离职流程申请<br>2.离职年假处理</p>', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('a2dd8360a9f111ea91be7f259e1bd9ba', '答案', '答案', 865, 701, '<p>苏州社保公积金转移流程：请联系专业HR</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('a37d19d0a96411ea8a7e11d4ec826f36', '选项', '选项', 1492, 86, '<p>请问您想咨询哪个地方的哺乳假政策？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('a50f8d50a9eb11ea91be7f259e1bd9ba', '答案', '答案', 174, 367, '<p>按照公司规定正式员工本人意愿提出离职，需提前一个月发出邮件申请（实习生-10天/试用期员-3天）；DM同意离职确认离职时间；OA系统发起“人员离职审批流程”。离职流程限制只能发起一次，不能重复提交。</p>', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('a52f711b083149158ca2ab96529d91cc', '↵                结束', '↵                结束', 500, 500, '↵                结束', '8985681322e14a5d86e3a9c2e6afc2b9');
INSERT INTO `node` VALUES ('a56efea0c0e511eabc5cbf4ccf21b331', '答案', '答案', 748, 335, 'Ⅰ.申请表要求双面打印，其他的无硬性要求；<br>Ⅱ.建议材料进行胶装，材料少的可选择骑马钉或其他装订办法；材料多的可视实际情况进行分册装订。切记不要使用活页夹等方式整理材料，以免审核过程中导致资料缺失。<br>Ⅲ.建议书脊上加注“2019年广州市总部企业认定与奖励+企业名称”。', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('a6234740a9eb11ea91be7f259e1bd9ba', '答案', '答案', 278, 364, '<p>已享有年假的员工与公司解除或终止劳动合同时，应休年假天数应按照员工在当年度在公司已工作日历天数折算，折算后不足一整天的部分不计入为年假天数。（员工在当年度在公司已工作日历天数➗365天）*员工本人在当年度应当享受的年假天数。举例：7/1离职员工，有年假5天，司龄2天，可休年假=（7*30天/365）*7=4，可休年假4天.</p>', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('a71a7880a9eb11ea91be7f259e1bd9ba', '答案', '答案', 430, 373, '<p>经项目组同意离职并确定离职时间后，提前3-7天OA系统申请“人员离职审批流程”。离职流程限制只能发起一次，不能重复提交。离职当天计算工资，可登陆OA系统查看流程审批至哪个节点，节点到员工关系处可以办理手续。</p>', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('a73ddf40bcd411eaa872912b9807cf65', '答案', '答案', 455, 353, '<p>真香</p>', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('ab94be70ab8a11ea97927907eed93ee0', '答案', '答案', 7, 991, '<p>名称：博彦科技股份有限公司<br>纳税人识别号：911100001021132178<br>地址、电话：北京市海淀区西北旺东路10号院东区7号楼（博彦科技大厦） 50965888<br>开户行及账号：中国建设银行上地支行11001045300056035398</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('ad4777d0c02011eab1dd2bae4f3c75e3', '选项', '选项', 725, 175, '<p>请问您想咨询以下哪类企业租房奖励补贴的问题，回复数字获得答案<br>1.租金补贴是否包含在租房补贴中？<br>2.租房申请表中的物业面积、自用办公用房面积有什么区别？<br>3.企业租房奖励认定时间范围<br>4.企业租房奖励对象<br>5.企业已购或在建但未投入使用的办公场地，能否申请办公用房租赁补贴？<br>6.企业连续三年享受办公用房补贴相关说明<br>7.</p>\n<p>&nbsp;</p>', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('af4a3430a9fc11eab79cab3001cc087d', '答案', '答案', 760, 660, '<p>公司不接受个人私事的借款，抱歉。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('b02c5bc9d6a34e83b5fbbcaf91acf494', '答案', '答案', 300, 300, '密码重置', '8985681322e14a5d86e3a9c2e6afc2b9');
INSERT INTO `node` VALUES ('b3869680ab8a11ea97927907eed93ee0', '答案', '答案', 73, 1008, '<p>名称：博彦科技（上海）有限公司<br>纳税人识别号：9131011577210650X7<br>地址、电话：中国（上海）自由贸易试验区学林路36弄11号101室 021-61656766<br>开户行及账号：建行张江分行31001523211050006272</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('b58ed6e0bcd311eaa872912b9807cf65', '结束', '结束', 331, 816, '       \n              结束\n              \n              \n              \n              \n              \n              \n              ', '4d71b67a3cdf4979a8a65b7a66db2e25');
INSERT INTO `node` VALUES ('b65d6180a9fb11eab79cab3001cc087d', '答案', '答案', 368, 752, '<p>私车公用交通费是指因工作需要，由员工本人提供个人车辆为公司所用而发生的费用；适用于总监及以上人员，销售人员、经常外出工作人员。报销人员需先在OA系统填写《员工私车公用备案申请表》进行申请，填写报销原因，每月报销额度，有效期限，经批准后发生效。凭发票在备案额度内进行报销。上限标准：</p>\n<p><img class=\"wscnph\" src=\"http://bys-kbs.southeastasia.cloudapp.azure.com:8081/upload/imgs/2020062210100214582840-8749-4a2e-8031-41de9b203c4e.png\"></p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('b88af680a96411ea8a7e11d4ec826f36', '答案', '答案', 504, 631, '<p>正式员工转正后可以享受婚假，员工在公司任职期间登记结婚的享有10天婚假，遇节假日不顺延（自领结婚证12个月内一次性休完） <br>申请方法： <br>发申请给自己的项目经理并抄送考勤员（需在邮件中附上结婚证扫描件）；并在OA系统中--新建流程--考勤管理--假别定额申请流程（需上传结婚证扫描件）等定额流程归档后方可提交请假流程。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('b8d5f02c34aa41fc8f00905f08f65750', '问题', '问题', 200, 200, '用户忘记密码进行重置', '8985681322e14a5d86e3a9c2e6afc2b9');
INSERT INTO `node` VALUES ('bb0a8960bcd411eaa872912b9807cf65', '结束', '结束', 281, 629, '  \n              结束\n              \n              ', '91b9067ac484464f8416e2e9d01057c1');
INSERT INTO `node` VALUES ('bb119990b13411eaac8147578f007e03', '选项', '选项', 292, 102, '<p>请问您想咨询以下哪类事项？<br>1. 实习生转正<br>2. 非实习生转正<br>3. 劳务合同变更</p>', '7a91ee330f03454c8b0eb64e4a08b04f');
INSERT INTO `node` VALUES ('bb2ce590b13b11eaac8147578f007e03', '选项', '选项', 1475, 229, '<p>请问您缴纳社保的所在地是哪里？<br>1. 北京<br>2. 上海<br>3. 西安<br>4. 苏州</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('bb77a440a96611ea8a7e11d4ec826f36', '选项', '选项', 964, 439, '<p>产假为128天，遇节假日不顺延：其中产前可提前15天休假，难产（剖腹产）可增加产假15天；多胞胎生育，每多生育一个婴儿，可增加产假15天。 <br>申请产假所需材料： <br>1、婴儿出生前申请：<br> 结婚证；诊断证明（注有预产期）；生育服务单。<br>2、婴儿出生后申请：<br> 结婚证；诊断证明（注有分娩方式）；生育服务单；婴儿出生证明 <br>申请方法：<br>请登录公司OA系统，新建流程--考勤管理--假别定额申请流程（须上传上述材料），待定额假期完成后，在提交员工请假流程即可</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('bd7ab200c0e511eabc5cbf4ccf21b331', '答案', '答案', 974, 332, 'Ⅰ.封面、申请表中有“填报单位（盖章）”部分必须加盖完整公章。每类材料首页可加盖完整公章，此类材料加盖骑缝章。<br>Ⅱ.一定要确保封面和申请表中“申报单位（盖章）”的地方要盖上，签名承诺的签上，其他的盖章方式没有严格要求，请根据企业材料情况自行决定。<br>Ⅲ.统一加盖申报主体公章即可。', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('bf971e90ab8a11ea97927907eed93ee0', '答案', '答案', 137, 1033, '<p>公司名称：西安博彦信息技术有限公司<br>税 号：916101315660189203<br>开户行：招行枫林绿洲支行<br>账 号：129904935810802<br>注册地址：西安市高新区锦业一路国家服务外包示范基地二区IT孵化器11001<br>电话：029-68659333</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('bfbd9d40a96411ea8a7e11d4ec826f36', '答案', '答案', 558, 701, '<p>上海地区的员工<br>Ⅰ 公司员工在公司任职期间登记结婚享有 3 天婚假，遇节假日不顺延；另外可以增加婚假 7 天，遇法定节假日顺延。<br>Ⅱ 结婚证一年有效期内休完。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('c08348b0b12f11eaac8147578f007e03', '答案', '答案', 162, 773, '<p>部门内部换组请DM发邮件至 <a href=\"mailto:zhouyan@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">zhouyan@beyondsoft.com</a>，另需CC人员<a href=\"mailto:liuying11@beyondsoft.com\" target=\"_blank\" rel=\"noopener\">liuying11@beyondsoft.com</a>及西安HEAR相关人员；产假人员需提前15天发起调动流程。</p>\n<p>员工内部调动需由员工本人在OA系统发起流程。</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('c1d62e80b12f11eaac8147578f007e03', '答案', '答案', 224, 819, '<p>部门内部换组请DM发邮件至 zhouyan@beyondsoft.com，yinkun@beyondsoft.com，另需CC北京HEAR相关人员；产假人员需提前15天发起调动流程。员工内部调动需由员工本人在OA系统发起流程。</p>', 'e45a7d751a74414b88d3dc82bd66c863');
INSERT INTO `node` VALUES ('c1e9a500a96411ea8a7e11d4ec826f36', '答案', '答案', 619, 793, '<p>正式员工转正后可以享受婚假，员工在公司任职期间登记结婚的享有3个工作日，婚前检测的奖励10个工作日，遇节假日不顺延（自领结婚证12个月内一次性休完）</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('c2e18ea0ab8a11ea97927907eed93ee0', '答案', '答案', 197, 1054, '<p>企业名称：苏州博彦信息技术有限公司<br>税号：91320594088594033W<br>地址：苏州工业园区星湖街328号创意产业园7栋702单元<br>电话：0512-67909136<br>开户行名称：招商银行股份有限公司苏州分行 <br>账号：512904815310702</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('c41766c0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 245, 900, '<p>内部系统为BYSDN： https://bysdn.beyondsoft.com， 请及时登录并学习“Training-新员工培训-基础知识-安全培训”的相关内容，并完成 “OF SECURITY TEST”，进入“OF SECURITY TEST”后，在最上方“Lead邮箱”填入对应邮箱地址（咨询安全组同事）只有3次考试机会，3次中有1次完成满分100即可。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('c42ba5c0a96411ea8a7e11d4ec826f36', '答案', '答案', 670, 856, '<p>正式员工转正后可以享受婚假，员工在公司任职期间登记结婚的享有13天婚假，遇节假日不顺延（自领结婚证12个月内一次性休完） <br>申请方法： <br>发申请给自己的项目经理并抄送考勤员（需在邮件中附上结婚证扫描件）；并在OA系统中--新建流程--考勤管理--假别定额申请流程（需上传结婚证扫描件）等定额流程归档后方可提交请假流程。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('c92e5f00c01f11eab1dd2bae4f3c75e3', '结束', '结束', 277, 704, '    \n              结束\n              \n              \n              \n              ', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('ca854910bcd511eaa872912b9807cf65', '结束', '结束', 288, 698, '    \n              结束\n              \n              \n              \n              ', 'd58a95004efe43c0bc32b20c0b76606c');
INSERT INTO `node` VALUES ('cb6ddaa0c01211ea9c95a96aec82f490', '答案', '答案', 60, 361, '<p>关于企业是否需要重新认定，因总部政策是以企业上一年度税收等数据为认定条件，因此每年需重新认定。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('cc7b2380c0e411eabc5cbf4ccf21b331', '答案', '答案', 50, 400, '编辑表格方式：<br>Ⅰ、下载使用无保护表格；<br>Ⅱ、打开宏保护<br>a.下载VBA插件。<br>b.参考这个打开宏 https://jingyan.baidu.com/article/d3b74d641d3c3d1f77e609c9.html ； wps可以点击工具栏的开发工具，然后将宏安全性选到最低，再重新打开表格。<br>c. ALT＋F8，如果能弹出对话框的话，双击unprotect那项。', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('cd3644c0a9fc11eab79cab3001cc087d', '结束', '结束', 1121, 1310, '                                   \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('cfe789a0c01711eab1dd2bae4f3c75e3', '答案', '答案', 644, 411, '<p>Ⅰ联合申报中需要合并别家企业数据的，都属于联合申报；自身单体就合格的，可以单独申报；但是自身合格非要拉上下属企业的，也属于联合申报。<br>Ⅱ.如果已经合并报表了，就填合并报表数即可。<br>如合并企业范围与联合申报企业范围不一致，则建议分别提交自身的财务报表《利润表》《资产负债表》《现金流量表》，以便数据累加。由于合并财务报表中包含了多家企业的经营数据，故属于联合申报。</p>', 'da62a3ab61ed4f6494c5d89292d12c50');
INSERT INTO `node` VALUES ('d0416110c02511eab1dd2bae4f3c75e3', '答案', '答案', 65, 346, '<p>因总部政策是以企业上一年度税收等数据为认定条件，因此每年需重新认定。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d161aff0bcc911ea9ce23960bec20268', '答案', '答案', 648, 750, '<p>关注主播不迷路，主播求求你先关注~</p>', '04390ed6f99f477dac7d98d051dca6e1');
INSERT INTO `node` VALUES ('d22f4e60c02511eab1dd2bae4f3c75e3', '答案', '答案', 163, 351, '<p>一个集团可以组合成多个总部企业申报</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d378e560c02511eab1dd2bae4f3c75e3', '答案', '答案', 248, 345, '<p>企业个体所属行业的确定，按照统计口径进行分类</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d37b4150a96611ea8a7e11d4ec826f36', '答案', '答案', 1111, 769, '<p>本市公司女员工，怀孕未满 16周流产的，享受产假 15 天-30天（依据医院开具的诊断证明），怀孕满 16周流产的，享受产假为 42 天；女员工须在流产后 15 天内，向人力资源部提交医院诊断证明原件、结婚证等资料。</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('d3a4ed80c01c11eab1dd2bae4f3c75e3', '开始', '开始', 118, 44, '  \n              开始\n              \n              ', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('d3e2ace0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 360, 910, '<p>只有3次考试机会，3次中有1次完成满分100即可，满分不显示分数，不及格显示分数。</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('d48bf220c01c11eab1dd2bae4f3c75e3', '问题', '问题', 189, 50, '<p>纳税总额，纳税证明相关问题</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('d4c670c0c0e511eabc5cbf4ccf21b331', '结束', '结束', 628, 707, ' \n              结束\n              ', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('d4ca92b0c02511eab1dd2bae4f3c75e3', '答案', '答案', 305, 420, '<p>认定收入核算要求，按营业收入为准，如金融类企业，例如为基金类公司，主业是做金融投资的，也是按营业收入为准</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d60ee8a0c01c11eab1dd2bae4f3c75e3', '选项', '选项', 277, 63, '<p>请问您想咨询以下哪类税收相关的问题，回复数字获得答案<br>1.纳税总额的核算统计时间范围<br>2.企业纳税总额和常见可扣除的税费项<br>3.纳税证明打印<br>4.预缴税费是否涵盖在纳税总额<br>5.企业在不同区的纳税总额<br>6.企业开具的纳税证明要求</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('d67b01d0c02511eab1dd2bae4f3c75e3', '答案', '答案', 414, 366, '<p>《申请认定企业及有关企业信息表》中的“企业属性”可以手工录入。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d78df870c02511eab1dd2bae4f3c75e3', '答案', '答案', 491, 422, '<p>企业申请申报的注册资本达标资格</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d875a3c0bccc11ea9ce23960bec20268', '选项', '选项', 283, 481, '<p>感谢亲送来的礼物~比心</p>', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('d8e3eb80c02511eab1dd2bae4f3c75e3', '答案', '答案', 582, 364, '<p>经市委市政府重点引进的总部企业认定：如为跟区签订协议的企业，需由区向市政府行文请示，文中写明“享受市委市政府重点引进的总部企业政策”</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('d96a03b0b13811eaac8147578f007e03', '开始', '开始', 118, 80, '              \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('da22cc60b13811eaac8147578f007e03', '结束', '结束', 446, 1059, '                 \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('da535a00c02511eab1dd2bae4f3c75e3', '答案', '答案', 720, 353, '<p>现代物流业主要是区别于传统货运业，其主要特征是运用现代信息手段提高物流和供应链的效率。传统交通运输业不属于现代物流业，因此需按其他服务业：“营收5亿、纳税额1亿、注册资本500万”进行认定。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('da66f700bccd11eaa872912b9807cf65', '结束', '结束', 201, 644, '          \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '2d9020b2db9e46abb0e4382b2a054879');
INSERT INTO `node` VALUES ('db02b740bccc11ea9ce23960bec20268', '答案', '答案', 203, 838, '<p>感谢请送来的小星星</p>', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('db2e48f0b13811eaac8147578f007e03', '问题', '问题', 240, 112, '<p>公司备用区及信息安全的相关规定是什么</p>', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('db52ce20d23811eaaa2207ad01666ef1', '答案', '答案', 272, 346, 'If you need to find a temp house keeping, please contact <br>Tel:86-21-61059333', 'c20daf50ca85483598e16bb13c5115ca');
INSERT INTO `node` VALUES ('db5f72d0c02511eab1dd2bae4f3c75e3', '答案', '答案', 806, 369, '<p>市委、市政府认定的专题政策扶持才可认定申报</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('dc830b40c02511eab1dd2bae4f3c75e3', '答案', '答案', 896, 401, '<p>企业章程、验资报告、集团登记证需要下属企业和有独立法人的分支机构也出具，证明股权关系即可，不用全部提供，股权架构图由总公司出具即可<br>章程，集团登记证等都可以，可提供首尾及股权关系，后期审查时会网络查询，如发现不一致会要求企业提供详细证明。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('dc93b780bccc11ea9ce23960bec20268', '答案', '答案', 293, 832, '<p>谢谢哥哥送的跑车</p>', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('de915c40bccc11ea9ce23960bec20268', '答案', '答案', 412, 844, '<p>谢谢我家宝宝的大火箭，主播带你飞啊飞~~</p>', 'cabe2bb695704b4a94f0775d701d9351');
INSERT INTO `node` VALUES ('def1c150c02511eab1dd2bae4f3c75e3', '答案', '答案', 1014, 51, '<p>企业注册资本需按注册当年的汇率转换成人民币填写。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('e0534d20c02511eab1dd2bae4f3c75e3', '答案', '答案', 1206, 346, '<p>财务报表主要提供能反映营业收入、主营业务情况等财务数据的内容。包括：《利润表》《资产负债表》《现金流量表》</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('e22b0880a96a11ea8a7e11d4ec826f36', '答案', '答案', 53, 657, '<p>已享有年假的员工与公司解除或终止劳动合同时，应休年假天数应按照员工在当年度在公司已工作日历天数折算，折算后不足一整天的部分不计入为年假天数。（员工在当年度在公司已工作日历天数➗365天）*员工本人在当年度应当享受的年假天数。举例：7/1离职员工，有年假5天，司龄2天，可休年假=（7*30天/365）*7=4，可休年假4天.</p>', 'e0911f1790604654a9ff63a6d59b4e63');
INSERT INTO `node` VALUES ('e27d6470a9fd11eab79cab3001cc087d', '答案', '答案', 826, 369, '<p>北京团建费用每人每月20元，需按项目组人头算，可以提前半年一清（需DM申报）。<br>其它地区可以联系负责同事帮忙查询具体金额。</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('e3073da0a9ec11ea91be7f259e1bd9ba', '开始', '开始', 48, 29, '                   \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('e31b2710c02211eab1dd2bae4f3c75e3', '答案', '答案', 705, 457, '\n              回答', '3d91fcf9421a4ad9bc9abee8a00185aa');
INSERT INTO `node` VALUES ('e320d590a9eb11ea91be7f259e1bd9ba', '结束', '结束', 272, 687, '        \n              结束\n              \n              \n              \n              \n              \n              \n              \n              ', 'f2c2ef95e71441c2907a9d0be26eb6da');
INSERT INTO `node` VALUES ('e32e0b70c02511eab1dd2bae4f3c75e3', '答案', '答案', 1078, 319, '<p>Ⅰ.就业人数以年末社保人数统计<br>Ⅱ.企业联合申报总部企业的，总部企业从业人数指的是总部控股企业与下属企业从业人数的加总数。</p>', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('e4161590a9ec11ea91be7f259e1bd9ba', '问题', '问题', 124, 34, '<p>入职相关知识:账号，系统链接，邮箱登录地址，BYSDN网站，安全培训，WBS，考勤填写，社保转移，公章，在职证明，薪资异常</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('e6f82b10b13811eaac8147578f007e03', '选项', '选项', 435, 356, '<p>请问您想咨询什么内容？<br>1. 备用区规定<br>2. 安全规定</p>', '834f63a4ea3648599a77c7cf8df05fb5');
INSERT INTO `node` VALUES ('e95f732f77f445779ab9c1f69e22f72a', '↵                开始', '↵                开始', 100, 100, '↵                开始', '8985681322e14a5d86e3a9c2e6afc2b9');
INSERT INTO `node` VALUES ('edbe2420c01c11eab1dd2bae4f3c75e3', '答案', '答案', 162, 336, '<p>按入库期，最终以税务机关复核数据为准</p>', '7de844da15cf46c5b37385540a3a14d8');
INSERT INTO `node` VALUES ('eeadc340d2ff11ea87de4f72b22c127f', '答案', '答案', 196, 403, '【适应症】治疗原发性高血压。<br>本品用于单药治疗不能充分控制血压的患者。', 'de1e2b7f1a8f4690a29e71ca448856aa');
INSERT INTO `node` VALUES ('ef409120a9f111ea91be7f259e1bd9ba', '答案', '答案', 1013, 516, '<p>公司公章资料申请：OA系统-新建流程-用章审批流程-公章审批流程</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('f11d18168fd34857b4bb2340e3a99725', '问题', '问题', 200, 200, '企业并购重组奖励，是否需要有关部门出文件', 'ae494584044449fd898edbeb54565509');
INSERT INTO `node` VALUES ('f2f7be80d23a11eaaa2207ad01666ef1', '答案', '答案', 1411, 376, 'Green Court service apartment is the hotel service apartments especially in the service of Multi-National Corporation business elite in the short-term stay. There are 316 luxury decoration sets of housing with indoor facilities and balconies, which offers home service of a variety of menu style . The housing area with one room is about 64-78 square meters, and two rooms is 130-166 square meters, and three rooms is 154-200 square meters.', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('f69ac5d0c02611eab1dd2bae4f3c75e3', '结束', '结束', 631, 683, '          \n              结束\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', 'a7cd48c9efd24b879217d337402fb64d');
INSERT INTO `node` VALUES ('f6fe5140c0e411eabc5cbf4ccf21b331', '答案', '答案', 265, 438, '各区不一样，建议提供EXCEL表+申报文件扫描版（可不含证照）', '220c7d9d48844bc8a131811beaddfd36');
INSERT INTO `node` VALUES ('f702b030a9fd11eab79cab3001cc087d', '答案', '答案', 942, 417, '<p>员工因工作需要开展培训直接发生的各项费用支出，包括住宿费，伙食费，培训场地费，讲课费，培训资料费，交通费，其他费用等，与培训一起发生的相关费用，应与培训费一并进行报销，在OA系统内提交日常报销流程</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('f7f37d80d23911eaaa2207ad01666ef1', '开始', '开始', 183, 44, '  \n              开始\n              \n              ', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('f86b2890a9f711eab79cab3001cc087d', '开始', '开始', 70, 27, '                                     \n              开始\n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              \n              ', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('f90dee30d23911eaaa2207ad01666ef1', '问题', '问题', 254, 45, 'House', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('f9745b30a9f711eab79cab3001cc087d', '问题', '问题', 149, 47, '<p>日常、差旅、生育津贴等报销流程咨询</p>', '8f6ddef522c745708ba7bddf77d6bf28');
INSERT INTO `node` VALUES ('fc28e2f0a9ee11ea91be7f259e1bd9ba', '答案', '答案', 357, 526, '<p>WBS是每个项目组的代码，员工考勤&amp;报销必须选择对应的WBS。<br>由项目组的项目经理负责添加，具体请咨询项目经理.</p>', '3ffc293746964b38ae8b39087f9a5b1e');
INSERT INTO `node` VALUES ('fe2f8f40d23911eaaa2207ad01666ef1', '选项', '选项', 339, 56, 'Do you want to inquire about housing resources? You may directly reply to the number questions?&nbsp;<br>1. Villa&nbsp;<br>2. Apartment&nbsp;<br>3. Service Apt.&nbsp;<br>4. Talents Apt.&nbsp;', 'cc4748f66cf34a22bae6718c2eaf8194');
INSERT INTO `node` VALUES ('ff2961c0c0e411eabc5cbf4ccf21b331', '答案', '答案', 367, 419, '可盖页码章、手写页码或将材料汇编成PDF文档后自动生成页码。', '220c7d9d48844bc8a131811beaddfd36');

-- ----------------------------
-- Table structure for process
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `process_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_node` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `end_node` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `faq_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('04390ed6f99f477dac7d98d051dca6e1', '联系方式、手机、电话、微信、qq、邮箱、抖音号是多少？', '427e18f0bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '9715c8e4af5e481d811b4a17d1c232d6');
INSERT INTO `process` VALUES ('20ac7c045eeb49f6bb6e835804087977', '消炎镇痛药洛索洛芬钠片乐松', '8d73916652dd4131bf5c322608d90e19', '20a634a01b4c494b8de67ff5bd201a4e', '54c0a41d225e47d3b851f44c7a94b126');
INSERT INTO `process` VALUES ('220c7d9d48844bc8a131811beaddfd36', '材料提交过程中发生的问题：表格锁定，电子版材料，页码编写，公章要求，行业重新组合，法人，内容显示，打印和装订', '31a15520c0e211eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', '3ca89e0153e348a19fd30f6e1e055275');
INSERT INTO `process` VALUES ('2d9020b2db9e46abb0e4382b2a054879', '喜欢答谢', '729052c0bccd11eaa872912b9807cf65', 'da66f700bccd11eaa872912b9807cf65', 'd12b695aed904c3a8e86d58be3c0c8c5');
INSERT INTO `process` VALUES ('3d91fcf9421a4ad9bc9abee8a00185aa', '企业购房奖励补贴的申请条件和自由办公用房的解释', '6278e230c01f11eab1dd2bae4f3c75e3', 'c92e5f00c01f11eab1dd2bae4f3c75e3', '3e8ae076b0ab4940bf9d4b1940b6c24a');
INSERT INTO `process` VALUES ('3ffc293746964b38ae8b39087f9a5b1e', '入职相关知识:账号，系统链接，邮箱登录地址，BYSDN网站，安全培训，WBS，考勤填写，社保转移，公章，在职证明，薪资异常', 'e3073da0a9ec11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '5350f8b661e84fd69796a2f55cbcd6cb');
INSERT INTO `process` VALUES ('4d71b67a3cdf4979a8a65b7a66db2e25', '主播住哪里', '574432b0bcd311eaa872912b9807cf65', 'b58ed6e0bcd311eaa872912b9807cf65', '3d4ffd9caa494c8abdc3057544b7963c');
INSERT INTO `process` VALUES ('7a91ee330f03454c8b0eb64e4a08b04f', '员工按期或提前转正流程', '0f4e68e0a9f511ea91be7f259e1bd9ba', '44e6cec0a9f511ea91be7f259e1bd9ba', 'd84c952711294304b1d4fc5b3fc9a5a0');
INSERT INTO `process` VALUES ('7de844da15cf46c5b37385540a3a14d8', '纳税总额，纳税证明相关问题', 'd3a4ed80c01c11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '2a297e840b1c4170bbdae5ed62a1a33c');
INSERT INTO `process` VALUES ('803e8e252998477ab3feee3bde453583', '羟苯磺酸钙胶囊', '4c46257ce8754c4da07861296aefced4', '6ef33b40a85b433b85468a360b87e364', '2f0a7c8deabf4817baa2e8632c94b966');
INSERT INTO `process` VALUES ('834f63a4ea3648599a77c7cf8df05fb5', '公司信息安全的相关规定是什么', 'd96a03b0b13811eaac8147578f007e03', 'da22cc60b13811eaac8147578f007e03', '5f769f03b97746fdbb4e5fb21636a472');
INSERT INTO `process` VALUES ('8985681322e14a5d86e3a9c2e6afc2b9', '用户忘记密码进行重置', 'e95f732f77f445779ab9c1f69e22f72a', 'a52f711b083149158ca2ab96529d91cc', '75efe6709da34fa3ab726098685126a8');
INSERT INTO `process` VALUES ('8bed108da3ac46fd9ac0f443d2d03e9a', '黄氏响声丸', '920ad5ceebf34c319a99acd10fb7b942', '8a163c245a624075ba9489b5d6161906', '157db2cbbd7b43478d3a149c0659efb6');
INSERT INTO `process` VALUES ('8f6ddef522c745708ba7bddf77d6bf28', '日常和差旅报销流程咨询', 'f86b2890a9f711eab79cab3001cc087d', NULL, '86f1238daf384bb885a27f6aaf44a3f6');
INSERT INTO `process` VALUES ('91b9067ac484464f8416e2e9d01057c1', '食：是否做饭？', '4ce55cd0bcd411eaa872912b9807cf65', 'bb0a8960bcd411eaa872912b9807cf65', '019d2385add24c8bad5e8026ad72e5c3');
INSERT INTO `process` VALUES ('a7cd48c9efd24b879217d337402fb64d', '总部企业认定基本提问', '338923a0c00011ea9c95a96aec82f490', NULL, '589de948efbc4ec1b77f0b1bdd84ffa7');
INSERT INTO `process` VALUES ('ae494584044449fd898edbeb54565509', '企业并购重组奖励，是否需要有关部门出文件', '5f81217a83e94ad79875435ed8137edb', '5fddebc09d244317b5afce8fb6f182ac', '4e7018ae793b469ba3cf1e014fdae51e');
INSERT INTO `process` VALUES ('c20daf50ca85483598e16bb13c5115ca', '家政相关咨询', '63982ba0d23811eaaa2207ad01666ef1', '28d3cf00d23911eaaa2207ad01666ef1', '9d0b13bc5ec74698b7e23fa534ad27e9');
INSERT INTO `process` VALUES ('cabe2bb695704b4a94f0775d701d9351', '来自火星的朋友送了一个小星星、跑车、火箭', NULL, NULL, '6778028ba61d49ad8dd8e6663eb2c6ad');
INSERT INTO `process` VALUES ('cc4748f66cf34a22bae6718c2eaf8194', 'House', 'f7f37d80d23911eaaa2207ad01666ef1', '4f16d020d23b11eaaa2207ad01666ef1', '02ff5e4b63114b2994dad4346295b5fa');
INSERT INTO `process` VALUES ('d58a95004efe43c0bc32b20c0b76606c', '行：上班通勤', '297e4b20bcd511eaa872912b9807cf65', 'ca854910bcd511eaa872912b9807cf65', 'fbb847800a65419fa83bf70fe57e1665');
INSERT INTO `process` VALUES ('da62a3ab61ed4f6494c5d89292d12c50', '联合申报相关咨询', '067f9720c01611eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', 'df7518ce93774af9b2eb522d5cf7b46c');
INSERT INTO `process` VALUES ('de1e2b7f1a8f4690a29e71ca448856aa', '缬沙坦氨氯地平片(Ⅰ)', '3066d340d2ff11ea87de4f72b22c127f', '7a8b1f20d30011ea87de4f72b22c127f', '4665043405ec4bbcb09ff89f7bab5519');
INSERT INTO `process` VALUES ('e0911f1790604654a9ff63a6d59b4e63', '公司假期相关政策：婚假、年假、事假等', '737c5a40a96211ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '5ca00f914a194eee8202ffee3f4da7c7');
INSERT INTO `process` VALUES ('e45a7d751a74414b88d3dc82bd66c863', '员工项目组内部调动，跨公司调动流程', '06d099f0a9f411ea91be7f259e1bd9ba', '53159860a9f411ea91be7f259e1bd9ba', '96d2d65cc3d549c482ff70e438b7258c');
INSERT INTO `process` VALUES ('f2c2ef95e71441c2907a9d0be26eb6da', '请问你想咨询离职相关哪些事宜？,1.离职流程申请,2.离职年假处理', '4ef773b0a9eb11ea91be7f259e1bd9ba', 'e320d590a9eb11ea91be7f259e1bd9ba', 'c0462fc3db024ad192a5bddedf0b5472');

-- ----------------------------
-- Table structure for transition
-- ----------------------------
DROP TABLE IF EXISTS `transition`;
CREATE TABLE `transition`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `process_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `from_node_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `to_node_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `cond_expression` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `variable` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `source_anchor` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transition
-- ----------------------------
INSERT INTO `transition` VALUES ('001db5140c8b48459de832e0e1b4a574', 'e0911f1790604654a9ff63a6d59b4e63', '80e91a20a96611ea8a7e11d4ec826f36', '951f3470a96611ea8a7e11d4ec826f36', '@0==孕检', '孕检', '@0', 'Right');
INSERT INTO `transition` VALUES ('003256afbbc248d8b13e7e5280e0f566', 'e0911f1790604654a9ff63a6d59b4e63', 'bfbd9d40a96411ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('008bbc5069904ac8a78432d6d167141c', 'cc4748f66cf34a22bae6718c2eaf8194', 'fe2f8f40d23911eaaa2207ad01666ef1', 'f2f7be80d23a11eaaa2207ad01666ef1', '@0==3||@0==service||@0==服务公寓', '3|service|服务公寓', '@0', 'Right');
INSERT INTO `transition` VALUES ('00a0c146d3cd4fa582a59d415cc694fe', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', 'bb2ce590b13b11eaac8147578f007e03', '@0==10||@0==生育津贴||@0==生育保险||@0==生育金||@0==生育补助', '10|生育津贴|生育保险|生育金|生育补助', '@0', 'Right');
INSERT INTO `transition` VALUES ('03b700cc5b3d4acba6a1dd928a5a9370', 'f2c2ef95e71441c2907a9d0be26eb6da', '4ef773b0a9eb11ea91be7f259e1bd9ba', '52ef3ac0a9eb11ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('03f436ef1b9749d2a0e0e77cda07eda0', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', '5dd81ef0c0e511eabc5cbf4ccf21b331', '@0==5||@0==组合', '5|组合', '@0', 'Right');
INSERT INTO `transition` VALUES ('0440a782e4fc4ef68356606fbf73a360', 'e0911f1790604654a9ff63a6d59b4e63', 'd37b4150a96611ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0470ba1a5f3f410d94d8f6a7b0e0b9d6', 'e0911f1790604654a9ff63a6d59b4e63', 'b88af680a96411ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('04cdef2e3ed947a0b4a77569f757292d', 'e45a7d751a74414b88d3dc82bd66c863', '156eaab0a9f411ea91be7f259e1bd9ba', '32178ce0a9f411ea91be7f259e1bd9ba', '@0==2||@0==公司||@0==美国', '2|公司|美国', '@0', 'Right');
INSERT INTO `transition` VALUES ('04f280337aa84f6ea4477a47d102dc90', 'cabe2bb695704b4a94f0775d701d9351', 'd875a3c0bccc11ea9ce23960bec20268', 'db02b740bccc11ea9ce23960bec20268', '@0==小星星', '小星星', '@0', 'Right');
INSERT INTO `transition` VALUES ('059d06f1940246189a5cf8cee9f6655f', 'e0911f1790604654a9ff63a6d59b4e63', '5021c450a96611ea8a7e11d4ec826f36', '6c6a5e10a96611ea8a7e11d4ec826f36', '@0==流产', '流产', '@0', 'Right');
INSERT INTO `transition` VALUES ('078a0b3f56144b8db8ec7371e2bff1e4', 'cabe2bb695704b4a94f0775d701d9351', 'd875a3c0bccc11ea9ce23960bec20268', 'de915c40bccc11ea9ce23960bec20268', '@0==火箭', '火箭', '@0', 'Right');
INSERT INTO `transition` VALUES ('094fde8e866c483c9a71a237c10746ec', 'd58a95004efe43c0bc32b20c0b76606c', '4f3af020bcd511eaa872912b9807cf65', '6d8d8ab0bcd511eaa872912b9807cf65', '@0==上班', '上班', '@0', 'Right');
INSERT INTO `transition` VALUES ('097e8c648d7e4ae180f87af29a855b96', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', 'edbe2420c01c11eab1dd2bae4f3c75e3', '@0==1||@0==入库||@0==计算||@0==区间||@0==月', '1|入库|计算|区间|月', '@0', 'Right');
INSERT INTO `transition` VALUES ('0988ffb561da41049b317cf2e20072fa', '803e8e252998477ab3feee3bde453583', '1086081d9a9e461ca74db4ada13bdef8', '6ef33b40a85b433b85468a360b87e364', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('09d72d0dad594bdab7bb2d54fbbb704d', '3ffc293746964b38ae8b39087f9a5b1e', '6cca8130a9ef11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0a76a2e3e9884499b59b36d549e36a6a', '3ffc293746964b38ae8b39087f9a5b1e', '74c559f0a9ef11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0aeff6356d664906a8d3a702a6d08d66', '3ffc293746964b38ae8b39087f9a5b1e', '495c5580a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0c49fee76e394772813a1d920627b1b6', 'a7cd48c9efd24b879217d337402fb64d', 'd67b01d0c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0dba170b66e7492a905db8a4ebf49e6e', '3d91fcf9421a4ad9bc9abee8a00185aa', '5f747bd0c01f11eab1dd2bae4f3c75e3', '602a5e50c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('0e9af7f822754985a8fbffdeb7d2c860', 'e0911f1790604654a9ff63a6d59b4e63', '7aace8b0a96311ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0ec8deeac0b94935870bd3eef4fe38d9', '3ffc293746964b38ae8b39087f9a5b1e', '56528d30a9ef11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0f91f86676ce4ded889e9ea53e7a8263', '3ffc293746964b38ae8b39087f9a5b1e', '9bed8af0a9f111ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('0fbb50bd944b4df1a3a17fca13b55815', 'e0911f1790604654a9ff63a6d59b4e63', '951f3470a96611ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('10859f28f79b49b6a4b9096e67c8ec69', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '340736a0a9ee11ea91be7f259e1bd9ba', '@0==2||@0==OA||@0==办公系统', '2|OA|办公系统', '@0', 'Right');
INSERT INTO `transition` VALUES ('111d2a56c2f94171a87cb7ac8fa527d2', 'de1e2b7f1a8f4690a29e71ca448856aa', '17609dd0d30011ea87de4f72b22c127f', '7a8b1f20d30011ea87de4f72b22c127f', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('116175ecd42e4420b41c894b01fee0f0', '7de844da15cf46c5b37385540a3a14d8', 'd48bf220c01c11eab1dd2bae4f3c75e3', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('116439dde5f84e5ba1e8011608a61851', 'e0911f1790604654a9ff63a6d59b4e63', '611d10e0a96411ea8a7e11d4ec826f36', '0d384aa0a96711ea8a7e11d4ec826f36', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('1516e48cf0334b2ca4156a2920aa7ccc', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '2a537ac0c01d11eab1dd2bae4f3c75e3', '@0==2||@0==除了||@0==包含||@0==契税||@0==进口增值税||@0==残疾人就业金', '2|除了|包含|契税|进口增值税|残疾人就业金', '@0', 'Right');
INSERT INTO `transition` VALUES ('15547277bc9e4ac0be43b8709dd01b9f', '3ffc293746964b38ae8b39087f9a5b1e', '9e427770a9f111ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('17850cc6bb454188844d704dc1d6a51c', '7a91ee330f03454c8b0eb64e4a08b04f', '34979320b16a11ea84abb32d92922ac7', '44e6cec0a9f511ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('187a6ef8ce4149539db6496428686463', 'c20daf50ca85483598e16bb13c5115ca', '644cfcb0d23811eaaa2207ad01666ef1', '6f9e7a80d23811eaaa2207ad01666ef1', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('19c3748b5726499da307a088a6d1c751', 'e0911f1790604654a9ff63a6d59b4e63', '78d055f0a96211ea8a7e11d4ec826f36', '79e918f0a96211ea8a7e11d4ec826f36', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('1a301efc22064944a0d34a5bae72b5cd', 'e0911f1790604654a9ff63a6d59b4e63', '80e91a20a96611ea8a7e11d4ec826f36', '9fa9dd60a9f611ea91be7f259e1bd9ba', '@0==生育', '生育', '@0', 'Right');
INSERT INTO `transition` VALUES ('1a5b60f968644ea891f80406bc652d98', 'e0911f1790604654a9ff63a6d59b4e63', '5a01e9c0a96411ea8a7e11d4ec826f36', 'c42ba5c0a96411ea8a7e11d4ec826f36', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('1a702a9bd6ca4677887142fdcb3a23b4', 'e0911f1790604654a9ff63a6d59b4e63', '5e8dda80a96411ea8a7e11d4ec826f36', '5021c450a96611ea8a7e11d4ec826f36', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('1c29fee8d9a84e9aad52f97ecf2d0cb7', '3ffc293746964b38ae8b39087f9a5b1e', '7b419710a9f111ea91be7f259e1bd9ba', 'a0758410a9f111ea91be7f259e1bd9ba', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('1e1b6f481bf4411db9704be96f0a1657', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a0accf70a9eb11ea91be7f259e1bd9ba', 'a50f8d50a9eb11ea91be7f259e1bd9ba', '@0==1||@0==人员离职审批||@0==申请', '1|人员离职审批|申请', '@0', 'Right');
INSERT INTO `transition` VALUES ('1e33099ffc1f4d89b9196b03b5c75e9e', '91b9067ac484464f8416e2e9d01057c1', '5f402770bcd411eaa872912b9807cf65', 'a73ddf40bcd411eaa872912b9807cf65', '@0==好吃', '好吃', '@0', 'Right');
INSERT INTO `transition` VALUES ('1e36f756e5a8455a97f36f157aefbb17', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', 'ff2961c0c0e411eabc5cbf4ccf21b331', '@0==3||@0==页码', '3|页码', '@0', 'Right');
INSERT INTO `transition` VALUES ('1e85783c44f34a61b61fb1eb779c296b', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', 'ef409120a9f111ea91be7f259e1bd9ba', '@0==8||@0==公章', '8|公章', '@0', 'Right');
INSERT INTO `transition` VALUES ('1ed8228b14674ad5a13c6c7168b0c2e1', '3ffc293746964b38ae8b39087f9a5b1e', '09a94750a9f211ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('1f1f08df072c4281b0fbd9b198d70a79', '8f6ddef522c745708ba7bddf77d6bf28', '2a935f30a9fe11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('1fa40eeda7854978a796ac2707f23df3', 'e0911f1790604654a9ff63a6d59b4e63', '80781030a96311ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('1fa76eab8d1d4bda80eb0007b0a35979', '7a91ee330f03454c8b0eb64e4a08b04f', '0f4e68e0a9f511ea91be7f259e1bd9ba', '417cdee0b13f11eaac8147578f007e03', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('1fc7c9fa47c94b858034a287fb7fd325', '8f6ddef522c745708ba7bddf77d6bf28', '27f53180a9fa11eab79cab3001cc087d', 'ab94be70ab8a11ea97927907eed93ee0', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('209d01e0b1d648c8b85045cbc7fadb42', 'e0911f1790604654a9ff63a6d59b4e63', 'c42ba5c0a96411ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('20f62a67541c4537b3b2ed8c1c8f81de', '20ac7c045eeb49f6bb6e835804087977', '7b16bd7eebea438e82e3497b2e2ba0e7', '20a634a01b4c494b8de67ff5bd201a4e', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('210aa20752b444a598d9187484c8d211', '8f6ddef522c745708ba7bddf77d6bf28', 'bf971e90ab8a11ea97927907eed93ee0', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('223b94d4ce984a72bf357bfacf052e73', '8f6ddef522c745708ba7bddf77d6bf28', 'ab94be70ab8a11ea97927907eed93ee0', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('234b8c60ad8842a49e4c2d82be592137', 'e0911f1790604654a9ff63a6d59b4e63', '7f754960a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('23f92dcbedf0408bbfecee3930d0682e', '91b9067ac484464f8416e2e9d01057c1', '4d7c93c0bcd411eaa872912b9807cf65', '5f402770bcd411eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('24ba8992d42d4daebcda162e39d0422a', '4d71b67a3cdf4979a8a65b7a66db2e25', '574432b0bcd311eaa872912b9807cf65', '57df6140bcd311eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('24e6b81af11140b19024a68fe9e581cc', 'da62a3ab61ed4f6494c5d89292d12c50', '65b36d60c01711eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('26484273449d416db9f5ea0d1407fec2', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'def1c150c02511eab1dd2bae4f3c75e3', '@0==11||@0==美金||@0==汇率', '11|美金|汇率', '@0', 'Right');
INSERT INTO `transition` VALUES ('27da22535af3475e9a21e89cced2a325', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '3f17eb10a96311ea8a7e11d4ec826f36', '@0==2||@0==司龄假', '2|司龄假', '@0', 'Right');
INSERT INTO `transition` VALUES ('29265e4d91cc48ef817ee4053038be4d', '8f6ddef522c745708ba7bddf77d6bf28', '6610a100a9fc11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2b775b9a729d4b24b9f6517e9800c435', '8f6ddef522c745708ba7bddf77d6bf28', '67be99c0b13c11eaac8147578f007e03', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2b8006666b6b469e8895beaf54ff658c', 'a7cd48c9efd24b879217d337402fb64d', 'd4ca92b0c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2b90dd7805444af8b8e498a16cc6d781', '7a91ee330f03454c8b0eb64e4a08b04f', 'bb119990b13411eaac8147578f007e03', '1414ab10b16a11ea84abb32d92922ac7', '@0==3||@0==身份变更||@0==合同变更', '3|身份变更|合同变更', '@0', 'Right');
INSERT INTO `transition` VALUES ('2be1eb5c9fa04493aca28d2cbc863d9d', 'ae494584044449fd898edbeb54565509', '5f81217a83e94ad79875435ed8137edb', 'f11d18168fd34857b4bb2340e3a99725', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('2c39112820b546118abd1ce40fb881d4', '8f6ddef522c745708ba7bddf77d6bf28', 'c2e18ea0ab8a11ea97927907eed93ee0', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2c69e199e1d644b9b7cb1f606b24d929', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '9930b0e0c01611eab1dd2bae4f3c75e3', '@0==2||@0==跨区', '2|跨区', '@0', 'Right');
INSERT INTO `transition` VALUES ('2d3797500e834074aaedfe5e409e17dc', '8f6ddef522c745708ba7bddf77d6bf28', 'bb2ce590b13b11eaac8147578f007e03', '222f70f0b13c11eaac8147578f007e03', '@0==2||@0==3||@0==4||@0==上海||@0==西安||@0==苏州', '2|3|4|上海|西安|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('2dc506aa3fd04f0fbed91bf550efcd0b', '3ffc293746964b38ae8b39087f9a5b1e', '45cc2d10a9f211ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2e17e69ab9f548dda0dbdc4a41d340cb', '7de844da15cf46c5b37385540a3a14d8', '5aec94a0c01d11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2e7531c3ddb2464793fac38e84174845', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '495c5580a9ee11ea91be7f259e1bd9ba', '@0==3||@0==邮箱', '3|邮箱', '@0', 'Right');
INSERT INTO `transition` VALUES ('2f467b6eff7d4a46b20cb42b82acbda9', '91b9067ac484464f8416e2e9d01057c1', '5f402770bcd411eaa872912b9807cf65', '84ce9080bcd411eaa872912b9807cf65', '@0==烘培||@0==蛋糕||@0==面包||@0==饼干||@0==烤肉', '烘培|蛋糕|面包|饼干|烤肉', '@0', 'Right');
INSERT INTO `transition` VALUES ('2faadeb7600042cd96c371f612c2376e', '4d71b67a3cdf4979a8a65b7a66db2e25', '7c6e5bb0bcd311eaa872912b9807cf65', 'b58ed6e0bcd311eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('2ffefe9d143e43a4ba9d9e88167dd942', 'cc4748f66cf34a22bae6718c2eaf8194', 'f2f7be80d23a11eaaa2207ad01666ef1', '4f16d020d23b11eaaa2207ad01666ef1', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('309f3d6fb0f440babba5fb9d94a506e6', '8f6ddef522c745708ba7bddf77d6bf28', '0f77acb0a9fe11eab79cab3001cc087d', '2a935f30a9fe11eab79cab3001cc087d', '@0==1||@0==住宿发票', '1|住宿发票', '@0', 'Right');
INSERT INTO `transition` VALUES ('30c3f288594b4637b87fe8e4a625a536', '04390ed6f99f477dac7d98d051dca6e1', '94123110bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('31270aeca0f148f892139c6143e1731d', '04390ed6f99f477dac7d98d051dca6e1', '95b6b950bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('3280cf09163b405b99256911503e908a', '3ffc293746964b38ae8b39087f9a5b1e', '2388d7b0a9ef11ea91be7f259e1bd9ba', '74c559f0a9ef11ea91be7f259e1bd9ba', '@0==3||@0==入职', '3|入职', '@0', 'Right');
INSERT INTO `transition` VALUES ('332f82b4083e44d7a3383330f4e68952', 'e45a7d751a74414b88d3dc82bd66c863', '06d099f0a9f411ea91be7f259e1bd9ba', '07742cf0a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('348147aa591f4a20bdb18a1208310a05', 'd58a95004efe43c0bc32b20c0b76606c', '6d8d8ab0bcd511eaa872912b9807cf65', 'ca854910bcd511eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('358f5006d75f43c1a96f03978383c6ca', '834f63a4ea3648599a77c7cf8df05fb5', '3f934610b13911eaac8147578f007e03', 'da22cc60b13811eaac8147578f007e03', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('35d53220a27241d7b5eb7425a4f3033c', '3ffc293746964b38ae8b39087f9a5b1e', '240e2cf0a9f211ea91be7f259e1bd9ba', '45cc2d10a9f211ea91be7f259e1bd9ba', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('360b19af15a34e64b836e79e70a831f2', '3ffc293746964b38ae8b39087f9a5b1e', 'd3e2ace0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('3662263136384353ab20835fb4239dcc', 'de1e2b7f1a8f4690a29e71ca448856aa', '2be32a70d30011ea87de4f72b22c127f', '7a8b1f20d30011ea87de4f72b22c127f', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('36d1754a35b949a196e50603a1fc8cc4', '3ffc293746964b38ae8b39087f9a5b1e', '240e2cf0a9f211ea91be7f259e1bd9ba', '4cea3a60a9f211ea91be7f259e1bd9ba', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('37817013b94646e9883908941fe55e76', 'a7cd48c9efd24b879217d337402fb64d', 'd378e560c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('380c5f014bd64383b24bb9145e043d7c', 'e45a7d751a74414b88d3dc82bd66c863', '156eaab0a9f411ea91be7f259e1bd9ba', '56085f70b12f11eaac8147578f007e03', '@0==1||@0==内部', '1|内部', '@0', 'Right');
INSERT INTO `transition` VALUES ('38c62a7956e1485589b01f588e84d37b', '3d91fcf9421a4ad9bc9abee8a00185aa', '82dc8270c01f11eab1dd2bae4f3c75e3', 'c92e5f00c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('3961c16c639f4a1cab2856ba25e532c3', 'e45a7d751a74414b88d3dc82bd66c863', '56085f70b12f11eaac8147578f007e03', 'c1d62e80b12f11eaac8147578f007e03', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('396e687cc7e44aafab2eeb7756c46c3e', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a0accf70a9eb11ea91be7f259e1bd9ba', 'a6234740a9eb11ea91be7f259e1bd9ba', '@0==2||@0==年假', '2|年假', '@0', 'Right');
INSERT INTO `transition` VALUES ('39b023a2b9894bb699b26b3a9817d52d', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '7f837af0a9fb11eab79cab3001cc087d', '@0==4||@0==车补||@0==车费||@0==交通费||@0==私车公用', '4|车补|车费|交通费|私车公用', '@0', 'Right');
INSERT INTO `transition` VALUES ('3a25404b5cf444548f8a81b710abffca', '91b9067ac484464f8416e2e9d01057c1', '4ce55cd0bcd411eaa872912b9807cf65', '4d7c93c0bcd411eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('3c3337eaec01434080789ca3d6b09d28', '8f6ddef522c745708ba7bddf77d6bf28', '6d6a57c0a9fc11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('3ca6593b25444abab7988e7a26c8c108', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', 'e27d6470a9fd11eab79cab3001cc087d', '@0==7||@0==团建||@0==TB', '7|团建|TB', '@0', 'Right');
INSERT INTO `transition` VALUES ('3d64c63fd791423b9004c9e99e70b00b', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '2af2a820a9fc11eab79cab3001cc087d', '@0==5||@0==通讯费', '5|通讯费', '@0', 'Right');
INSERT INTO `transition` VALUES ('3d78421d75174e4a87a975de96ea8d9a', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '69bb4460a9fa11eab79cab3001cc087d', '@0==2||@0==分类||@0==一类||@0==二类||@0==三类', '2|分类|一类|二类|三类', '@0', 'Right');
INSERT INTO `transition` VALUES ('3d9c6c3989404fed923b482eb1492f7b', 'e0911f1790604654a9ff63a6d59b4e63', 'a37d19d0a96411ea8a7e11d4ec826f36', '7f754960a96711ea8a7e11d4ec826f36', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('3e65e69f079340fe9c831cfce07c291b', 'e0911f1790604654a9ff63a6d59b4e63', '5a01e9c0a96411ea8a7e11d4ec826f36', 'b88af680a96411ea8a7e11d4ec826f36', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('3e83e395a1944f29a827afa00e66ce2e', '04390ed6f99f477dac7d98d051dca6e1', '474230b0bcc911ea9ce23960bec20268', '6820cd50bcc911ea9ce23960bec20268', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('3f3347fa300f4e939a0faf83ffe68ae9', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '65b36d60c01711eab1dd2bae4f3c75e3', '@0==3||@0==申报主体', '3|申报主体', '@0', 'Right');
INSERT INTO `transition` VALUES ('3f846534fd8d49a3bbec48d30dba9b5d', '3ffc293746964b38ae8b39087f9a5b1e', 'a2dd8360a9f111ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('3fda38ee67604a3ab6d653f65139e1de', 'e0911f1790604654a9ff63a6d59b4e63', '06696430a96611ea8a7e11d4ec826f36', '291a01b0a96611ea8a7e11d4ec826f36', '@0==流产', '流产', '@0', 'Right');
INSERT INTO `transition` VALUES ('40041eb4124c4a80a0ed5d185e762424', 'c20daf50ca85483598e16bb13c5115ca', 'db52ce20d23811eaaa2207ad01666ef1', '28d3cf00d23911eaaa2207ad01666ef1', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('40267f35a420470fad9d0bfb211815cb', '7a91ee330f03454c8b0eb64e4a08b04f', '221bcb70a9f511ea91be7f259e1bd9ba', '2d967c20a9f511ea91be7f259e1bd9ba', '@0==按期', '按期', '@0', 'Right');
INSERT INTO `transition` VALUES ('402f7e8dd27247ef92fc786f63793791', '8f6ddef522c745708ba7bddf77d6bf28', '9207a4b0b13c11eaac8147578f007e03', '1f9bf4d0b13c11eaac8147578f007e03', '@0==1||@0==生育津贴', '1|生育津贴', '@0', 'Right');
INSERT INTO `transition` VALUES ('40bf182105934ad9b00f8dc405c9f1e6', 'c20daf50ca85483598e16bb13c5115ca', '440b1fd0d23911eaaa2207ad01666ef1', '5a42d680d23911eaaa2207ad01666ef1', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('4195bdf09c8b4e63a53a0c79f11d4baa', '4d71b67a3cdf4979a8a65b7a66db2e25', '7b95fd10bcd311eaa872912b9807cf65', 'b58ed6e0bcd311eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('42000d6eec4f4aa194b0dfd180d6c4db', '91b9067ac484464f8416e2e9d01057c1', '5f402770bcd411eaa872912b9807cf65', '70d53110bcd411eaa872912b9807cf65', '@0==做饭', '做饭', '@0', 'Right');
INSERT INTO `transition` VALUES ('441f71f142f64af184ae10827f424d72', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '9b617e20c01711eab1dd2bae4f3c75e3', '@0==4||@0==盖章', '4|盖章', '@0', 'Right');
INSERT INTO `transition` VALUES ('454706151091469fa95cebd749cbf498', '04390ed6f99f477dac7d98d051dca6e1', '427e18f0bcc911ea9ce23960bec20268', '474230b0bcc911ea9ce23960bec20268', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('4574162d93684f0ebe46bff0532a9136', 'e0911f1790604654a9ff63a6d59b4e63', 'e22b0880a96a11ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('4622e2f1458e41c5b51d7decb7f22323', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '2388d7b0a9ef11ea91be7f259e1bd9ba', '@0==6||@0==考勤', '6|考勤', '@0', 'Right');
INSERT INTO `transition` VALUES ('46738c745560432b9c3aa73a4860397a', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', 'cfe789a0c01711eab1dd2bae4f3c75e3', '@0==5||@0==财务报表||@0==财报', '5|财务报表|财报', '@0', 'Right');
INSERT INTO `transition` VALUES ('46ea397a031340d0bdc8860b27a19a06', 'e0911f1790604654a9ff63a6d59b4e63', '79aed9a0a96311ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('47e9866be5e74fd88f15dc01f6744641', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'e0534d20c02511eab1dd2bae4f3c75e3', '@0==13||@0==财务报表', '13|财务报表', '@0', 'Right');
INSERT INTO `transition` VALUES ('480c6a481a9640848109f7f172c9b3a0', '7a91ee330f03454c8b0eb64e4a08b04f', '417cdee0b13f11eaac8147578f007e03', 'bb119990b13411eaac8147578f007e03', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('49a9fd307bf04aeda127c5122a4b8a64', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '5e8dda80a96411ea8a7e11d4ec826f36', '@0==8||@0==产假||@0==生育假||@0==流产假||@0==孕检假||@0==剖腹||@0==多胞胎', '8|产假|生育假|流产假|孕检假|剖腹|多胞胎', '@0', 'Right');
INSERT INTO `transition` VALUES ('4a5b2a83fb2449e787b74faf5346d6a7', 'e45a7d751a74414b88d3dc82bd66c863', '56085f70b12f11eaac8147578f007e03', '50c812d0b12f11eaac8147578f007e03', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('4b5fe4c208704631ab551e58f2223f06', '04390ed6f99f477dac7d98d051dca6e1', '92ae5b50bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('4b877d480c6146299a5c56ce0d3f4981', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a71a7880a9eb11ea91be7f259e1bd9ba', 'e320d590a9eb11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('4b98e9069046422cac1369c5d92c7526', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '240e2cf0a9f211ea91be7f259e1bd9ba', '@0==10||@0==薪资', '10|薪资', '@0', 'Right');
INSERT INTO `transition` VALUES ('4c6f6b2961ca45078a3097090206037a', '04390ed6f99f477dac7d98d051dca6e1', '6820cd50bcc911ea9ce23960bec20268', '92ae5b50bcc911ea9ce23960bec20268', '@0==微信', '微信', '@0', 'Right');
INSERT INTO `transition` VALUES ('4f8b63a98dc643e0bc4e81358bc8949a', '2d9020b2db9e46abb0e4382b2a054879', '999cd050bccd11eaa872912b9807cf65', 'da66f700bccd11eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('4f9dbe5250b04a649606a2e9bf6cc3f6', '3ffc293746964b38ae8b39087f9a5b1e', '692f7590a9ee11ea91be7f259e1bd9ba', '966bcfe0a9ee11ea91be7f259e1bd9ba', '@0==1||@0==BYSDN||@0==地址||@0==链接', '1|BYSDN|地址|链接', '@0', 'Right');
INSERT INTO `transition` VALUES ('505f3750ef8b4b56a2632fd1770935fe', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', 'fc28e2f0a9ee11ea91be7f259e1bd9ba', '@0==5||@0==WBS||@0==工作分解结构', '5|WBS|工作分解结构', '@0', 'Right');
INSERT INTO `transition` VALUES ('50e95f577f3e4fd1830ed6ef09333561', '7a91ee330f03454c8b0eb64e4a08b04f', 'bb119990b13411eaac8147578f007e03', '0a8087c0b13511eaac8147578f007e03', '@0==1||@0==实习生', '1|实习生', '@0', 'Right');
INSERT INTO `transition` VALUES ('51a36dfc61144de7813685e1b906adfd', '834f63a4ea3648599a77c7cf8df05fb5', '40ad68a0b13911eaac8147578f007e03', 'da22cc60b13811eaac8147578f007e03', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('525806a94f004d61bea5d694ac80b200', '7de844da15cf46c5b37385540a3a14d8', 'd3a4ed80c01c11eab1dd2bae4f3c75e3', 'd48bf220c01c11eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('53493009e0f349abbb179885191ffea8', 'a7cd48c9efd24b879217d337402fb64d', 'da535a00c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('560870cb302046b8b5916edaf6e8b394', '8f6ddef522c745708ba7bddf77d6bf28', '27f53180a9fa11eab79cab3001cc087d', 'b3869680ab8a11ea97927907eed93ee0', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('560a4cbc59e04aff9bed1a8c0fdcc64d', '8f6ddef522c745708ba7bddf77d6bf28', '27f53180a9fa11eab79cab3001cc087d', 'bf971e90ab8a11ea97927907eed93ee0', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('56e33e9e697b4efbba2954074ecacd09', 'cabe2bb695704b4a94f0775d701d9351', '2601e4b0bccc11ea9ce23960bec20268', '818e5340bccc11ea9ce23960bec20268', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('575986104ef541158cc55840c6ae6828', 'a7cd48c9efd24b879217d337402fb64d', 'd78df870c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('577eb075bbbc470b85f0a415825d80b7', 'ae494584044449fd898edbeb54565509', '1f3bcea6d58446c881c7b13dc8b6afbd', '5fddebc09d244317b5afce8fb6f182ac', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('5847648723a14f2b91ad2b1228cd8825', 'ae494584044449fd898edbeb54565509', 'f11d18168fd34857b4bb2340e3a99725', '1f3bcea6d58446c881c7b13dc8b6afbd', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('59c8c8782bbf4fed9a258cc5777fe4b2', 'de1e2b7f1a8f4690a29e71ca448856aa', '32bf4230d2ff11ea87de4f72b22c127f', '17609dd0d30011ea87de4f72b22c127f', '@0==3||@0==不良反应', '3|不良反应', '@0', 'Right');
INSERT INTO `transition` VALUES ('5ac025d7e0a64270930013862e6f523c', '8f6ddef522c745708ba7bddf77d6bf28', '66505e90a9fb11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('5b235f21f29c48d08d0571c8601fd3fe', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '22f6e860c01e11eab1dd2bae4f3c75e3', '@0==5||@0==不同区', '5|不同区', '@0', 'Right');
INSERT INTO `transition` VALUES ('5c429b7f35704b5b845eb8705d7b5ef2', 'cc4748f66cf34a22bae6718c2eaf8194', 'f90dee30d23911eaaa2207ad01666ef1', 'fe2f8f40d23911eaaa2207ad01666ef1', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('5c4bccf464904f2e891e46bf4d7637a9', 'e0911f1790604654a9ff63a6d59b4e63', '54990250a96b11ea8a7e11d4ec826f36', 'e22b0880a96a11ea8a7e11d4ec826f36', '@0==离职', '离职', '@0', 'Right');
INSERT INTO `transition` VALUES ('5c5c0f20f7cf42f989f1abd065610068', 'e0911f1790604654a9ff63a6d59b4e63', '9fa9dd60a9f611ea91be7f259e1bd9ba', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('5d9a43c9da9145059f243a825d4d0001', 'e45a7d751a74414b88d3dc82bd66c863', '4e941bd0b12f11eaac8147578f007e03', '53159860a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('60b80f612fc6498f8f65d926b3dae783', 'cabe2bb695704b4a94f0775d701d9351', 'de915c40bccc11ea9ce23960bec20268', '277cebf0bccc11ea9ce23960bec20268', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('6117b6cd2bfc490fb275586c556c2015', 'cc4748f66cf34a22bae6718c2eaf8194', '7eca1350d23a11eaaa2207ad01666ef1', '4f16d020d23b11eaaa2207ad01666ef1', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('611fe2ed25b34b068565dbbd67f77f69', 'e0911f1790604654a9ff63a6d59b4e63', '3f17eb10a96311ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6454be1ad4aa4cd488fc89153af1de7e', 'e45a7d751a74414b88d3dc82bd66c863', '56085f70b12f11eaac8147578f007e03', 'c08348b0b12f11eaac8147578f007e03', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('64bf0c86b3e34671aa75afa3e2870ee2', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a6234740a9eb11ea91be7f259e1bd9ba', 'e320d590a9eb11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6541172cbf9d4b9a931c81f0e89a1487', '8f6ddef522c745708ba7bddf77d6bf28', '0f77acb0a9fe11eab79cab3001cc087d', '2de06750a9fe11eab79cab3001cc087d', '@0==2||@0==用餐||@0==吃饭||@0==补贴||@0==限额', '2|用餐|吃饭|补贴|限额', '@0', 'Right');
INSERT INTO `transition` VALUES ('65cbaa5a00b749daac4db9446ebd7a72', 'a7cd48c9efd24b879217d337402fb64d', 'dc830b40c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6602e3908784498c9a8bfd0a43a1a48f', '220c7d9d48844bc8a131811beaddfd36', 'cc7b2380c0e411eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('663e5acc1a154e51a19112fd6ec20ffd', '3d91fcf9421a4ad9bc9abee8a00185aa', '83d169c0c01f11eab1dd2bae4f3c75e3', 'c92e5f00c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('684f23472c9c43bab6a4c06b8e362137', '3d91fcf9421a4ad9bc9abee8a00185aa', '602a5e50c01f11eab1dd2bae4f3c75e3', '82dc8270c01f11eab1dd2bae4f3c75e3', '@0==2||@0==购地', '2|购地', '@0', 'Right');
INSERT INTO `transition` VALUES ('6a8388e0c0a5464cbf3b47ccfa62f563', 'd58a95004efe43c0bc32b20c0b76606c', '297e4b20bcd511eaa872912b9807cf65', '2b134300bcd511eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('6bc3283db8414d07826b4385127a08cd', '3ffc293746964b38ae8b39087f9a5b1e', 'c41766c0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6d0b544b9c814764aaffefdb787635fa', 'e0911f1790604654a9ff63a6d59b4e63', 'c1e9a500a96411ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6e591cf3b9af4dfaa0e27638f526b735', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', 'a56efea0c0e511eabc5cbf4ccf21b331', '@0==7||@0==打印||@0==装订', '7|打印|装订', '@0', 'Right');
INSERT INTO `transition` VALUES ('6ef0f925ba324fa985525ac6166c17c0', '91b9067ac484464f8416e2e9d01057c1', '70d53110bcd411eaa872912b9807cf65', 'bb0a8960bcd411eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('6f176d733ffc4de88b6d227e6a5c6c4f', 'a7cd48c9efd24b879217d337402fb64d', 'e32e0b70c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('74aff71ede88425b9514ab12a2cdb6da', 'c20daf50ca85483598e16bb13c5115ca', '6f9e7a80d23811eaaa2207ad01666ef1', 'db52ce20d23811eaaa2207ad01666ef1', '@0==1||@0==招||@0==recruitment ', '1|招|recruitment ', '@0', 'Right');
INSERT INTO `transition` VALUES ('74ee0ec7b66c4d90a1b3dbadf0ab1b15', '3ffc293746964b38ae8b39087f9a5b1e', '431d87d0a9f211ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('75eccc1972724608a43f87094e6823de', '8bed108da3ac46fd9ac0f443d2d03e9a', '2e03ae71eef848c7af7e433fbd2c9cab', '4c9b7b5154b447b7b6a9dfcb263ca862', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('7639b8077fdd4ef1a01db53c37eba336', '220c7d9d48844bc8a131811beaddfd36', '5dd81ef0c0e511eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('764674712375459887ec36684ff4ebf9', '8f6ddef522c745708ba7bddf77d6bf28', '7f837af0a9fb11eab79cab3001cc087d', 'b65d6180a9fb11eab79cab3001cc087d', '@0==私车公用', '私车公用', '@0', 'Right');
INSERT INTO `transition` VALUES ('77316c3535f54581919bfaee86b2f377', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '5aec94a0c01d11eab1dd2bae4f3c75e3', '@0==3||@0==现场||@0==完税证明', '3|现场|完税证明', '@0', 'Right');
INSERT INTO `transition` VALUES ('77b47e57e37f469d865fa6f54e361d69', '8bed108da3ac46fd9ac0f443d2d03e9a', '920ad5ceebf34c319a99acd10fb7b942', '2e03ae71eef848c7af7e433fbd2c9cab', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('77bb3494d0604574bb14c0da1695fc65', 'c20daf50ca85483598e16bb13c5115ca', '5a42d680d23911eaaa2207ad01666ef1', '28d3cf00d23911eaaa2207ad01666ef1', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('7acba742e03144a597282d0b909b3cc2', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd78df870c02511eab1dd2bae4f3c75e3', '@0==6||@0==注册资本||@0==注册资金', '6|注册资本|注册资金', '@0', 'Right');
INSERT INTO `transition` VALUES ('7b7310b051db451691110d0cb56ab179', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd4ca92b0c02511eab1dd2bae4f3c75e3', '@0==4||@0==收入', '4|收入', '@0', 'Right');
INSERT INTO `transition` VALUES ('7ba02ef0bd584bab9384ab73802be8c2', '8f6ddef522c745708ba7bddf77d6bf28', '306b7f00a9fe11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('7c5a1ddf6a7849a1aaa2aaf1de3d15f7', '91b9067ac484464f8416e2e9d01057c1', '84ce9080bcd411eaa872912b9807cf65', 'bb0a8960bcd411eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('7ddfac394fa94668a0a055830419736b', '3d91fcf9421a4ad9bc9abee8a00185aa', '6278e230c01f11eab1dd2bae4f3c75e3', '5f747bd0c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('7e61ddf25588482388db189c2df3ef8c', '834f63a4ea3648599a77c7cf8df05fb5', 'd96a03b0b13811eaac8147578f007e03', 'db2e48f0b13811eaac8147578f007e03', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('7e6d30026b0f4f2bb7d5f2d5819cb9ef', '04390ed6f99f477dac7d98d051dca6e1', '6820cd50bcc911ea9ce23960bec20268', 'd161aff0bcc911ea9ce23960bec20268', '@0==微博||@0==围脖||@0==微搏', '微博|围脖|微搏', '@0', 'Right');
INSERT INTO `transition` VALUES ('7ea3773bb66d42b9a1d4cea94ff21502', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', 'f702b030a9fd11eab79cab3001cc087d', '@0==8||@0==培训', '8|培训', '@0', 'Right');
INSERT INTO `transition` VALUES ('7eaa7b78812847c984969a74694d6d29', '04390ed6f99f477dac7d98d051dca6e1', '6820cd50bcc911ea9ce23960bec20268', '95b6b950bcc911ea9ce23960bec20268', '@0==抖音', '抖音', '@0', 'Right');
INSERT INTO `transition` VALUES ('7edd1d54a0154fe2bece562b3506b232', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '6e504e50c01e11eab1dd2bae4f3c75e3', '@0==6||@0==纳税证明要求||@0==纳税证明的要求||@0==加计扣除', '6|纳税证明要求|纳税证明的要求|加计扣除', '@0', 'Right');
INSERT INTO `transition` VALUES ('7fe2e53e6df644c0845f431ab3e481f3', 'da62a3ab61ed4f6494c5d89292d12c50', '9930b0e0c01611eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('80259b1fea0a470f9a84ac91bcd7cdf7', 'de1e2b7f1a8f4690a29e71ca448856aa', '32bf4230d2ff11ea87de4f72b22c127f', '2be32a70d30011ea87de4f72b22c127f', '@0==4||@0==说明书', '4|说明书', '@0', 'Right');
INSERT INTO `transition` VALUES ('80cd5854579c4526973c67a8ff4ff4af', '8f6ddef522c745708ba7bddf77d6bf28', '1f9bf4d0b13c11eaac8147578f007e03', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('8113d79f9bef4e6c8fb873a5b35c4d10', '220c7d9d48844bc8a131811beaddfd36', 'bd7ab200c0e511eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('81da35bbed38452fa35f47391c15c48f', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd8e3eb80c02511eab1dd2bae4f3c75e3', '@0==7||@0==一企一策', '7|一企一策', '@0', 'Right');
INSERT INTO `transition` VALUES ('81df04c74f0c48ba9df4619e3f6da4a8', '834f63a4ea3648599a77c7cf8df05fb5', 'e6f82b10b13811eaac8147578f007e03', '3f934610b13911eaac8147578f007e03', '@0==1||@0==备用区', '1|备用区', '@0', 'Right');
INSERT INTO `transition` VALUES ('82408d22e1034689878211f8b342959d', '2d9020b2db9e46abb0e4382b2a054879', '729052c0bccd11eaa872912b9807cf65', '732d07f0bccd11eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('82f7d6bc77524d7797f394cdc8e843bf', 'da62a3ab61ed4f6494c5d89292d12c50', 'cfe789a0c01711eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('830a6854f7b34f4a905a786ff7d1aa46', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', 'f6fe5140c0e411eabc5cbf4ccf21b331', '@0==2||@0==电子版', '2|电子版', '@0', 'Right');
INSERT INTO `transition` VALUES ('847c233c85134e3cb2cd47b106ab767a', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '7b419710a9f111ea91be7f259e1bd9ba', '@0==7||@0==社保||@0==公积金', '7|社保|公积金', '@0', 'Right');
INSERT INTO `transition` VALUES ('849e7a3c57ec4b23896186e95eacf262', 'cc4748f66cf34a22bae6718c2eaf8194', 'f7f37d80d23911eaaa2207ad01666ef1', 'f90dee30d23911eaaa2207ad01666ef1', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('84f5684693a44717ba3c79b59a03c422', '3d91fcf9421a4ad9bc9abee8a00185aa', '85052ed0c01f11eab1dd2bae4f3c75e3', 'c92e5f00c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('85fe1dd3453c4685aa7cac2a3a5cebc8', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '71da9540c01811eab1dd2bae4f3c75e3', '@0==6||@0==合并', '6|合并', '@0', 'Right');
INSERT INTO `transition` VALUES ('869f016a2e9743c6afcab0181a6afcfa', 'da62a3ab61ed4f6494c5d89292d12c50', '71da9540c01811eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('8835850a30f243508fb6ecafbc08ea02', '8f6ddef522c745708ba7bddf77d6bf28', '2de06750a9fe11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('883cb527ba5148c990e1bf7baa4b1b5a', '04390ed6f99f477dac7d98d051dca6e1', '8da91be0bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('88a6d1cc7a524f38b83dc40ebc67fbe4', 'cc4748f66cf34a22bae6718c2eaf8194', '263fe840d23a11eaaa2207ad01666ef1', '4f16d020d23b11eaaa2207ad01666ef1', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('897f874ff90e40c5a7da30125bad7615', '8985681322e14a5d86e3a9c2e6afc2b9', 'b8d5f02c34aa41fc8f00905f08f65750', 'b02c5bc9d6a34e83b5fbbcaf91acf494', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('8ae891a0d50545a58bffa63cdfa8b632', '834f63a4ea3648599a77c7cf8df05fb5', 'db2e48f0b13811eaac8147578f007e03', 'e6f82b10b13811eaac8147578f007e03', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('8be0fe4404694b858b1da95c8cf19ca9', 'de1e2b7f1a8f4690a29e71ca448856aa', '312911d0d2ff11ea87de4f72b22c127f', '32bf4230d2ff11ea87de4f72b22c127f', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('8c94c7f82831407c9bba6627e16d101c', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '09a94750a9f211ea91be7f259e1bd9ba', '@0==9||@0==在职证明', '9|在职证明', '@0', 'Right');
INSERT INTO `transition` VALUES ('8cdbad5b3c604773b67097d163bf293d', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '9dbc0860a9fc11eab79cab3001cc087d', '@0==6||@0==借款', '6|借款', '@0', 'Right');
INSERT INTO `transition` VALUES ('8d4559500f7c4a9eb6215d04af91400b', '7a91ee330f03454c8b0eb64e4a08b04f', '2d967c20a9f511ea91be7f259e1bd9ba', '44e6cec0a9f511ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('8d8ce4373ccb408f8297899f9a14b581', 'e0911f1790604654a9ff63a6d59b4e63', '611d10e0a96411ea8a7e11d4ec826f36', '106e2140a96711ea8a7e11d4ec826f36', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('8f85dea6e8084dd79d211bea828a90fd', 'de1e2b7f1a8f4690a29e71ca448856aa', '3066d340d2ff11ea87de4f72b22c127f', '312911d0d2ff11ea87de4f72b22c127f', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('8f967d8e9fc14dc0878b8e3daf206b78', 'e0911f1790604654a9ff63a6d59b4e63', '5021c450a96611ea8a7e11d4ec826f36', '82e181f0aa1a11ea8f321fde55a346bf', '@0==孕检', '孕检', '@0', 'Right');
INSERT INTO `transition` VALUES ('909e17f164824f6ab7970c5ce06fc046', '2d9020b2db9e46abb0e4382b2a054879', '732d07f0bccd11eaa872912b9807cf65', '7bded4a0bccd11eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('9189a9c1620a48b49c8464fbd93f1d6c', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '5a01e9c0a96411ea8a7e11d4ec826f36', '@0==7||@0==婚假||@0==奖励假', '7|婚假|奖励假', '@0', 'Right');
INSERT INTO `transition` VALUES ('91ca29169db744dfb9b2959fa3c01009', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'dc830b40c02511eab1dd2bae4f3c75e3', '@0==10||@0==企业章程||@0==验资报告||@0==集团登记证', '10|企业章程|验资报告|集团登记证', '@0', 'Right');
INSERT INTO `transition` VALUES ('923a9f9dc92b4c5285f425498c1ab6a8', '3d91fcf9421a4ad9bc9abee8a00185aa', '813980d0c01f11eab1dd2bae4f3c75e3', 'c92e5f00c01f11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('93f34a99ca884d829c275569e3ed6b1b', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'db5f72d0c02511eab1dd2bae4f3c75e3', '@0==9||@0==行业协会||@0==政策扶持', '9|行业协会|政策扶持', '@0', 'Right');
INSERT INTO `transition` VALUES ('9522b387217341fb9f4b3d543417021d', 'e0911f1790604654a9ff63a6d59b4e63', '6c6a5e10a96611ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('959a413d0c3440aaa47877dbaddb1a07', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd378e560c02511eab1dd2bae4f3c75e3', '@0==3||@0==个体', '3|个体', '@0', 'Right');
INSERT INTO `transition` VALUES ('963aedb5e8d3457abfd9d8530674545f', '8985681322e14a5d86e3a9c2e6afc2b9', 'e95f732f77f445779ab9c1f69e22f72a', 'b8d5f02c34aa41fc8f00905f08f65750', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('96a8272f908a4adf910e08bfc4c7d6a1', '803e8e252998477ab3feee3bde453583', '4c46257ce8754c4da07861296aefced4', '5766a786df14422d8a89a113576f4aaa', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('9712fde7c5704775aaf85c37683eaaa7', '7de844da15cf46c5b37385540a3a14d8', '2a537ac0c01d11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('976aac13bd2e4c62803cc50a001f5b62', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a0accf70a9eb11ea91be7f259e1bd9ba', 'a71a7880a9eb11ea91be7f259e1bd9ba', '@0==当天||@0==一天||@0==今天', '当天|一天|今天', '@0', 'Right');
INSERT INTO `transition` VALUES ('9854acd95a004a85b3a70b2101ad2b86', '8f6ddef522c745708ba7bddf77d6bf28', 'b3869680ab8a11ea97927907eed93ee0', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('98c1cf2009e64882bdf8fcc9551d5081', '2d9020b2db9e46abb0e4382b2a054879', '7bded4a0bccd11eaa872912b9807cf65', '88b803e0bccd11eaa872912b9807cf65', '@0==衣服', '衣服', '@0', 'Right');
INSERT INTO `transition` VALUES ('98ed2e1b588446b0b3f9f687766a3bc4', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', 'cc7b2380c0e411eabc5cbf4ccf21b331', '@0==1||@0==锁定||@0==宏||@0==保护', '1|锁定|宏|保护', '@0', 'Right');
INSERT INTO `transition` VALUES ('992876ff10bb489ca64bf34616fb5113', '8f6ddef522c745708ba7bddf77d6bf28', '9207a4b0b13c11eaac8147578f007e03', '67be99c0b13c11eaac8147578f007e03', '@0==2||@0==生育保险', '2|生育保险', '@0', 'Right');
INSERT INTO `transition` VALUES ('99dca44622c640e4871fdb67ee563bff', 'da62a3ab61ed4f6494c5d89292d12c50', '967c5ef0c01911eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('9a8a54c173994995bf57b53fe69e780a', 'e0911f1790604654a9ff63a6d59b4e63', '76c10bb0a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('9b0ae98bc96e421daf4c70841f49fc69', '3d91fcf9421a4ad9bc9abee8a00185aa', '602a5e50c01f11eab1dd2bae4f3c75e3', '813980d0c01f11eab1dd2bae4f3c75e3', '@0==1||@0==联合申报', '1|联合申报', '@0', 'Right');
INSERT INTO `transition` VALUES ('9bb744b3b4c146cd85aa793225f4d211', 'de1e2b7f1a8f4690a29e71ca448856aa', '32bf4230d2ff11ea87de4f72b22c127f', '0a99be10d30011ea87de4f72b22c127f', '@0==2||@0==用法', '2|用法', '@0', 'Right');
INSERT INTO `transition` VALUES ('9c6b7b32bfbc4f2a9712b49f45ed4c41', '8f6ddef522c745708ba7bddf77d6bf28', '9dbc0860a9fc11eab79cab3001cc087d', 'af4a3430a9fc11eab79cab3001cc087d', '@0==私事||@0==家里', '私事|家里', '@0', 'Right');
INSERT INTO `transition` VALUES ('9d499bbecfa442aa9cb9a794022af977', 'e45a7d751a74414b88d3dc82bd66c863', 'c1d62e80b12f11eaac8147578f007e03', '53159860a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('9d86349529844846a2efcd27f89bbb9f', 'cc4748f66cf34a22bae6718c2eaf8194', 'fe2f8f40d23911eaaa2207ad01666ef1', '2d742030d23b11eaaa2207ad01666ef1', '@0==4||@0==Talent||@0==U||@0==人才公寓', '4|Talent|U|人才公寓', '@0', 'Right');
INSERT INTO `transition` VALUES ('9dfe81422fd14d6da1d8973b5b76a2a0', 'cc4748f66cf34a22bae6718c2eaf8194', '2d742030d23b11eaaa2207ad01666ef1', '4f16d020d23b11eaaa2207ad01666ef1', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('9f10153fce0e47929eb0461a2403020f', 'e45a7d751a74414b88d3dc82bd66c863', '32178ce0a9f411ea91be7f259e1bd9ba', '53159860a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('9f9fdf0282b04a5db224e00b444840c7', '7de844da15cf46c5b37385540a3a14d8', '6e504e50c01e11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a1053e2714334ff5997c8096cbdcf58a', 'da62a3ab61ed4f6494c5d89292d12c50', '9b617e20c01711eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a113b72df2b1483b98b347f804d31b53', '834f63a4ea3648599a77c7cf8df05fb5', 'e6f82b10b13811eaac8147578f007e03', '40ad68a0b13911eaac8147578f007e03', '@0==2||@0==安全规定', '2|安全规定', '@0', 'Right');
INSERT INTO `transition` VALUES ('a19ba74cb21d4ed28c44fd11091bddc4', '220c7d9d48844bc8a131811beaddfd36', '156cb130c0e511eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('a1fd6d4872c542759a4d340b752cdab7', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '7aace8b0a96311ea8a7e11d4ec826f36', '@0==5||@0==丧假', '5|丧假', '@0', 'Right');
INSERT INTO `transition` VALUES ('a21fedb2994e46158b0703cdc18163c0', '3ffc293746964b38ae8b39087f9a5b1e', '692f7590a9ee11ea91be7f259e1bd9ba', 'd3e2ace0a9ee11ea91be7f259e1bd9ba', '@0==3||@0==通过||@0==考核||@0==及格||@0==机会', '3|通过|考核|及格|机会', '@0', 'Right');
INSERT INTO `transition` VALUES ('a24efabb1cfb4a8981ebb526a73ed663', 'da62a3ab61ed4f6494c5d89292d12c50', '0757a7a0c01611eab1dd2bae4f3c75e3', '0916e3d0c01611eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('a2860ad4d537494c8196c11c0ba635ed', 'da62a3ab61ed4f6494c5d89292d12c50', '067f9720c01611eab1dd2bae4f3c75e3', '0757a7a0c01611eab1dd2bae4f3c75e3', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('a28ad9fd6c4a450e99564c75789a3064', 'e0911f1790604654a9ff63a6d59b4e63', '0d384aa0a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a2b9cb74c9b94f489b25944be3563fba', '7a91ee330f03454c8b0eb64e4a08b04f', '1414ab10b16a11ea84abb32d92922ac7', '34979320b16a11ea84abb32d92922ac7', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('a328a0e5a2cc46a9b023e689014b1008', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '54990250a96b11ea8a7e11d4ec826f36', '@0==1||@0==年假', '1|年假', '@0', 'Right');
INSERT INTO `transition` VALUES ('a33d3aa7519b4e4da1c97192d680d535', 'd58a95004efe43c0bc32b20c0b76606c', '7afa6e70bcd511eaa872912b9807cf65', 'ca854910bcd511eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a3c39e422efd487fa80d5308ff0df35d', 'a7cd48c9efd24b879217d337402fb64d', '34bcc1a0c00011ea9c95a96aec82f490', '35cbe7b0c00011ea9c95a96aec82f490', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('a4cf959ec5e345e5ba58901126f5d5b0', '3ffc293746964b38ae8b39087f9a5b1e', '48daf3b0a9f211ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a4dffea47b1f4ca0984201d7957870fd', '7a91ee330f03454c8b0eb64e4a08b04f', '0a8087c0b13511eaac8147578f007e03', '44e6cec0a9f511ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('a5f8bdc2bf4d498bbdb50a5a039b754c', '7de844da15cf46c5b37385540a3a14d8', 'd60ee8a0c01c11eab1dd2bae4f3c75e3', '9a4e2aa0c01d11eab1dd2bae4f3c75e3', '@0==4||@0==预缴税费', '4|预缴税费', '@0', 'Right');
INSERT INTO `transition` VALUES ('a69752a4e7b54f55b75e6ec8bdc69a8d', 'e0911f1790604654a9ff63a6d59b4e63', '611d10e0a96411ea8a7e11d4ec826f36', '08cfc060a96711ea8a7e11d4ec826f36', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('a8653763db77403ea8134dc5d2fdb2a4', 'e0911f1790604654a9ff63a6d59b4e63', '611d10e0a96411ea8a7e11d4ec826f36', '13b64760a96711ea8a7e11d4ec826f36', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('aafd08350fce41fa8055fdee1e5c261e', 'e0911f1790604654a9ff63a6d59b4e63', '811edab0a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ac2f1a22c7504c7d9b011ba9710d6aef', 'c20daf50ca85483598e16bb13c5115ca', '6f9e7a80d23811eaaa2207ad01666ef1', '440b1fd0d23911eaaa2207ad01666ef1', '@0==2||@0==投诉||@0==complain||@0==customer', '2|投诉|complain|customer', '@0', 'Right');
INSERT INTO `transition` VALUES ('ad02a3fbe92a44ad82a7fa0be59f8d24', 'e0911f1790604654a9ff63a6d59b4e63', 'a37d19d0a96411ea8a7e11d4ec826f36', '76c10bb0a96711ea8a7e11d4ec826f36', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('ad31a5e277da478a9f384697e5501c48', '220c7d9d48844bc8a131811beaddfd36', 'ff2961c0c0e411eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('ad41a06c9ee8449e8a8de200eb9a9bb3', 'e0911f1790604654a9ff63a6d59b4e63', '5e8dda80a96411ea8a7e11d4ec826f36', '80e91a20a96611ea8a7e11d4ec826f36', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('ae4567a397e043c0b6d9dd322ffc8866', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd22f4e60c02511eab1dd2bae4f3c75e3', '@0==2||@0==集团', '2|集团', '@0', 'Right');
INSERT INTO `transition` VALUES ('ae64be449edc42ab9090ac794c0c4191', 'e0911f1790604654a9ff63a6d59b4e63', '82e181f0aa1a11ea8f321fde55a346bf', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ae6843eb545a44d89b9835652bbed1ab', '2d9020b2db9e46abb0e4382b2a054879', '8b1d1d00bccd11eaa872912b9807cf65', 'da66f700bccd11eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('afb7f89c1d7d4d249b42359a40b69d8e', 'de1e2b7f1a8f4690a29e71ca448856aa', '0a99be10d30011ea87de4f72b22c127f', '7a8b1f20d30011ea87de4f72b22c127f', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b03eec038a8d446d90383dc886bc6981', 'e0911f1790604654a9ff63a6d59b4e63', '77d4e980a96311ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b1045c353358418698bca22afac77b5d', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '1375f6b0a9ee11ea91be7f259e1bd9ba', '@0==1||@0==账号', '1|账号', '@0', 'Right');
INSERT INTO `transition` VALUES ('b10b463fc86040719175fd729ce0f16a', '7de844da15cf46c5b37385540a3a14d8', '9a4e2aa0c01d11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b1493e068d634b2ca91a89b18d350ab9', '3ffc293746964b38ae8b39087f9a5b1e', 'ef409120a9f111ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b25e2ebfa1e44973893f14f912831bce', 'c20daf50ca85483598e16bb13c5115ca', '63982ba0d23811eaaa2207ad01666ef1', '644cfcb0d23811eaaa2207ad01666ef1', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('b2dcd14d58dc4850852bce4798f75c1d', '7de844da15cf46c5b37385540a3a14d8', '22f6e860c01e11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b392aca934344a4a92491eef51e6f54a', '8f6ddef522c745708ba7bddf77d6bf28', '2af2a820a9fc11eab79cab3001cc087d', '6610a100a9fc11eab79cab3001cc087d', '@0==1||@0==要求', '1|要求', '@0', 'Right');
INSERT INTO `transition` VALUES ('b42429060a294f119692b5fffb2befdc', '803e8e252998477ab3feee3bde453583', '5766a786df14422d8a89a113576f4aaa', '1086081d9a9e461ca74db4ada13bdef8', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('b511a56552284bc7932aefc9ac798236', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', '3f1424f0c0e511eabc5cbf4ccf21b331', '@0==6||@0==完整||@0==缺失||@0==遗漏', '6|完整|缺失|遗漏', '@0', 'Right');
INSERT INTO `transition` VALUES ('b59e867fd2d9413ab56002d5aac50b22', '8985681322e14a5d86e3a9c2e6afc2b9', 'b02c5bc9d6a34e83b5fbbcaf91acf494', 'a52f711b083149158ca2ab96529d91cc', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('b5e4ddf76d034430a7ba5403098fd84b', 'd58a95004efe43c0bc32b20c0b76606c', '4f3af020bcd511eaa872912b9807cf65', '7afa6e70bcd511eaa872912b9807cf65', '@0==开车', '开车', '@0', 'Right');
INSERT INTO `transition` VALUES ('b5ffd764afe5403d80e5706190f93217', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '692f7590a9ee11ea91be7f259e1bd9ba', '@0==4||@0==安全培训', '4|安全培训', '@0', 'Right');
INSERT INTO `transition` VALUES ('b6b4443d98af49a9a0cc22253bf6b2d3', '3ffc293746964b38ae8b39087f9a5b1e', '2388d7b0a9ef11ea91be7f259e1bd9ba', '6cca8130a9ef11ea91be7f259e1bd9ba', '@0==2||@0==周期', '2|周期', '@0', 'Right');
INSERT INTO `transition` VALUES ('b75bf0601fa14fe59aee2a229ece7351', '3d91fcf9421a4ad9bc9abee8a00185aa', '602a5e50c01f11eab1dd2bae4f3c75e3', '85052ed0c01f11eab1dd2bae4f3c75e3', '@0==4||@0==厂房||@0==仓库', '4|厂房|仓库', '@0', 'Right');
INSERT INTO `transition` VALUES ('b77d1e8db760468f894f8567af620183', '7de844da15cf46c5b37385540a3a14d8', 'edbe2420c01c11eab1dd2bae4f3c75e3', '9ed45990c01e11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b78110e2a6214a3fbaf768c3ffaa7ad8', '2d9020b2db9e46abb0e4382b2a054879', '7bded4a0bccd11eaa872912b9807cf65', '8b1d1d00bccd11eaa872912b9807cf65', '@0==妆容||@0==化妆||@0==妆||@0==漂亮', '妆容|化妆|妆|漂亮', '@0', 'Right');
INSERT INTO `transition` VALUES ('b7c2006c37314e8ebd009436182ec714', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '27f53180a9fa11eab79cab3001cc087d', '@0==1||@0==抬头||@0==发票', '1|抬头|发票', '@0', 'Right');
INSERT INTO `transition` VALUES ('b840f115d48e445c852b0546e33bd54e', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', 'bd7ab200c0e511eabc5cbf4ccf21b331', '@0==8||@0==盖章', '8|盖章', '@0', 'Right');
INSERT INTO `transition` VALUES ('b85571f7d2964cfb927125ad3a5afa04', '8f6ddef522c745708ba7bddf77d6bf28', '0f77acb0a9fe11eab79cab3001cc087d', '306b7f00a9fe11eab79cab3001cc087d', '@0==3||@0==住宿标准', '3|住宿标准', '@0', 'Right');
INSERT INTO `transition` VALUES ('b85947eae7064ae89ec7b1acc246664d', '8f6ddef522c745708ba7bddf77d6bf28', '69bb4460a9fa11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('b87406a9253b41b4b0ba06cefea7caf3', 'f2c2ef95e71441c2907a9d0be26eb6da', '52ef3ac0a9eb11ea91be7f259e1bd9ba', 'a0accf70a9eb11ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('b9349b5d3e58427b9e8232b4586046b5', '3ffc293746964b38ae8b39087f9a5b1e', '2388d7b0a9ef11ea91be7f259e1bd9ba', '56528d30a9ef11ea91be7f259e1bd9ba', '@0==1||@0==填写', '1|填写', '@0', 'Right');
INSERT INTO `transition` VALUES ('b963247d1ef9489ba3885c27b6a8897f', '3ffc293746964b38ae8b39087f9a5b1e', 'fc28e2f0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ba0959df15df42bc80fecf36096e296c', '3ffc293746964b38ae8b39087f9a5b1e', 'e3073da0a9ec11ea91be7f259e1bd9ba', 'e4161590a9ec11ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('bab11ad7c783458a81431c6a4e2e0387', '04390ed6f99f477dac7d98d051dca6e1', '6820cd50bcc911ea9ce23960bec20268', '94123110bcc911ea9ce23960bec20268', '@0==QQ||@0==qq', 'QQ|qq', '@0', 'Right');
INSERT INTO `transition` VALUES ('bb917acf051e4a61b149f40141e94783', '8f6ddef522c745708ba7bddf77d6bf28', 'bb2ce590b13b11eaac8147578f007e03', '9207a4b0b13c11eaac8147578f007e03', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('bc5baf08c45e4f73a11fdbb08ee900a1', '4d71b67a3cdf4979a8a65b7a66db2e25', '5e5bd760bcd311eaa872912b9807cf65', '7b95fd10bcd311eaa872912b9807cf65', '@0==家乡||@0==哪里人', '家乡|哪里人', '@0', 'Right');
INSERT INTO `transition` VALUES ('bc9e2017a8a343db8b1bc2d0f242b08e', '3ffc293746964b38ae8b39087f9a5b1e', 'a0758410a9f111ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('be2307f639aa48408375beb4bfe2495f', '4d71b67a3cdf4979a8a65b7a66db2e25', '57df6140bcd311eaa872912b9807cf65', '5e5bd760bcd311eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('beaba5a382b1486c85c4190b83ca6244', '7a91ee330f03454c8b0eb64e4a08b04f', 'bb119990b13411eaac8147578f007e03', '221bcb70a9f511ea91be7f259e1bd9ba', '@0==2||@0==非实习生||@0==社招||@0==提前||@0==按期', '2|非实习生|社招|提前|按期', '@0', 'Right');
INSERT INTO `transition` VALUES ('bf1761494eaa420f8c7e503e45b7d45a', 'cabe2bb695704b4a94f0775d701d9351', 'dc93b780bccc11ea9ce23960bec20268', '277cebf0bccc11ea9ce23960bec20268', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('bffb9e5093364fbbbcff8c86a34b8529', 'e45a7d751a74414b88d3dc82bd66c863', '56085f70b12f11eaac8147578f007e03', '4e941bd0b12f11eaac8147578f007e03', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('c00af04227f440eaaeec4b40de40f606', '7a91ee330f03454c8b0eb64e4a08b04f', '221bcb70a9f511ea91be7f259e1bd9ba', '2fb871c0a9f511ea91be7f259e1bd9ba', '@0==提前', '提前', '@0', 'Right');
INSERT INTO `transition` VALUES ('c03cf8a96cad43c492257468709abeae', '3ffc293746964b38ae8b39087f9a5b1e', '4cea3a60a9f211ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c22ccb7796584e5c9cea280f0a921730', '3ffc293746964b38ae8b39087f9a5b1e', '7b419710a9f111ea91be7f259e1bd9ba', '9e427770a9f111ea91be7f259e1bd9ba', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('c32d227aa0db43228d89fbf9da5d91b9', 'e0911f1790604654a9ff63a6d59b4e63', '291a01b0a96611ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c359c458a4bd4ac4b42f63db6c201536', '3ffc293746964b38ae8b39087f9a5b1e', '6408d3d0b13311eaac8147578f007e03', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c3fdc7a22201417ead902d33fd3e7080', '8f6ddef522c745708ba7bddf77d6bf28', '2af2a820a9fc11eab79cab3001cc087d', '6d6a57c0a9fc11eab79cab3001cc087d', '@0==2||@0==备案', '2|备案', '@0', 'Right');
INSERT INTO `transition` VALUES ('c559b47222dd48319c0ac176e7bd5746', '8f6ddef522c745708ba7bddf77d6bf28', 'f9745b30a9f711eab79cab3001cc087d', '01fb9570a9f811eab79cab3001cc087d', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('c55a055a6dd24859a11620aa92c4254d', 'a7cd48c9efd24b879217d337402fb64d', 'e0534d20c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c57a4a93ce934165aa5764eb211c1809', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'da535a00c02511eab1dd2bae4f3c75e3', '@0==8||@0==海上运输||@0==交通运输||@0==传统交通', '8|海上运输|交通运输|传统交通', '@0', 'Right');
INSERT INTO `transition` VALUES ('c58374047f2547b1aec2f7f0107526e8', 'e0911f1790604654a9ff63a6d59b4e63', '5e8dda80a96411ea8a7e11d4ec826f36', '611d10e0a96411ea8a7e11d4ec826f36', '@0==陪产假', '陪产假', '@0', 'Right');
INSERT INTO `transition` VALUES ('c7067226f23e473e93a4158fa33efd5c', 'cc4748f66cf34a22bae6718c2eaf8194', 'fe2f8f40d23911eaaa2207ad01666ef1', '263fe840d23a11eaaa2207ad01666ef1', '@0==1||@0==Villa', '1|Villa', '@0', 'Right');
INSERT INTO `transition` VALUES ('c760237622214f9dbf5e88877f816759', 'd58a95004efe43c0bc32b20c0b76606c', '8b7ca880bcd511eaa872912b9807cf65', 'ca854910bcd511eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c82e03f9344f4bbab9765a0e7aa6c9f1', '3ffc293746964b38ae8b39087f9a5b1e', '7b419710a9f111ea91be7f259e1bd9ba', '9bed8af0a9f111ea91be7f259e1bd9ba', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('c846f462ac0d49a58aedff16555663f4', '2d9020b2db9e46abb0e4382b2a054879', '88b803e0bccd11eaa872912b9807cf65', 'da66f700bccd11eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c8cf8769a5354d188cc5afeed57b4721', 'e45a7d751a74414b88d3dc82bd66c863', '50c812d0b12f11eaac8147578f007e03', '53159860a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('c970016258454065835089c32d697c4a', 'cabe2bb695704b4a94f0775d701d9351', 'd875a3c0bccc11ea9ce23960bec20268', 'dc93b780bccc11ea9ce23960bec20268', '@0==跑车', '跑车', '@0', 'Right');
INSERT INTO `transition` VALUES ('c9e55b40e47b4b0d80fe462cad75f269', '8f6ddef522c745708ba7bddf77d6bf28', 'f86b2890a9f711eab79cab3001cc087d', 'f9745b30a9f711eab79cab3001cc087d', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('cafa1a7ecf5140218bbb8bba0535bb5e', '3ffc293746964b38ae8b39087f9a5b1e', '240e2cf0a9f211ea91be7f259e1bd9ba', '48daf3b0a9f211ea91be7f259e1bd9ba', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('cc66584d406f40f08cfb042d714d7a59', 'e0911f1790604654a9ff63a6d59b4e63', 'a37d19d0a96411ea8a7e11d4ec826f36', '811edab0a96711ea8a7e11d4ec826f36', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('cc82adfe292a470c9a8950f2d4dd7a9f', '8f6ddef522c745708ba7bddf77d6bf28', 'f702b030a9fd11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ccb0a6b20dea4f2d97d325a3c561e386', '4d71b67a3cdf4979a8a65b7a66db2e25', '5e5bd760bcd311eaa872912b9807cf65', '7c6e5bb0bcd311eaa872912b9807cf65', '@0==租', '租', '@0', 'Right');
INSERT INTO `transition` VALUES ('cde55646ded2467287bf3c600209db5b', '220c7d9d48844bc8a131811beaddfd36', 'f6fe5140c0e411eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('ce8cf4232dab485eb1078ea455545c36', 'a7cd48c9efd24b879217d337402fb64d', 'd22f4e60c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ceacba0202d741e8ad5da8592e77c9a7', '3ffc293746964b38ae8b39087f9a5b1e', '1375f6b0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d148bf41596d497aa70e2d370762bfd9', '3ffc293746964b38ae8b39087f9a5b1e', '340736a0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d15813e390014460b6e566e18e47ca12', '8f6ddef522c745708ba7bddf77d6bf28', '27f53180a9fa11eab79cab3001cc087d', 'c2e18ea0ab8a11ea97927907eed93ee0', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('d36e48d220c44b218baa803c09b99872', 'd58a95004efe43c0bc32b20c0b76606c', '4f3af020bcd511eaa872912b9807cf65', '8b7ca880bcd511eaa872912b9807cf65', '@0==地铁', '地铁', '@0', 'Right');
INSERT INTO `transition` VALUES ('d43a548db11c45388165f6013e606db2', '3ffc293746964b38ae8b39087f9a5b1e', '7b419710a9f111ea91be7f259e1bd9ba', 'a2dd8360a9f111ea91be7f259e1bd9ba', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('d448d5151b454684838f4bfb14adb439', '3ffc293746964b38ae8b39087f9a5b1e', '966bcfe0a9ee11ea91be7f259e1bd9ba', '964fee00a9ef11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d49ccfe428c04179a2afcb5ae7b46465', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd67b01d0c02511eab1dd2bae4f3c75e3', '@0==5||@0==手工', '5|手工', '@0', 'Right');
INSERT INTO `transition` VALUES ('d695b1b3495c4be6bf3455e873423a33', 'a7cd48c9efd24b879217d337402fb64d', 'd0416110c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d6b192f5de95405a82208744e9c8182f', '220c7d9d48844bc8a131811beaddfd36', '32760a40c0e211eabc5cbf4ccf21b331', '80f456e0c0e211eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('d6e714edaf3b4d51acc6ebf1e1427a54', '20ac7c045eeb49f6bb6e835804087977', '84b53d010485448e80b74aad9842357b', '7b16bd7eebea438e82e3497b2e2ba0e7', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('d6ed4b6cc2a6408a922b7f4e46310b1e', 'cabe2bb695704b4a94f0775d701d9351', '818e5340bccc11ea9ce23960bec20268', 'd875a3c0bccc11ea9ce23960bec20268', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('d72cb94064c54176bcf62461422eaefc', '8f6ddef522c745708ba7bddf77d6bf28', 'b65d6180a9fb11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d75c0ad72e0e49e58842648d5ed55abc', '8f6ddef522c745708ba7bddf77d6bf28', 'e27d6470a9fd11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('d83e5ff58d4d472facb55f665eb3a85a', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', 'a37d19d0a96411ea8a7e11d4ec826f36', '@0==9||@0==哺乳假', '9|哺乳假', '@0', 'Right');
INSERT INTO `transition` VALUES ('da1557d29f4b46858906436d8ab8b411', '2d9020b2db9e46abb0e4382b2a054879', '7bded4a0bccd11eaa872912b9807cf65', '999cd050bccd11eaa872912b9807cf65', '@0==身材', '身材', '@0', 'Right');
INSERT INTO `transition` VALUES ('daf4480761694aa8b46aae807216dfea', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '17ae8bf0c01611eab1dd2bae4f3c75e3', '@0==1||@0==行业', '1|行业', '@0', 'Right');
INSERT INTO `transition` VALUES ('dca4db8fad9d48c79305257badf1e1e9', '3ffc293746964b38ae8b39087f9a5b1e', '193a0ec0a9ed11ea91be7f259e1bd9ba', '6408d3d0b13311eaac8147578f007e03', '@0==11||@0==劳动合同', '11|劳动合同', '@0', 'Right');
INSERT INTO `transition` VALUES ('dca6ab6868c04106ba7e6e17c7d35548', 'e0911f1790604654a9ff63a6d59b4e63', 'a37d19d0a96411ea8a7e11d4ec826f36', '82a616f0a96711ea8a7e11d4ec826f36', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('dce5f80c5d5645d29cdfdc73ea05b2ec', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '79aed9a0a96311ea8a7e11d4ec826f36', '@0==4||@0==病假', '4|病假', '@0', 'Right');
INSERT INTO `transition` VALUES ('dd9696d877444d918bee9519692dd153', 'e0911f1790604654a9ff63a6d59b4e63', '106e2140a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('ddca5626c1714b8fbf6652f2933fe13e', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '66505e90a9fb11eab79cab3001cc087d', '@0==3||@0==加班餐补||@0==加班的餐费补助||@0==加班餐费补助', '3|加班餐补|加班的餐费补助|加班餐费补助', '@0', 'Right');
INSERT INTO `transition` VALUES ('ddf2f2a71608404d8a819baddc137584', '8f6ddef522c745708ba7bddf77d6bf28', 'af4a3430a9fc11eab79cab3001cc087d', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('de1bd2bab209487db9a578723196ffaa', '220c7d9d48844bc8a131811beaddfd36', '31a15520c0e211eabc5cbf4ccf21b331', '32760a40c0e211eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Right');
INSERT INTO `transition` VALUES ('de9f314a0e654fe79eac0cc0637822a5', '8f6ddef522c745708ba7bddf77d6bf28', '222f70f0b13c11eaac8147578f007e03', 'cd3644c0a9fc11eab79cab3001cc087d', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('dfd95564f2cc461a80bcd277a072706e', 'e0911f1790604654a9ff63a6d59b4e63', '5e8dda80a96411ea8a7e11d4ec826f36', 'bb77a440a96611ea8a7e11d4ec826f36', '@0==4||@0==苏州', '4|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('e01606d8b851464f8cb7b2437da1d2bc', '7a91ee330f03454c8b0eb64e4a08b04f', '2fb871c0a9f511ea91be7f259e1bd9ba', '44e6cec0a9f511ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e0a373bef7f94eaf8b16ddfd2f61d246', 'e45a7d751a74414b88d3dc82bd66c863', 'c08348b0b12f11eaac8147578f007e03', '53159860a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e1a0d6c9c87042d79f00668ac9653846', '91b9067ac484464f8416e2e9d01057c1', 'a73ddf40bcd411eaa872912b9807cf65', 'bb0a8960bcd411eaa872912b9807cf65', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e2140ee8c50e4f428bccfc5215efb6e6', 'cabe2bb695704b4a94f0775d701d9351', 'db02b740bccc11ea9ce23960bec20268', '277cebf0bccc11ea9ce23960bec20268', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('e2dfc17ed5114bafb52c447b59635aad', 'e0911f1790604654a9ff63a6d59b4e63', '82a616f0a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e3222929002b4d4ebb2d6175f1d60d84', '8f6ddef522c745708ba7bddf77d6bf28', '01fb9570a9f811eab79cab3001cc087d', '0f77acb0a9fe11eab79cab3001cc087d', '@0==9||@0==出差||@0==差旅', '9|出差|差旅', '@0', 'Right');
INSERT INTO `transition` VALUES ('e3b2005879c4436d9f6134a0ca1569da', 'a7cd48c9efd24b879217d337402fb64d', 'd8e3eb80c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e3c3567953ea4a648fb4de83ec97abff', '3ffc293746964b38ae8b39087f9a5b1e', '240e2cf0a9f211ea91be7f259e1bd9ba', '431d87d0a9f211ea91be7f259e1bd9ba', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('e4fe99af7ca14c0890289b924624e00c', 'e0911f1790604654a9ff63a6d59b4e63', '08cfc060a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e5057756fc9240f9bcd661d913ee20da', '3ffc293746964b38ae8b39087f9a5b1e', 'e4161590a9ec11ea91be7f259e1bd9ba', '193a0ec0a9ed11ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('e6af33ba124a475c9864a3eb9b39ab14', 'a7cd48c9efd24b879217d337402fb64d', '338923a0c00011ea9c95a96aec82f490', '34bcc1a0c00011ea9c95a96aec82f490', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('e788d111730d4793b60d520182bbd631', '7a91ee330f03454c8b0eb64e4a08b04f', '60a70630b16a11ea84abb32d92922ac7', '44e6cec0a9f511ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e7929c66f5794ee98c77eefeca767229', 'da62a3ab61ed4f6494c5d89292d12c50', '17ae8bf0c01611eab1dd2bae4f3c75e3', '13ef3d30c01a11eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('e7a419bf1069450987dfd684a71bd04d', '3ffc293746964b38ae8b39087f9a5b1e', '692f7590a9ee11ea91be7f259e1bd9ba', 'c41766c0a9ee11ea91be7f259e1bd9ba', '@0==2||@0==完成', '2|完成', '@0', 'Right');
INSERT INTO `transition` VALUES ('e7b8630fee0c423bb3396d4b40a252b6', '8bed108da3ac46fd9ac0f443d2d03e9a', '4c9b7b5154b447b7b6a9dfcb263ca862', '8a163c245a624075ba9489b5d6161906', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('e8af4eeb5ee64c17b62bf1aad9f0a016', 'cc4748f66cf34a22bae6718c2eaf8194', 'fe2f8f40d23911eaaa2207ad01666ef1', '7eca1350d23a11eaaa2207ad01666ef1', '@0==2||@0==court', '2|court', '@0', 'Right');
INSERT INTO `transition` VALUES ('e9c9ef49033f477ca6914668119da711', '220c7d9d48844bc8a131811beaddfd36', '3f1424f0c0e511eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('eaff446c272d4a0f9d3787ee911d5a58', 'de1e2b7f1a8f4690a29e71ca448856aa', '32bf4230d2ff11ea87de4f72b22c127f', 'eeadc340d2ff11ea87de4f72b22c127f', '@0==1||@0==适应症', '1|适应症', '@0', 'Right');
INSERT INTO `transition` VALUES ('eb620505ccc249289e0f901591fbadbd', 'f2c2ef95e71441c2907a9d0be26eb6da', 'a50f8d50a9eb11ea91be7f259e1bd9ba', 'e320d590a9eb11ea91be7f259e1bd9ba', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('eb859557cce640ad8968dd0fef5cdb8b', '220c7d9d48844bc8a131811beaddfd36', '80f456e0c0e211eabc5cbf4ccf21b331', '156cb130c0e511eabc5cbf4ccf21b331', '@0==4||@0==法定代表人||@0==法人', '4|法定代表人|法人', '@0', 'Right');
INSERT INTO `transition` VALUES ('ecc4598182c241a3946a5b755a3c2c1f', 'da62a3ab61ed4f6494c5d89292d12c50', '0916e3d0c01611eab1dd2bae4f3c75e3', '967c5ef0c01911eab1dd2bae4f3c75e3', '@0==7||@0==控制||@0==控股', '7|控制|控股', '@0', 'Right');
INSERT INTO `transition` VALUES ('ecc9081a6808447a884cb3f2fc2f7763', '20ac7c045eeb49f6bb6e835804087977', '8d73916652dd4131bf5c322608d90e19', '84b53d010485448e80b74aad9842357b', NULL, NULL, NULL, NULL);
INSERT INTO `transition` VALUES ('ecf9ab87e7ba4ef4873af7695b0de60b', '3d91fcf9421a4ad9bc9abee8a00185aa', '602a5e50c01f11eab1dd2bae4f3c75e3', '83d169c0c01f11eab1dd2bae4f3c75e3', '@0==3||@0==配套', '3|配套', '@0', 'Right');
INSERT INTO `transition` VALUES ('ed4e575245b54c4791fe146087d0c6f5', 'd58a95004efe43c0bc32b20c0b76606c', '2b134300bcd511eaa872912b9807cf65', '4f3af020bcd511eaa872912b9807cf65', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('ee659f1049984ee490e83b418bb7e1c7', 'a7cd48c9efd24b879217d337402fb64d', 'db5f72d0c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('f0ab4372ea834c0e97d6cc6e8b2b3ab0', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '80781030a96311ea8a7e11d4ec826f36', '@0==6||@0==调休||@0==补休', '6|调休|补休', '@0', 'Right');
INSERT INTO `transition` VALUES ('f148d43b4524459a8487928f41ef7e8a', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'd0416110c02511eab1dd2bae4f3c75e3', '@0==1||@0==重新认定', '1|重新认定', '@0', 'Right');
INSERT INTO `transition` VALUES ('f22d9a84137843eaa08d45c7a8b2e99a', 'e0911f1790604654a9ff63a6d59b4e63', 'bb77a440a96611ea8a7e11d4ec826f36', 'd37b4150a96611ea8a7e11d4ec826f36', '@0==流产', '流产', '@0', 'Right');
INSERT INTO `transition` VALUES ('f24efad2626a444ab84fc95dcb983b7c', 'a7cd48c9efd24b879217d337402fb64d', '35cbe7b0c00011ea9c95a96aec82f490', 'e32e0b70c02511eab1dd2bae4f3c75e3', '@0==12||@0==从业人数||@0==就业人数', '12|从业人数|就业人数', '@0', 'Right');
INSERT INTO `transition` VALUES ('f429b5817bd34dacadb3cc95b9b1fb9b', 'e0911f1790604654a9ff63a6d59b4e63', '5a01e9c0a96411ea8a7e11d4ec826f36', 'bfbd9d40a96411ea8a7e11d4ec826f36', '@0==2||@0==上海', '2|上海', '@0', 'Right');
INSERT INTO `transition` VALUES ('f4765a26bc594c24a85014816dbc4d2e', 'e45a7d751a74414b88d3dc82bd66c863', '07742cf0a9f411ea91be7f259e1bd9ba', '156eaab0a9f411ea91be7f259e1bd9ba', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('f4ba50c731244cb7b7b832f26da5ff74', '04390ed6f99f477dac7d98d051dca6e1', 'd161aff0bcc911ea9ce23960bec20268', '434bf040bcc911ea9ce23960bec20268', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('f56b1f89a32840dc8d06bb28e6698b58', '220c7d9d48844bc8a131811beaddfd36', 'a56efea0c0e511eabc5cbf4ccf21b331', 'd4c670c0c0e511eabc5cbf4ccf21b331', NULL, NULL, NULL, 'Left');
INSERT INTO `transition` VALUES ('f6e9a96e894948969cc74728bc585c07', 'e0911f1790604654a9ff63a6d59b4e63', '79e918f0a96211ea8a7e11d4ec826f36', '77d4e980a96311ea8a7e11d4ec826f36', '@0==3||@0==事假', '3|事假', '@0', 'Right');
INSERT INTO `transition` VALUES ('f85266a29d24418eaf4cdd9c4cc4dee5', 'e0911f1790604654a9ff63a6d59b4e63', '13b64760a96711ea8a7e11d4ec826f36', '447e67e0a96411ea8a7e11d4ec826f36', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('f8dc37530b2947c2be8c00844b2b3bd2', 'e0911f1790604654a9ff63a6d59b4e63', '5a01e9c0a96411ea8a7e11d4ec826f36', 'c1e9a500a96411ea8a7e11d4ec826f36', '@0==3||@0==西安', '3|西安', '@0', 'Right');
INSERT INTO `transition` VALUES ('fac994f27b6f4becb0c14d5bcf721cda', '04390ed6f99f477dac7d98d051dca6e1', '6820cd50bcc911ea9ce23960bec20268', '8da91be0bcc911ea9ce23960bec20268', '@0==手机||@0==电话', '手机|电话', '@0', 'Right');
INSERT INTO `transition` VALUES ('faff9b5c9ab44fd5b7c532ed3b52dc34', 'e0911f1790604654a9ff63a6d59b4e63', '737c5a40a96211ea8a7e11d4ec826f36', '78d055f0a96211ea8a7e11d4ec826f36', '', '', NULL, 'Right');
INSERT INTO `transition` VALUES ('fdccf78b907a43cfae81c04517b9cffc', 'a7cd48c9efd24b879217d337402fb64d', 'def1c150c02511eab1dd2bae4f3c75e3', 'f69ac5d0c02611eab1dd2bae4f3c75e3', '', '', NULL, 'Left');
INSERT INTO `transition` VALUES ('fec7f0bf19064c0b9e39f8a7c202e9e5', '7a91ee330f03454c8b0eb64e4a08b04f', '1414ab10b16a11ea84abb32d92922ac7', '60a70630b16a11ea84abb32d92922ac7', '@0==2||@0==3||@0==4||@0==上海||@0==西安||@0==苏州', '2|3|4|上海|西安|苏州', '@0', 'Right');
INSERT INTO `transition` VALUES ('ff29a1c883be4be583b7ffdc03a4f307', 'e0911f1790604654a9ff63a6d59b4e63', '5e8dda80a96411ea8a7e11d4ec826f36', '06696430a96611ea8a7e11d4ec826f36', '@0==1||@0==北京', '1|北京', '@0', 'Right');
INSERT INTO `transition` VALUES ('ff42616686c54d9da4fcef3b2442590e', 'de1e2b7f1a8f4690a29e71ca448856aa', 'eeadc340d2ff11ea87de4f72b22c127f', '7a8b1f20d30011ea87de4f72b22c127f', '', '', NULL, 'Left');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `role` bigint NULL DEFAULT NULL,
  `creation_time` datetime(3) NULL DEFAULT NULL,
  `last_login` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('238c62820e8c4dcb97d53ba395568cd8', 'liuying11@beyondsoft.com', 'pbkdf2_sha256$36000$JgeKf1AZEBQF$P1qYC2uER+Pi/HCyBx6qr2fItHxaWQ8F3PPQzzU9ZjM=', 2, '2020-05-24 20:17:34.619', '2020-06-08 09:28:26.761');
INSERT INTO `user_info` VALUES ('31904579348e48afac33a1bb59f49099', 'admin', '$2a$10$AEn1nTK1O/giRPNlGOyAIeaoLlIV4lFhgI.sHTvT..stDQ/5L1Yve', 0, '2021-11-16 10:46:13.458', '2021-11-16 10:46:13.458');
INSERT INTO `user_info` VALUES ('805bd25be73248738a64a267a9d1b438', 'zhangxinlei@beyondsoft.com', 'pbkdf2_sha256$36000$2ilG71r5wMji$qVmFBXMCmWjsQG2mgSbOXt76Zh38v9WaKElDZ/Ww7HU=', 2, '2020-05-24 20:17:49.012', '2020-06-03 09:14:32.196');
INSERT INTO `user_info` VALUES ('8473b560d7e548d99f15141d1036e9a2', 'xinhui@beyondsoft.com', 'pbkdf2_sha256$36000$wAJRzio3EI7r$TTqhPizVKN+OONJ9ThZagjfMRdEa2aV4qEGOieqioP8=', 2, '2020-05-24 20:16:06.443', '2020-06-05 10:04:34.329');
INSERT INTO `user_info` VALUES ('87494c62fb5e47d5bdada7688a177cbf', 'zhujing07@beyondsoft.com', 'pbkdf2_sha256$36000$hUB3K7KgLvX0$HuHqInSM8fwbmnwfkKrgkzlB8oziWCiKu/LXX9zIxyc=', 2, '2020-05-24 20:16:23.650', '2020-06-05 15:38:35.784');
INSERT INTO `user_info` VALUES ('fac3c0722f46495b9a540125b8cfad53', 'admin05', 'pbkdf2_sha256$36000$bbKcaldeE0Oe$Szf8XX4NhPfCYMMRekIhYepqJF4SMLf59cygBNgyLSo=', 2, '2020-05-24 20:18:01.431', '2020-06-09 11:04:40.200');

SET FOREIGN_KEY_CHECKS = 1;
