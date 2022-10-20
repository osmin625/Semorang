CREATE TABLE RECEIPT(
receipt_id VARCHAR(11) NOT NULL,
receipt_date DATE,
receipt_image_metadata BLOB
);

--DROP TABLE VERIFY;
CREATE TABLE VERIFY(
verify_id VARCHAR(11) NOT NULL,
receipt_id VARCHAR(11),
thing_id VARCHAR(11),
user_id VARCHAR(11),
verify_date DATE,
PRIMARY KEY (verify_id)
);

--DROP TABLE USERS;
CREATE TABLE USERS(
user_id VARCHAR(11) NOT NULL,
password VARCHAR(15),
name VARCHAR(30) NOT NULL,
region VARCHAR(20),
phone_number VARCHAR(13) NOT NULL,
PRIMARY KEY(user_id),
UNIQUE(phone_number)
);

--DROP TABLE FOLLOW;
CREATE TABLE FOLLOW(
follow_id VARCHAR(11) NOT NULL,
following_uid VARCHAR(11),
follow_uid VARCHAR(11),
follow_date DATE,
PRIMARY KEY(follow_id)
);

--DROP TABLE THING;
CREATE TABLE THING(
thing_id NUMBER(8) NOT NULL,
admin_id VARCHAR(11),
thing_name VARCHAR(30) NOT NULL,
categories VARCHAR(6),
latitude NUMBER(18,15),
longitude NUMBER(18,15),
sido VARCHAR2(15),
sigoongoo VARCHAR2(15),
bubjungdong VARCHAR2(15),
PRIMARY KEY(thing_id),
UNIQUE(thing_name)
);

--DROP TABLE THINGRANK;
CREATE TABLE THINGRANK(
thing_rank_id VARCHAR(11) NOT NULL,
thing_id VARCHAR(11),
user_id VARCHAR(11),
ranks NUMBER(9),
thingking_date DATE,
update_date DATE,
PRIMARY KEY(thing_rank_id)
);

--DROP TABLE ADMIN;
CREATE TABLE ADMIN(
admin_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
PRIMARY KEY(admin_id)
);

DROP TABLE RANKING_SNAPSHOT;
CREATE TABLE RANKING_SNAPSHOT(
snapshot_id VARCHAR(11) NOT NULL,
thing_rank_id VARCHAR(11),
user_id VARCHAR(11),
content VARCHAR(3000) NOT NULL,
taken_date DATE,
update_date DATE,
like_count NUMBER(10),
dislike_count NUMBER(10),
PRIMARY KEY(snapshot_id)
);
CREATE TABLE SNAPSHOT_COMMENT(
comment_id VARCHAR(11) NOT NULL,
snapshot_id VARCHAR(11),
user_id VARCHAR(11),
comments VARCHAR(300),
write_date DATE,
update_date DATE,
PRIMARY KEY(comment_id)
);

commit;


-----------------------INSERT--------------------------
--ADMIN
INSERT INTO Admin VALUES ('admin_1', 'pw1343642');
INSERT INTO Admin VALUES ('admin_2', 'pw7637746');
INSERT INTO Admin VALUES ('admin_3', 'pw4954350');
INSERT INTO Admin VALUES ('admin_4', 'pw6515929');
INSERT INTO Admin VALUES ('admin_5', 'pw0938595');
INSERT INTO Admin VALUES ('admin_6', 'pw8357651');
INSERT INTO Admin VALUES ('admin_7', 'pw7622800');
INSERT INTO Admin VALUES ('admin_8', 'pw4453871');
INSERT INTO Admin VALUES ('admin_9', 'pw2287622');
INSERT INTO Admin VALUES ('admin_10', 'pw9014274');
--------------------------------------------------------
--USER
INSERT INTO Users VALUES ('user_1', 'pw1343642', '민서호', '대구 서구', '01076096244');
INSERT INTO Users VALUES ('user_2', 'pw4722452', '조지윤', '대구 북구', '01089331704');
INSERT INTO Users VALUES ('user_3', 'pw3898088', '임민연', '대구 수성구', '01080182636');
INSERT INTO Users VALUES ('user_4', 'pw5911534', '이하준', '대구 북구', '01064954613');
INSERT INTO Users VALUES ('user_5', 'pw0092049', '고주진', '대구 서구', '01072585260');
INSERT INTO Users VALUES ('user_6', 'pw5276294', '오윤연', '대구 중구', '01023086654');
INSERT INTO Users VALUES ('user_7', 'pw2187810', '윤도준', '대구 달서구', '01091626983');
INSERT INTO Users VALUES ('user_8', 'pw9221885', '이예진', '대구 북구', '01074314666');
INSERT INTO Users VALUES ('user_9', 'pw8955753', '전채서', '대구 중구', '01028415936');
INSERT INTO Users VALUES ('user_10', 'pw9734514', '윤채서', '대구 서구', '01024273997');
INSERT INTO Users VALUES ('user_11', 'pw7974042', '조지우', '대구 동구', '01088273202');
INSERT INTO Users VALUES ('user_12', 'pw7758376', '전하윤', '대구 수성구', '01050842648');
INSERT INTO Users VALUES ('user_13', 'pw7784426', '장주후', '대구 수성구', '01002957496');
INSERT INTO Users VALUES ('user_14', 'pw0434872', '전현은', '대구 수성구', '01017034919');
INSERT INTO Users VALUES ('user_15', 'pw5022385', '김지아', '대구 서구', '01051377166');
INSERT INTO Users VALUES ('user_16', 'pw9524673', '임하연', '대구 수성구', '01054799630');
INSERT INTO Users VALUES ('user_17', 'pw9571162', '김주아', '대구 동구', '01077739718');
INSERT INTO Users VALUES ('user_18', 'pw2054852', '김윤후', '대구 동구', '01041340004');
INSERT INTO Users VALUES ('user_19', 'pw8133515', '조하준', '대구 서구', '01059985518');
INSERT INTO Users VALUES ('user_20', 'pw8045694', '권예아', '대구 달서구', '01009160140');
INSERT INTO Users VALUES ('user_21', 'pw5510291', '민도준', '대구 북구', '01086807809');
INSERT INTO Users VALUES ('user_22', 'pw4529987', '오도원', '대구 북구', '01079728771');
INSERT INTO Users VALUES ('user_23', 'pw1846101', '정서우', '대구 중구', '01052738039');
INSERT INTO Users VALUES ('user_24', 'pw1681449', '정지호', '대구 수성구', '01032200176');
INSERT INTO Users VALUES ('user_25', 'pw4737710', '김도서', '대구 서구', '01079620301');
INSERT INTO Users VALUES ('user_26', 'pw2584208', '정채원', '대구 달서구', '01097555343');
INSERT INTO Users VALUES ('user_27', 'pw2253740', '조예준', '대구 서구', '01070460562');
INSERT INTO Users VALUES ('user_28', 'pw6781757', '장지진', '대구 남구', '01052389543');
INSERT INTO Users VALUES ('user_29', 'pw0307002', '권현후', '대구 북구', '01073745125');
INSERT INTO Users VALUES ('user_30', 'pw1256833', '최민호', '대구 달서구', '01007644615');
INSERT INTO Users VALUES ('user_31', 'pw9171763', '정예서', '대구 남구', '01000848026');
INSERT INTO Users VALUES ('user_32', 'pw8787178', '김현원', '대구 남구', '01082791315');
INSERT INTO Users VALUES ('user_33', 'pw8698864', '오현아', '대구 서구', '01020040745');
INSERT INTO Users VALUES ('user_34', 'pw0990253', '임지서', '대구 서구', '01010442422');
INSERT INTO Users VALUES ('user_35', 'pw6659575', '정채연', '대구 중구', '01061212836');
INSERT INTO Users VALUES ('user_36', 'pw4023247', '정민우', '대구 달서구', '01032774070');
INSERT INTO Users VALUES ('user_37', 'pw9870497', '오예후', '대구 남구', '01026653545');
INSERT INTO Users VALUES ('user_38', 'pw0964051', '조채후', '대구 달서구', '01098550822');
INSERT INTO Users VALUES ('user_39', 'pw2346404', '전민윤', '대구 남구', '01016655255');
INSERT INTO Users VALUES ('user_40', 'pw5382087', '정하은', '대구 중구', '01033885158');
INSERT INTO Users VALUES ('user_41', 'pw1139129', '최현연', '대구 동구', '01055117047');
INSERT INTO Users VALUES ('user_42', 'pw1042749', '김주윤', '대구 달서구', '01099123337');
INSERT INTO Users VALUES ('user_43', 'pw1473283', '박하윤', '대구 북구', '01057078152');
INSERT INTO Users VALUES ('user_44', 'pw2237140', '이도후', '대구 동구', '01053429418');
INSERT INTO Users VALUES ('user_45', 'pw1143161', '고도윤', '대구 달서구', '01029573793');
INSERT INTO Users VALUES ('user_46', 'pw6136769', '김서서', '대구 달서구', '01088506007');
INSERT INTO Users VALUES ('user_47', 'pw0400235', '최현서', '대구 북구', '01045090861');
INSERT INTO Users VALUES ('user_48', 'pw6808900', '박서서', '대구 달서구', '01097026403');
INSERT INTO Users VALUES ('user_49', 'pw9092227', '정채호', '대구 중구', '01010012914');
INSERT INTO Users VALUES ('user_50', 'pw6520501', '김민준', '대구 수성구', '01059657064');
-----------------------------------------------------------
--THING
INSERT INTO Thing VALUES (17050121, 'admin_1', '사월동버거', 'Q01A01', 128.712138415124, 35.8366126400214, '대구광역시', '수성구', '신매동');
INSERT INTO Thing VALUES (18390076, 'admin_1', '눈꽃을나누다', 'Q01A01', 128.596390517262, 35.9193801029699, '대구광역시', '북구', '서변동');
INSERT INTO Thing VALUES (23178356, 'admin_1', '종가집곰탕', 'Q01A09', 128.560535960223, 35.8347744268347, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (16642883, 'admin_1', '동인정취', 'Q12A01', 128.607423137614, 35.8696081145262, '대구광역시', '중구', '동인동4가');
INSERT INTO Thing VALUES (16630137, 'admin_1', '신참떡볶이', 'Q04A03', 128.549755858937, 35.8621704945672, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (16947896, 'admin_2', '황금쭈꾸미집', 'Q03A13', 128.561753377202, 35.9429632964784, '대구광역시', '북구', '동천동');
INSERT INTO Thing VALUES (17163701, 'admin_2', '바디메이트', 'Q01A01', 128.618193489237, 35.851950355993, '대구광역시', '수성구', '수성동3가');
INSERT INTO Thing VALUES (16410914, 'admin_2', '대옥생고기', 'Q01A01', 128.560312777151, 35.8675657275681, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (26431599, 'admin_2', '카네기홀', 'Q06A01', 128.623988765222, 35.8921463208189, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (25592608, 'admin_2', '소나무', 'Q01A99', 128.633851883649, 35.8579977713033, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (18120193, 'admin_3', '상무초밥', 'Q03A03', 128.623047799597, 35.8611007480728, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (26303950, 'admin_3', '엘지커피솝', 'Q12A01', 128.529087830889, 35.8295089939804, '대구광역시', '달서구', '월성동');
INSERT INTO Thing VALUES (23266088, 'admin_3', '자기야', 'Q09A01', 128.558805717025, 35.8642558726644, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (18118531, 'admin_3', '위치위치샌드위치월성', 'Q07A05', 128.513265764864, 35.816571363996, '대구광역시', '달서구', '유천동');
INSERT INTO Thing VALUES (25292488, 'admin_3', '굽네치킨대구메트로점', 'Q05A08', 128.643713373685, 35.8643988012267, '대구광역시', '수성구', '만촌동');
INSERT INTO Thing VALUES (15955832, 'admin_4', '미송식당', 'Q01A01', 128.70838476848, 35.8675860915438, '대구광역시', '동구', '서호동');
INSERT INTO Thing VALUES (19913970, 'admin_4', '고향맛식당', 'Q01A01', 128.582383770191, 35.8995928485756, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (18095238, 'admin_4', '프랭크버거', 'Q07A04', 128.640578544071, 35.8215666327202, '대구광역시', '수성구', '범물동');
INSERT INTO Thing VALUES (17852141, 'admin_4', '피자스쿨', 'Q07A01', 128.554071901999, 35.8554808586959, '대구광역시', '달서구', '두류동');
INSERT INTO Thing VALUES (12518380, 'admin_4', '똘방천', 'Q01A01', 128.623802680127, 35.8797181109509, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (18070554, 'admin_5', '직화볶음찜닭볶찜', 'Q05A04', 128.54610549266, 35.8481624988764, '대구광역시', '달서구', '성당동');
INSERT INTO Thing VALUES (16731142, 'admin_5', '라브디저트공방', 'Q08A01', 128.639561537614, 35.8782382002656, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (12661454, 'admin_5', '명덕총각족발태전점', 'Q01A08', 128.552040419664, 35.9297049593694, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (18013943, 'admin_5', '제육대가', 'Q01A01', 128.611205682604, 35.8848663058466, '대구광역시', '북구', '대현동');
INSERT INTO Thing VALUES (16679243, 'admin_5', '파스쿠찌', 'Q12A01', 128.622512658466, 35.853550439849, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (17470753, 'admin_6', '애프터파스타', 'Q01A01', 128.612988400266, 35.8445410955557, '대구광역시', '수성구', '중동');
INSERT INTO Thing VALUES (12074539, 'admin_6', '충청도집', 'Q01A01', 128.604513036859, 35.8392752193513, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (26248029, 'admin_6', '세시봉', 'Q09A01', 128.521216247119, 35.8545552865201, '대구광역시', '달서구', '용산동');
INSERT INTO Thing VALUES (25709407, 'admin_6', '속시원한대구탕', 'Q03A08', 128.646784342538, 35.8157739232522, '대구광역시', '수성구', '범물동');
INSERT INTO Thing VALUES (17063413, 'admin_6', '심야식당스툴', 'Q13A01', 128.596706080429, 35.8713743325817, '대구광역시', '중구', '문화동');
INSERT INTO Thing VALUES (17856847, 'admin_7', '김밥엔부산어묵', 'Q04A01', 128.619036371749, 35.8834652146412, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (18042774, 'admin_7', '집밥한입만', 'Q01A01', 128.617677125181, 35.8752972447562, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (19994629, 'admin_7', '대구막창솟대마을', 'Q01A03', 128.654838356541, 35.8788138572229, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (16726942, 'admin_7', '스타벅스', 'Q12A01', 128.480147916509, 35.8538971823181, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (17720028, 'admin_7', '순수닭다리살1.1치킨', 'Q05A08', 128.521961420862, 35.8567603047929, '대구광역시', '달서구', '용산동');
INSERT INTO Thing VALUES (17572409, 'admin_8', '술꽃포차', 'Q09A02', 128.456517895131, 35.8687350314028, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (17262371, 'admin_8', '미향돼지국밥', 'Q01A01', 128.629962791584, 35.8758283191376, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (25290079, 'admin_8', '장수상회', 'Q01A01', 128.641664305033, 35.8656986499569, '대구광역시', '수성구', '만촌동');
INSERT INTO Thing VALUES (25755835, 'admin_8', '대해생고기', 'Q01A02', 128.642159982315, 35.8681205522564, '대구광역시', '수성구', '만촌동');
INSERT INTO Thing VALUES (16718508, 'admin_8', '우야꼬닭강정', 'Q05A08', 128.725670413858, 35.8712684491934, '대구광역시', '동구', '신서동');
INSERT INTO Thing VALUES (20546259, 'admin_9', '이모네식당', 'Q01A01', 128.612532457535, 35.8960719436259, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (23382779, 'admin_9', '옛날통닭', 'Q05A08', 128.713512201957, 35.8688806834395, '대구광역시', '동구', '동호동');
INSERT INTO Thing VALUES (26390340, 'admin_9', '자매칼국수', 'Q04A01', 128.61188419773, 35.8434651327899, '대구광역시', '수성구', '중동');
INSERT INTO Thing VALUES (16060477, 'admin_9', '쉼커피', 'Q01A01', 128.568581732274, 35.9507996000587, '대구광역시', '북구', '학정동');
INSERT INTO Thing VALUES (17126506, 'admin_9', '포도다방', 'Q12A01', 128.563556622217, 35.8878032705359, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (18223652, 'admin_10', '청솔로9', 'Q12A01', 128.608479923718, 35.8803735473643, '대구광역시', '북구', '대현동');
INSERT INTO Thing VALUES (25458448, 'admin_10', '왕소금구이', 'Q01A99', 128.631461166517, 35.8259772957524, '대구광역시', '수성 구', '지산동');
INSERT INTO Thing VALUES (23317507, 'admin_10', '다빈치', 'Q12A01', 128.574750902372, 35.8596920597945, '대구광역시', '남구', ' 대명동');
INSERT INTO Thing VALUES (19914111, 'admin_10', '청도추어탕', 'Q01A01', 128.478247675291, 35.854571744264, '대구광역시', '달서', '호산동');
INSERT INTO Thing VALUES (26070557, 'admin_10', '네네치킨화원점', 'Q05A08', 128.495664465549, 35.7978073003374, '대구광역시', '달성군', '화원읍');
------------------------------------------------
--THINGRANK
INSERT INTO THINGRANK (THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE)
VALUES ('for_match1', '23266088', 'user_39', 0, '1999-9-9', '1999-9-9');
INSERT INTO THINGRANK (THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE)
VALUES ('for_match2', '17126506', 'user_20', 0, '2000-1-29', '2021-12-14');
INSERT INTO THINGRANK (THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE)
VALUES ('for_match3', '26070557', 'user_8', 0, '2002-5-5', '2022-9-12');
INSERT INTO THINGRANK (THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE)
VALUES ('for_match4', '23317507', 'user_47', 0, '2006-3-6', '2022-3-15');
INSERT INTO THINGRANK (THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE)
VALUES ('for_match5', '19994629', 'user_11', 0, '1999-11-22', '2006-9-2');
------------------------------------------------
--RECEIPT
INSERT INTO RECEIPT VALUES('receipt1', '2000-1-2','http://img1.jpg');
INSERT INTO RECEIPT VALUES('receipt2', '2021-3-4','http://img2.jpg');
INSERT INTO RECEIPT VALUES('receipt3', '2020-5-6','http://img3.jpg');
INSERT INTO RECEIPT VALUES('receipt4', '2019-7-8','http://img4.jpg');
INSERT INTO RECEIPT VALUES('receipt5', '2018-12-25','http://img5.jpg');
------------------------------------------------
--FOLLOW
INSERT INTO FOLLOW VALUES ('f00001','user_1', 'user_2','2005-10-10');
INSERT INTO FOLLOW VALUES ('f00002','user_1', 'user_4','2005-1-10');
INSERT INTO FOLLOW VALUES ('f00003','user_1', 'user_6','2005-10-6');
INSERT INTO FOLLOW VALUES ('f00004','user_9', 'user_7','2005-9-9');
INSERT INTO FOLLOW VALUES ('f00005','user_40', 'user_8','2005-11-11');
------------------------------------------------
--RANKING_SNAPSHOT
INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_1','for_match5', 'user_43','comment11','1111-11-11','2222-2-22',362,10);
INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_2','for_match4', 'user_3','comment11','1000-11-11','2222-2-22',324,1);
INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_3','for_match3', 'user_4','comment1231','1001-11-11','2121-12-12',315,0);
INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_4','for_match2', 'user_4','comment1151','1101-11-11','1523-2-22',362,5);
INSERT INTO RANKING_SNAPSHOT VALUES ('snapshot_5','for_match1', 'user_43','comment1771','1011-11-11','2142-10-22',362,12);
------------------------------------------------
--VERIFY (admin_id,신청한 날짜, 인증된 날짜) 추가 필요
INSERT INTO VERIFY VALUES ('verify1', 'receipt3', 20546259, 'user_11','4232-4-3');
INSERT INTO VERIFY VALUES ('verify2', 'receipt4', 26390340, 'user_5','1142-5-1');
INSERT INTO VERIFY VALUES ('verify3', 'receipt2', 26248029, 'user_23','4112-8-13');
INSERT INTO VERIFY VALUES ('verify4', 'receipt1', 23178356, 'user_18','2001-4-24');
INSERT INTO VERIFY VALUES ('verify5', 'receipt5', 17063413, 'user_1','1000-1-6');
--receipt_id 중복 제거 제약조건 추가 필요
------------------------------------------------
--SNAPSHOT_COMMENT
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment1','snapshot_2', 'user_45','commentcommentcommentcomment', '2030-11-5','9999-9-9');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment2','snapshot_1', 'user_22','i love myself.i love myself.i love myself.i love myself.', '2000-1-25','8888-8-8');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment3','snapshot_3', 'user_11','숨참고 love dive숨참고 love dive숨참고 love dive숨참고 love dive', '3000-3-31','7777-7-7');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment4','snapshot_5', 'user_4','빛이 나는 solo 빛이 나는 solo 빛이 나는 solo ', '2000-5-1','6666-6-6');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment5','snapshot_4', 'user_5','커플은 왜 존재할까 커플은 왜 존재할까 커플은 왜 존재할까 커플은 왜 존재할까 ', '1000-6-24','5555-5-5');
