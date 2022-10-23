DROP TABLE RECEIPT CASCADE CONSTRAINTS;
CREATE TABLE RECEIPT(
receipt_id VARCHAR(11) NOT NULL,
receipt_date DATE,
receipt_url VARCHAR(1000),
PRIMARY KEY (receipt_id)
);
commit;

DROP TABLE VERIFY;
CREATE TABLE VERIFY(
verify_id VARCHAR(11) NOT NULL,
receipt_id VARCHAR(11),
thing_id NUMBER(8),
user_id VARCHAR(11),
verify_date DATE,
PRIMARY KEY (verify_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_id) REFERENCES THING(thing_id) ON DELETE CASCADE,
FOREIGN KEY (receipt_id) REFERENCES RECEIPT(receipt_id) ON DELETE CASCADE
);


commit;
DROP TABLE USERS CASCADE CONSTRAINTS;
CREATE TABLE USERS(
user_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
name VARCHAR(30) NOT NULL,
region VARCHAR(20),
phone_number VARCHAR(13) NOT NULL,
PRIMARY KEY(user_id),
UNIQUE(phone_number)
);

DROP TABLE FOLLOW;
CREATE TABLE FOLLOW(
follow_id VARCHAR(11) NOT NULL,
following_uid VARCHAR(11) NOT NULL,
follower_uid VARCHAR(11) NOT NULL,
follow_date DATE,
PRIMARY KEY(follow_id),
FOREIGN KEY (follower_uid) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (following_uid) REFERENCES USERS(user_id) ON DELETE CASCADE
);
DELETE FROM FOLLOW 
WHERE FOLLOW.follow_id = 'f00106';
ALTER TABLE FOLLOW
    ADD UNIQUE (following_uid, follower_uid);

DROP TABLE THING CASCADE CONSTRAINTS;
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
UNIQUE(thing_name),
FOREIGN KEY (admin_id) REFERENCES ADMIN(admin_id) ON DELETE CASCADE
);

commit;

DROP TABLE THINGRANK CASCADE CONSTRAINTS;
CREATE TABLE THINGRANK(
thing_rank_id VARCHAR(11) NOT NULL,
thing_id NUMBER(8),
user_id VARCHAR(11),
ranks NUMBER(9),
thingking_date DATE,
update_date DATE,
PRIMARY KEY(thing_rank_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_id) REFERENCES THING(thing_id) ON DELETE CASCADE
);


DROP TABLE ADMIN CASCADE CONSTRAINTS;
CREATE TABLE ADMIN(
admin_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
PRIMARY KEY(admin_id)
);

DROP TABLE RANKING_SNAPSHOT CASCADE CONSTRAINTS;
CREATE TABLE RANKING_SNAPSHOT(
snapshot_id VARCHAR(11) NOT NULL,
thing_rank_id VARCHAR(11),
user_id VARCHAR(11),
content VARCHAR(3000) NOT NULL,
taken_date DATE,
update_date DATE,
like_count NUMBER(10),
dislike_count NUMBER(10),
PRIMARY KEY(snapshot_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_rank_id) REFERENCES THINGRANK(thing_rank_id) ON DELETE CASCADE
);

DROP TABLE SNAPSHOT_COMMENT;
CREATE TABLE SNAPSHOT_COMMENT(
comment_id VARCHAR(11) NOT NULL,
snapshot_id VARCHAR(11) NOT NULL,
user_id VARCHAR(11),
comments VARCHAR(300),
write_date DATE,
update_date DATE,
PRIMARY KEY(comment_id,snapshot_id),
FOREIGN KEY (snapshot_id) REFERENCES RANKING_SNAPSHOT(snapshot_id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE SET NULL
);

--ADMIN (done)
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
INSERT INTO Admin VALUES ('admin_11', 'pw0254458');
INSERT INTO Admin VALUES ('admin_12', 'pw9391491');
INSERT INTO Admin VALUES ('admin_13', 'pw2165993');
INSERT INTO Admin VALUES ('admin_14', 'pw0290407');
INSERT INTO Admin VALUES ('admin_15', 'pw4378875');
INSERT INTO Admin VALUES ('admin_16', 'pw2330844');
INSERT INTO Admin VALUES ('admin_17', 'pw2187810');
INSERT INTO Admin VALUES ('admin_18', 'pw2897816');
INSERT INTO Admin VALUES ('admin_19', 'pw8375779');
INSERT INTO Admin VALUES ('admin_20', 'pw6422943');
INSERT INTO Admin VALUES ('admin_21', 'pw9925434');
INSERT INTO Admin VALUES ('admin_22', 'pw1208899');
INSERT INTO Admin VALUES ('admin_23', 'pw7214844');
INSERT INTO Admin VALUES ('admin_24', 'pw9364405');
INSERT INTO Admin VALUES ('admin_25', 'pw8300356');
INSERT INTO Admin VALUES ('admin_26', 'pw3033685');
INSERT INTO Admin VALUES ('admin_27', 'pw8824790');
INSERT INTO Admin VALUES ('admin_28', 'pw5052838');
INSERT INTO Admin VALUES ('admin_29', 'pw0345258');
INSERT INTO Admin VALUES ('admin_30', 'pw7974042');
INSERT INTO Admin VALUES ('admin_31', 'pw1730074');
INSERT INTO Admin VALUES ('admin_32', 'pw7030407');
INSERT INTO Admin VALUES ('admin_33', 'pw3747030');
INSERT INTO Admin VALUES ('admin_34', 'pw5084264');
INSERT INTO Admin VALUES ('admin_35', 'pw5209384');
INSERT INTO Admin VALUES ('admin_36', 'pw4896935');
INSERT INTO Admin VALUES ('admin_37', 'pw0434872');
INSERT INTO Admin VALUES ('admin_38', 'pw9831877');
INSERT INTO Admin VALUES ('admin_39', 'pw3935996');
INSERT INTO Admin VALUES ('admin_40', 'pw5022385');
INSERT INTO Admin VALUES ('admin_41', 'pw7705231');
INSERT INTO Admin VALUES ('admin_42', 'pw8602897');
INSERT INTO Admin VALUES ('admin_43', 'pw5137716');
INSERT INTO Admin VALUES ('admin_44', 'pw5777948');
INSERT INTO Admin VALUES ('admin_45', 'pw2692794');
INSERT INTO Admin VALUES ('admin_46', 'pw9571162');
INSERT INTO Admin VALUES ('admin_47', 'pw7836552');
INSERT INTO Admin VALUES ('admin_48', 'pw8861795');
INSERT INTO Admin VALUES ('admin_49', 'pw8091399');
INSERT INTO Admin VALUES ('admin_50', 'pw5613578');
--------------------------------------------------------
--USER (done)
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
--THING (done)
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
INSERT INTO Thing VALUES (12481973, 'admin_11', '김민성아임넙띠기돈까스', 'Q06A02', 128.603036210479, 35.8664485481864, '대구광역시', '중구', '삼덕동2가');
INSERT INTO Thing VALUES (12436420, 'admin_11', '고모네', 'Q01A01', 128.637856749968, 35.8230322424839, '대구광역시', '수성구', '지산동');
INSERT INTO Thing VALUES (17255994, 'admin_11', '황태자먹태노가리', 'Q09A01', 128.440854262428, 35.7816523969114, '대구광역시', '달성군', '옥포읍');
INSERT INTO Thing VALUES (19921596, 'admin_11', '칼디커피', 'Q12A01', 128.610103893414, 35.8856200017284, '대구광역시', '북구', '대현동');
INSERT INTO Thing VALUES (17703377, 'admin_11', '아이스크림할인점', 'Q07A07', 128.544219877643, 35.9188707884948, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (17682374, 'admin_12', '진주손칼국수진천직영점', 'Q04A02', 128.525558306474, 35.8162568650889, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (16338022, 'admin_12', '참맛한정식', 'Q01A01', 128.418993111242, 35.6542612642419, '대구광역시', '달성군', '구지면');
INSERT INTO Thing VALUES (12476871, 'admin_12', '노랑통닭', 'Q05A08', 128.455289604105, 35.698169853102, '대구광역시', '달성군', '현풍읍');
INSERT INTO Thing VALUES (17146053, 'admin_12', '와룡시장상인협동조합', 'Q12A01', 128.497411281542, 35.8561433770875, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (20075144, 'admin_12', '청송식당', 'Q01A01', 128.579329128328, 35.9015003903981, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (20465199, 'admin_13', '보성떡집', 'Q08A03', 128.60720637466, 35.861515338515, '대구광역시', '중구', '대봉동');
INSERT INTO Thing VALUES (23352918, 'admin_13', '봉정코다리찜', 'Q01A01', 128.650275465447, 35.8896454331463, '대구광역시', '동구', '입석동');
INSERT INTO Thing VALUES (16601884, 'admin_13', '화덕생선구이어가', 'Q03A11', 128.521312889961, 35.8168702304042, '대구광역시', '달서구', '대천동');
INSERT INTO Thing VALUES (12569076, 'admin_13', '페리카나', 'Q05A08', 128.579450063237, 35.883130916607, '대구광역시', '서구', '원대동2가');
INSERT INTO Thing VALUES (14099261, 'admin_13', '캡틴커피', 'Q12A01', 128.687334633763, 35.8316735949202, '대구광역시', '수성구', '대흥동');
INSERT INTO Thing VALUES (19913471, 'admin_14', '중국성반점', 'Q02A00', 128.703118737714, 35.8656251165842, '대구광역시', '동구', '신기동');
INSERT INTO Thing VALUES (25878535, 'admin_14', '나그네전통음식', 'Q01A01', 128.673152586109, 35.9855987921924, '대구광역시', '동구', '신무동');
INSERT INTO Thing VALUES (16514320, 'admin_14', '골목커피', 'Q12A01', 128.582274930776, 35.8559694166058, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (20644893, 'admin_14', '우산식당', 'Q01A01', 128.594082514625, 35.8729826741269, '대구광역시', '중구', '향촌동');
INSERT INTO Thing VALUES (11775824, 'admin_14', '가을', 'Q09A07', 128.571857914537, 35.8792916173882, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (17529431, 'admin_15', '집어가', 'Q01A01', 128.561728099423, 35.9440900555828, '대구광역시', '북구', '동천동');
INSERT INTO Thing VALUES (12554711, 'admin_15', '샤이뜨루', 'Q06A01', 128.624842014074, 35.8258766874773, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (25286552, 'admin_15', '원조솥뚜껑식당', 'Q01A01', 128.544709140333, 35.8625179570867, '대구광역시', '서구', '중리동');
INSERT INTO Thing VALUES (11809663, 'admin_15', '양산숯불곰장어왕소금구이', 'Q03A07', 128.61885376987, 35.8813480561474, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (9420401, 'admin_15', '대구통닭', 'Q05A08', 128.495128370185, 35.8558012873676, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (11809011, 'admin_16', '애슐리', 'Q06A05', 128.640375439966, 35.821080998401, '대구광역시', '수성구', '범물동');
INSERT INTO Thing VALUES (18029486, 'admin_16', '아아수혈', 'Q12A01', 128.608759473176, 35.893747700913, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (16473542, 'admin_16', '안동생고기', 'Q01A02', 128.608881759321, 35.8692041495964, '대구광역시', '중구', '동인동4가');
INSERT INTO Thing VALUES (23238032, 'admin_16', '궁단란주점', 'Q09A10', 128.504330950889, 35.8543659562087, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (12137790, 'admin_16', '강남참숯갈비', 'Q01A02', 128.550537485543, 35.9191213969012, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (17531915, 'admin_17', '런투유', 'Q09A10', 128.597606183022, 35.8422841385734, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (17142014, 'admin_17', '깡통시장', 'Q09A01', 128.453366220453, 35.8636544567141, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (15985124, 'admin_17', '초이스생고기', 'Q01A02', 128.557341908291, 35.8655245263366, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (15875119, 'admin_17', '전주팔미콩나물국밥', 'Q01A01', 128.59290256548, 35.8453989841955, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (17479891, 'admin_17', '수성당베이커리', 'Q08A01', 128.721180436804, 35.8376943852987, '대구광역시', '수성구', '사월동');
INSERT INTO Thing VALUES (20505437, 'admin_18', '전주향', 'Q01A01', 128.510181215409, 35.8533407853304, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (25665879, 'admin_18', '배스킨라빈스31상인홈플러스점', 'Q07A07', 128.532565729343, 35.8182900782508, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (26137092, 'admin_18', '막걸리3000', 'Q09A04', 128.697262351764, 35.8632347039755, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (11984561, 'admin_18', '159센티미터', 'Q12A01', 128.575767552351, 35.8379742457009, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (26532984, 'admin_18', '흥주닭찜', 'Q05A08', 128.611892929585, 35.902213170598, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (17022068, 'admin_19', '크래프트한스', 'Q01A01', 128.618420631909, 35.8241613210294, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (17815005, 'admin_19', '아이린', 'Q09A07', 128.618622179225, 35.8942921767547, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (16327768, 'admin_19', '한마당', 'Q01A99', 128.499519075545, 35.851510815727, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (24899733, 'admin_19', '드레스카페', 'Q12A01', 128.636092675456, 35.8405092787649, '대구광역시', '수성구', '황금동');
INSERT INTO Thing VALUES (18142410, 'admin_19', '버건디Burgerndy', 'Q07A04', 128.546664042575, 35.9262504812352, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (25695137, 'admin_20', '바르미명품한우센터', 'Q06A01', 128.617441087227, 35.8291506964981, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (26395876, 'admin_20', '족발아저씨', 'Q01A02', 128.619807354843, 35.8786481953325, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (20107022, 'admin_20', '정동진', 'Q03A01', 128.632724302529, 35.8205807181382, '대구광역시', '수성구', '지산동');
INSERT INTO Thing VALUES (25643795, 'admin_20', '춘천옥냉면', 'Q01A19', 128.605634979294, 35.8703652388036, '대구광역시', '중구', '동인동1가');
INSERT INTO Thing VALUES (16388911, 'admin_20', '신마녀떡볶이', 'Q04A03', 128.624541518288, 35.894829372337, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (18024310, 'admin_21', '셀파파', 'Q12A07', 128.573829895709, 35.836361122411, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (17460253, 'admin_21', '삼색푸드', 'Q01A01', 128.468424242044, 35.8634795219379, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (16593735, 'admin_21', '봉구통닭', 'Q09A01', 128.591538785136, 35.8689573034131, '대구광역시', '중구', '종로2가');
INSERT INTO Thing VALUES (12327158, 'admin_21', '명랑시대쌀핫도그대구칠곡점', 'Q07A03', 128.561868277824, 35.9419713146426, '대구광역시', '북구', '동천동');
INSERT INTO Thing VALUES (17897656, 'admin_21', '삼형제분식', 'Q04A01', 128.540720402573, 35.8572451891689, '대구광역시', '서구', '중리동');
INSERT INTO Thing VALUES (23384338, 'admin_22', '화통삼', 'Q01A99', 128.457722102353, 35.8643950582093, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (26042643, 'admin_22', '궁전', 'Q08A03', 128.619515377893, 35.8809751050739, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (17813535, 'admin_22', '면미정식당', 'Q01A01', 128.62501549008, 35.8550516698857, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (19914666, 'admin_22', '대길식당', 'Q01A01', 128.599088521786, 35.8833500409082, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (16605998, 'admin_22', '라쿵푸마라탕', 'Q02A00', 128.495474669068, 35.8562955907758, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (23125534, 'admin_23', '커피위드또마', 'Q12A01', 128.517157062523, 35.8602962555208, '대구광역시', '달서구', '용산동');
INSERT INTO Thing VALUES (23311556, 'admin_23', '아이엠폴', 'Q06A01', 128.584184931676, 35.8476859799224, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (17116706, 'admin_23', '달콤', 'Q12A01', 128.564796153985, 35.9531248292886, '대구광역시', '북구', '학정동');
INSERT INTO Thing VALUES (12646099, 'admin_23', '삼시세때돼지국밥과보쌈반고개점', 'Q01A16', 128.572585824706, 35.8619376815197, '대구광역시', '달서구', '두류동');
INSERT INTO Thing VALUES (26050552, 'admin_23', '기장짚불곰장어기장수산', 'Q03A14', 128.53647372352, 35.8398956322587, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (20049525, 'admin_24', '대성식당', 'Q01A01', 128.578056653161, 35.8956118983031, '대구광역시', '북구', '노원동3가');
INSERT INTO Thing VALUES (15998122, 'admin_24', '바닷가', 'Q03A02', 128.592285443944, 35.8695935635911, '대구광역시', '중구', '동일동');
INSERT INTO Thing VALUES (19994629, 'admin_24', '대구막창솟대마을', 'Q01A03', 128.654838356541, 35.8788138572229, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (17453965, 'admin_24', '뭄뭄', 'Q03A02', 128.592814803198, 35.8663281655944, '대구광역시', '중구', '덕산동');
INSERT INTO Thing VALUES (9093795, 'admin_24', '김밥나라', 'Q04A01', 128.63945317728, 35.8771571949689, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (16597978, 'admin_25', '부산돼지국밥', 'Q01A05', 128.47362126666, 35.8734368477234, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (20526605, 'admin_25', '먹거리촌', 'Q01A01', 128.60411537674, 35.830624482011, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (12330934, 'admin_25', '루시드', 'Q12A01', 128.629248658652, 35.877950161861, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (16500910, 'admin_25', '대박국수', 'Q04A02', 128.591770470251, 35.8613940634588, '대구광역시', '중구', '남산동');
INSERT INTO Thing VALUES (16470826, 'admin_25', '가산식당', 'Q01A01', 128.586419695045, 35.8745435568145, '대구광역시', '중구', '수창동');
INSERT INTO Thing VALUES (18204388, 'admin_26', '치킨에취하닭', 'Q05A08', 128.542436148656, 35.9253953800343, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (18098901, 'admin_26', '핸썸커피', 'Q12A01', 128.60581630189, 35.892726066488, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (17098052, 'admin_26', '마라신', 'Q01A01', 128.695398859275, 35.862857937541, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (25705218, 'admin_26', '유가네닭갈비동성로점', 'Q05A02', 128.594337077167, 35.8699980398492, '대구광역시', '중구', '남일동');
INSERT INTO Thing VALUES (17067628, 'admin_26', '아마스빈', 'Q12A01', 128.540298711321, 35.8179220778546, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (19916179, 'admin_27', '왕곱배기냉면', 'Q01A19', 128.61818219958, 35.8946910216349, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (17050921, 'admin_27', '키친비', 'Q09A01', 128.617899992495, 35.8426592132446, '대구광역시', '수성구', '황금동');
INSERT INTO Thing VALUES (25842265, 'admin_27', '섭이네조개굽는집', 'Q03A09', 128.515863716261, 35.8093225288526, '대구광역시', '달서구', '대곡동');
INSERT INTO Thing VALUES (12449120, 'admin_27', '이조떡집', 'Q08A03', 128.699080136766, 35.8394834005432, '대구광역시', '수성구', '시지동');
INSERT INTO Thing VALUES (18336184, 'admin_27', '노랑통닭', 'Q05A08', 128.567562078362, 35.9477219404328, '대구광역시', '북구', '학정동');
INSERT INTO Thing VALUES (16200946, 'admin_28', '마실', 'Q01A02', 128.502623443741, 35.8557251035274, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (17567830, 'admin_28', '일곱가지분식', 'Q04A01', 128.639640764517, 35.874317042247, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (16739867, 'admin_28', '맵니떡볶이', 'Q04A03', 128.559225336341, 35.8325542489419, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (20648503, 'admin_28', '내안에', 'Q03A01', 128.617936022643, 35.8301756655955, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (11867481, 'admin_28', '천안문and배박사냉면', 'Q02A00', 128.516966634989, 35.8497244974151, '대구광역시', '달서구', '장기동');
INSERT INTO Thing VALUES (16629037, 'admin_29', '오덕후', 'Q01A01', 128.616068743482, 35.8635162253068, '대구광역시', '수성구', '수성동4가');
INSERT INTO Thing VALUES (17504910, 'admin_29', '달려라아구찜', 'Q01A01', 128.609103937358, 35.9011187288633, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (17920786, 'admin_29', '코봉이해물찜', 'Q03A05', 128.559870629868, 35.8314516228989, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (20787486, 'admin_29', '새궁전화관', 'Q09A06', 128.571578784205, 35.8789774832002, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (16628546, 'admin_29', '테엘푸드', 'Q01A01', 128.54584496584, 35.9263894051692, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (12090153, 'admin_30', '지상낙원황토오리가마구이', 'Q05A09', 128.490042076777, 35.7686359445515, '대구광역시', '달성군', '옥포읍');
INSERT INTO Thing VALUES (25640567, 'admin_30', '옛날화로', 'Q01A02', 128.609079209422, 35.9051206986788, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (23484438, 'admin_30', '고령한우진곰탕', 'Q01A09', 128.598020037296, 35.844328089543, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (25614358, 'admin_30', '복이이모순대국밥', 'Q10A05', 128.628674793323, 35.8754024330951, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (17988235, 'admin_30', '해물돼장', 'Q03A05', 128.584295744365, 35.8522281219131, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (25275677, 'admin_31', '투썸플레이스', 'Q12A01', 128.467228043395, 35.8521003851116, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (17090707, 'admin_31', '디저트먹는날,디데이', 'Q08A01', 128.623133080148, 35.8932053042131, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (16950407, 'admin_31', '교촌치킨', 'Q05A08', 128.615129249556, 35.9424763209117, '대구광역시', '북구', '연경동');
INSERT INTO Thing VALUES (17811607, 'admin_31', '다온', 'Q09A01', 128.464838503574, 35.6908594302734, '대구광역시', '달성군', '유가읍');
INSERT INTO Thing VALUES (21845405, 'admin_31', '현풍곰탕집', 'Q01A09', 128.439603529788, 35.7010584104597, '대구광역시', '달성군', '현풍읍');
INSERT INTO Thing VALUES (16015068, 'admin_32', '큰정할매순대국', 'Q10A05', 128.591173467213, 35.8451100650368, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (16013535, 'admin_32', '연이네족발', 'Q01A08', 128.557210961251, 35.8642182129569, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (17208040, 'admin_32', '삼대장', 'Q01A08', 128.551712590135, 35.8457393557726, '대구광역시', '달서구', '성당동');
INSERT INTO Thing VALUES (25481627, 'admin_32', '고니식탁', 'Q01A01', 128.608440849127, 35.8926406944923, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (25389085, 'admin_32', '맘스터치', 'Q07A04', 128.599068427029, 35.8380045720306, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (26120517, 'admin_33', '땡큐치킨', 'Q05A08', 128.609466414384, 35.8486600363841, '대구광역시', '수성구', '중동');
INSERT INTO Thing VALUES (17983935, 'admin_33', '파스타로', 'Q06A04', 128.699885609239, 35.8706823526978, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (25548904, 'admin_33', '황씨아저씨', 'Q01A01', 128.630024027683, 35.8681757926226, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (20646195, 'admin_33', '삼미식당', 'Q01A01', 128.564315352057, 35.8948300070911, '대구광역시', '북구', '노원동3가');
INSERT INTO Thing VALUES (26379575, 'admin_33', '장수촌추어탕', 'Q01A01', 128.581554647141, 35.8861942489169, '대구광역시', '북구', '노원동1가');
INSERT INTO Thing VALUES (16216254, 'admin_34', '정동막창식당', 'Q01A03', 128.561577623126, 35.8600698146702, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (23002862, 'admin_34', 'BBQ치킨', 'Q05A08', 128.614193702405, 35.8572886738567, '대구광역시', '수성구', '수성동2가');
INSERT INTO Thing VALUES (23494520, 'admin_34', '유채식당', 'Q01A01', 128.697376709914, 35.8687050335393, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (17143031, 'admin_34', '일하', 'Q01A01', 128.550809523434, 35.8544232790111, '대구광역시', '달서구', '두류동');
INSERT INTO Thing VALUES (16650978, 'admin_34', '마시그래이', 'Q12A01', 128.61124704095, 35.8585294989791, '대구광역시', '수성구', '수성동1가');
INSERT INTO Thing VALUES (25749267, 'admin_35', '육숫간', 'Q01A02', 128.560511960549, 35.8644011500898, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (28361389, 'admin_35', '차이나반점', 'Q02A00', 128.575523521396, 35.8777328515852, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (23460756, 'admin_35', '흥부네복바가지', 'Q01A01', 128.545273164526, 35.9447878349198, '대구광역시', '북구', '관음동');
INSERT INTO Thing VALUES (17570978, 'admin_35', '국민동태탕', 'Q03A99', 128.564090994679, 35.9318932183998, '대구광역시', '북구', '구암동');
INSERT INTO Thing VALUES (17479182, 'admin_35', '참치한마리', 'Q03A01', 128.638235559689, 35.8675646193534, '대구광역시', '수성구', '만촌동');
INSERT INTO Thing VALUES (12597850, 'admin_36', '훌랄라참숯바베큐', 'Q09A01', 128.52418951228, 35.8167766014613, '대구광역시', '달서구', '대천동');
INSERT INTO Thing VALUES (17464065, 'admin_36', '시스템', 'Q01A01', 128.717956379399, 35.8398227765604, '대구광역시', '수성구', '사월동');
INSERT INTO Thing VALUES (17132644, 'admin_36', '경성술집', 'Q01A01', 128.709802065123, 35.8402497682143, '대구광역시', '수성구', '신매동');
INSERT INTO Thing VALUES (17253438, 'admin_36', '다락방', 'Q12A01', 128.575380909584, 35.8733260693432, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (18288440, 'admin_36', '커피왕', 'Q12A01', 128.700131067627, 35.8721500673551, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (17497111, 'admin_37', '섧런抵도시락', 'Q06A01', 128.563344964393, 35.9438932029334, '대구광역시', '북구', '동천동');
INSERT INTO Thing VALUES (11756953, 'admin_37', '청송약수삼계탕', 'Q01A01', 128.718489362876, 35.8804960011825, '대구광역시', '동구', '각산동');
INSERT INTO Thing VALUES (15994388, 'admin_37', '국수랑밥이랑', 'Q01A01', 128.564378415654, 35.8865465759376, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (16099493, 'admin_37', '피시카페티', 'Q12A01', 128.555259448216, 35.8749439904359, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (20367198, 'admin_37', '장수돼지국밥', 'Q01A05', 128.562382897014, 35.8862855389912, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (16412407, 'admin_38', '파밍피자', 'Q07A01', 128.584989363779, 35.8517019786085, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (18537542, 'admin_38', '미소횟집', 'Q03A02', 128.58797610833, 35.8798537448682, '대구광역시', '북구', '고성동2가');
INSERT INTO Thing VALUES (17090598, 'admin_38', '캐슬앤틱', 'Q12A01', 128.536043197959, 35.8581674725061, '대구광역시', '달서구', '죽전동');
INSERT INTO Thing VALUES (16114987, 'admin_38', '백금당', 'Q12A01', 128.624754959853, 35.834538886325, '대구광역시', '수성구', '지산동');
INSERT INTO Thing VALUES (17122699, 'admin_38', 'JK푸드', 'Q01A99', 128.558600101821, 35.838100329784, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (16881485, 'admin_39', '투움바', 'Q06A01', 128.591792061224, 35.8523807158993, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (17264505, 'admin_39', '청담동찰닭칼국수', 'Q04A02', 128.531657292176, 35.8164824200901, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (12509736, 'admin_39', '심분열족발', 'Q01A01', 128.576466564987, 35.8901935972595, '대구광역시', '북구', '노원동2가');
INSERT INTO Thing VALUES (16957420, 'admin_39', '비산커피', 'Q12A01', 128.567486123313, 35.8719215044431, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (16727734, 'admin_39', '60계치킨', 'Q05A08', 128.617970780298, 35.9430025123422, '대구광역시', '북구', '연경동');
INSERT INTO Thing VALUES (12204312, 'admin_40', '고바슨커피코리아', 'Q12A01', 128.628800349639, 35.8660640998452, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (16112481, 'admin_40', '청실레스식당', 'Q09A01', 128.646377431939, 35.8774806648111, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (17838094, 'admin_40', '미락원', 'Q02A00', 128.493314217314, 35.856061121034, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (25726108, 'admin_40', '봉주루', 'Q02A00', 128.449254584833, 35.7273963382237, '대구광역시', '달성군', '논공읍');
INSERT INTO Thing VALUES (23611159, 'admin_40', '카페더붐', 'Q12A01', 128.481507711961, 35.8535672624937, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (16593852, 'admin_41', '좋은날', 'Q05A09', 128.462249669086, 35.8584559907182, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (16112340, 'admin_41', '땅땅치킨', 'Q05A08', 128.6812505836, 35.8411450770983, '대구광역시', '수성구', '연호동');
INSERT INTO Thing VALUES (18068854, 'admin_41', '1등선지국', 'Q01A01', 128.536454437768, 35.8189397737007, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (16977739, 'admin_41', '스윙스', 'Q01A01', 128.598951460359, 35.8666131925872, '대구광역시', '중구', '삼덕동1가');
INSERT INTO Thing VALUES (17102609, 'admin_41', '천하', 'Q01A01', 128.583295429615, 35.883427767939, '대구광역시', '북구', '고성동3가');
INSERT INTO Thing VALUES (16172668, 'admin_42', '윤성떡집', 'Q08A03', 128.515191718342, 35.8970697264495, '대구광역시', '북구', '사수동');
INSERT INTO Thing VALUES (22918863, 'admin_42', '본죽', 'Q10A01', 128.593908988183, 35.8823752959098, '대구광역시', '북구', '칠성동2가');
INSERT INTO Thing VALUES (17574140, 'admin_42', '단양추어탕', 'Q01A14', 128.540165436604, 35.8521461744884, '대구광역시', '달서구', '죽전동');
INSERT INTO Thing VALUES (23774296, 'admin_42', '해와달보리밥뷔페', 'Q01A16', 128.665727584154, 35.8804574929467, '대구광역시', '동구', '방촌동');
INSERT INTO Thing VALUES (16698203, 'admin_42', '청솔김치찜', 'Q01A01', 128.609124928836, 35.89373683489, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (23298307, 'admin_43', '부여식당', 'Q01A01', 128.642296397249, 35.9110765687495, '대구광역시', '동구', '불로동');
INSERT INTO Thing VALUES (17468890, 'admin_43', '하마카페', 'Q12A01', 128.560848669063, 35.8414608253694, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (15999456, 'admin_43', '든든한점심불타는저녁', 'Q01A99', 128.573758658689, 35.8602826629789, '대구광역시', '달서구', '두류동');
INSERT INTO Thing VALUES (16707725, 'admin_43', '대복한우리식육식당', 'Q01A02', 128.623706014659, 35.8475955173477, '대구광역시', '수성구', '황금동');
INSERT INTO Thing VALUES (11930142, 'admin_43', '용왕전복삼합', 'Q01A99', 128.617334308659, 35.8353703975243, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (26057111, 'admin_44', '까투리', 'Q09A01', 128.544156726417, 35.8594559522684, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (19951043, 'admin_44', '동대구롯데리아', 'Q07A04', 128.628726138595, 35.8790975727776, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (16674375, 'admin_44', '고집센그집갈비탕', 'Q03A05', 128.641378111915, 35.9098647037348, '대구광역시', '동구', '불로동');
INSERT INTO Thing VALUES (11854722, 'admin_44', '함박웃음', 'Q01A01', 128.666394330048, 35.8767583971407, '대구광역시', '동구', '방촌동');
INSERT INTO Thing VALUES (20649803, 'admin_44', '투다리식당', 'Q09A03', 128.615784876689, 35.8683307373791, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (18522378, 'admin_45', '미숙이네떡볶이', 'Q04A01', 128.526568806148, 35.8117547878727, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (17477656, 'admin_45', '진성아구찜', 'Q01A01', 128.493820203932, 35.8055032935703, '대구광역시', '달성군', '화원읍');
INSERT INTO Thing VALUES (20070521, 'admin_45', '내추럴하우스바이올가', 'Q13A03', 128.538866147928, 35.8188208271602, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (17249736, 'admin_45', '도미노피자', 'Q07A01', 128.520359294721, 35.8131879064547, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (26270475, 'admin_45', '신천수산', 'Q03A02', 128.557358786651, 35.8362944219373, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (17157848, 'admin_46', '개나리다방', 'Q12A01', 128.609746577387, 35.8447648924273, '대구광역시', '수성구', '중동');
INSERT INTO Thing VALUES (18403295, 'admin_46', '불꽃양대창', 'Q01A01', 128.537679758356, 35.8168432076777, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (16501433, 'admin_46', '모담', 'Q01A04', 128.560410918732, 35.8390292813329, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (16683604, 'admin_46', '스시201', 'Q03A02', 128.61991503566, 35.8313191729499, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (26487021, 'admin_46', '한국참집식당', 'Q01A01', 128.487034783047, 35.8014298880783, '대구광역시', '달성군', '화원읍');
INSERT INTO Thing VALUES (28449797, 'admin_47', '풍천민물장어', 'Q03A07', 128.614026648729, 35.9059517544529, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (20815992, 'admin_47', '채다올김밥', 'Q04A01', 128.534035769879, 35.8494064954732, '대구광역시', '달서구', '감삼동');
INSERT INTO Thing VALUES (17507358, 'admin_47', '홍천아지매식당', 'Q01A01', 128.613074252502, 35.8441891409088, '대구광역시', '수성구', '중동');
INSERT INTO Thing VALUES (17473877, 'admin_47', '고기택배가는남자', 'Q01A01', 128.731430861168, 35.8690883882482, '대구광역시', '동구', '신서동');
INSERT INTO Thing VALUES (12437090, 'admin_47', '영빈각', 'Q02A00', 128.600819319455, 35.8470721826231, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (12435353, 'admin_48', '바니', 'Q12A01', 128.551748141657, 35.8028989306059, '대구광역시', '달서구', '도원동');
INSERT INTO Thing VALUES (23199908, 'admin_48', '얼큰이한방닭도리탕코다리찜', 'Q05A03', 128.568161039288, 35.8423548454403, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (17470112, 'admin_48', '해성식당', 'Q01A01', 128.512071412624, 35.8528730677358, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (23388284, 'admin_48', '코인', 'Q09A08', 128.564426530585, 35.8683486502074, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (28483825, 'admin_48', '일식당엔', 'Q01A01', 128.538866147928, 35.8188208271602, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (17124038, 'admin_49', '어게인', 'Q09A01', 128.622072388392, 35.8326149497803, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (16985812, 'admin_49', '다닐', 'Q01A01', 128.62606379674, 35.879949704089, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (25729076, 'admin_49', '앞산닭두꺼비', 'Q05A01', 128.576071072789, 35.832492716033, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (23416953, 'admin_49', '오복반점', 'Q02A00', 128.502535002967, 35.8013210362807, '대구광역시', '달성군', '화원읍');
INSERT INTO Thing VALUES (16583037, 'admin_49', '풀하우스', 'Q06A07', 128.49086525386, 35.8700867996925, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (18120736, 'admin_50', '이스트라이트', 'Q10A04', 128.590640477067, 35.8941356043639, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (17273353, 'admin_50', '부영웰빙식당', 'Q01A01', 128.713304948303, 35.872937832262, '대구광역시', '동구', '각산동');
INSERT INTO Thing VALUES (19921500, 'admin_50', '맘모스식당', 'Q05A08', 128.568343990861, 35.8865999838135, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (16582110, 'admin_50', '엘스토리', 'Q06A07', 128.622512658466, 35.853550439849, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (17269292, 'admin_50', '도니푸드', 'Q01A01', 128.695620102286, 35.8704367315769, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (17172631, 'admin_51', '호시반점', 'Q02A00', 128.55674723998, 35.8644096408452, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (20609809, 'admin_51', '할매사골순대국', 'Q13A03', 128.536230747984, 35.8399778362561, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (25314581, 'admin_51', '소문난식당', 'Q01A01', 128.494681201579, 35.8551091058336, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (26353077, 'admin_51', '으뜸밥상', 'Q01A01', 128.584015056871, 35.8999815071134, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (12503052, 'admin_51', '대구식당', 'Q01A01', 128.486199689747, 35.873134229511, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (20256299, 'admin_52', '전주현대옥', 'Q01A01', 128.590873964991, 35.8703936773098, '대구광역시', '중구', '종로1가');
INSERT INTO Thing VALUES (16990914, 'admin_52', '조은레스', 'Q01A01', 128.561723774439, 35.8854864471768, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (17852964, 'admin_52', '생생회수산', 'Q03A01', 128.691608638403, 35.839517616046, '대구광역시', '수성구', '시지동');
INSERT INTO Thing VALUES (20088842, 'admin_52', '이모식당', 'Q01A01', 128.554175560643, 35.8799152845465, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (26071290, 'admin_52', '네모초밥', 'Q03A03', 128.523881252681, 35.8136503174059, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (23431481, 'admin_53', '병풍에그린닭이', 'Q05A04', 128.518818426344, 35.8042623375643, '대구광역시', '달서구', '대곡동');
INSERT INTO Thing VALUES (18099073, 'admin_53', '배스킨라빈스', 'Q07A07', 128.545888729868, 35.8246027315476, '대구광역시', '달서구', '송현동');
INSERT INTO Thing VALUES (20652402, 'admin_53', '멕시칸치킨', 'Q05A08', 128.547926305341, 35.8151114499266, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (17446520, 'admin_53', '이가네찐갈비', 'Q01A99', 128.544277471598, 35.8398605443956, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (25509676, 'admin_53', '서울왕족발', 'Q01A08', 128.52726264764, 35.859774632057, '대구광역시', '달서구', '용산동');
INSERT INTO Thing VALUES (17253649, 'admin_54', '신천아나고숯불포차', 'Q03A07', 128.617375383712, 35.8649516330479, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (17253327, 'admin_54', '정든집바다포차', 'Q09A07', 128.547268337543, 35.9126288291199, '대구광역시', '북구', '태전동');
INSERT INTO Thing VALUES (17456022, 'admin_54', '감칠맛', 'Q02A00', 128.618091129924, 35.8330500996506, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (25566350, 'admin_54', '또봉이통닭', 'Q05A08', 128.539328718271, 35.8430284924354, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (20750626, 'admin_54', '푸른시카고', 'Q06A01', 128.585984122082, 35.866523913052, '대구광역시', '중구', '동산동');
INSERT INTO Thing VALUES (16598253, 'admin_55', '고기부심', 'Q01A02', 128.621681444549, 35.8378356488095, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (17471834, 'admin_55', '샌드선샤인', 'Q12A01', 128.567654038978, 35.9481811745472, '대구광역시', '북구', '학정동');
INSERT INTO Thing VALUES (20459987, 'admin_55', '초원다방', 'Q12A01', 128.544558741791, 35.8583364865318, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (16357528, 'admin_55', '응급실국물떡볶이', 'Q04A01', 128.590501836288, 35.8918739759121, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (17508057, 'admin_55', '행복이있는그곳돈까스식당', 'Q06A02', 128.701707011163, 35.8423883693836, '대구광역시', '수성구', '매호동');
INSERT INTO Thing VALUES (17065522, 'admin_56', '헤일리', 'Q12A01', 128.563072825711, 35.8397739551717, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (25253901, 'admin_56', '봉수아피자', 'Q07A01', 128.558125555446, 35.8793742303962, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (19922725, 'admin_56', '돼지막창', 'Q01A03', 128.631927685739, 35.8861831607455, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (21837329, 'admin_56', '만보원가든', 'Q01A01', 128.500583993183, 35.6876965727508, '대구광역시', '달성군', '유가읍');
INSERT INTO Thing VALUES (12477080, 'admin_56', '지리산깜돈', 'Q01A99', 128.459088675438, 35.697803896674, '대구광역시', '달성군', '유가읍');
INSERT INTO Thing VALUES (16821033, 'admin_57', '봉평메밀막국수', 'Q04A02', 128.458764371044, 35.6932713203238, '대구광역시', '달성군', '유가읍');
INSERT INTO Thing VALUES (26291743, 'admin_57', '아지아수산', 'Q03A02', 128.579545232494, 35.8688264791132, '대구광역시', '중구', '대신동');
INSERT INTO Thing VALUES (17854039, 'admin_57', '굽네치킨', 'Q05A08', 128.641877495974, 35.9209391685292, '대구광역시', '동구', '봉무동');
INSERT INTO Thing VALUES (18107390, 'admin_57', '꽃분이네', 'Q01A01', 128.608332360756, 35.8929386789194, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (17143951, 'admin_57', '브라이트스타수성', 'Q01A01', 128.61818236647, 35.8505173087252, '대구광역시', '수성구', '황금동');
INSERT INTO Thing VALUES (16443066, 'admin_58', '와비비스트로', 'Q03A03', 128.557900145721, 35.8566979619225, '대구광역시', '달서구', '두류동');
INSERT INTO Thing VALUES (20343721, 'admin_58', '참치이야기', 'Q03A04', 128.490089906085, 35.8394718113363, '대구광역시', '달서구', '호림동');
INSERT INTO Thing VALUES (23370701, 'admin_58', '꿀꿀이수육국밥', 'Q01A01', 128.571746779406, 35.8391471403727, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (26104237, 'admin_58', '돈마이돈까스', 'Q06A02', 128.54425767273, 35.8402031390762, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (25398292, 'admin_58', '노리터', 'Q09A02', 128.534545796985, 35.8511708305368, '대구광역시', '달서구', '죽전동');
INSERT INTO Thing VALUES (19913982, 'admin_59', '비엔비푸드시스템', 'Q01A01', 128.523581435365, 35.83371528293, '대구광역시', '달서구', '월성동');
INSERT INTO Thing VALUES (16970979, 'admin_59', '인커피숍', 'Q12A01', 128.564805627984, 35.8858775903068, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (12329546, 'admin_59', '톳나라', 'Q01A01', 128.623678902318, 35.8752301832323, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (17133591, 'admin_59', '커피얌', 'Q12A01', 128.630711675684, 35.8836838882341, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (17907274, 'admin_59', '행복한감자탕', 'Q01A05', 128.680797202054, 35.8761638868296, '대구광역시', '동구', '용계동');
INSERT INTO Thing VALUES (20453236, 'admin_60', '청정아나고곰장어', 'Q03A14', 128.544277471598, 35.8398605443956, '대구광역시', '달서구', '본리동');
INSERT INTO Thing VALUES (16996137, 'admin_60', '피자빅', 'Q07A01', 128.708918800582, 35.8417511726552, '대구광역시', '수성구', '매호동');
INSERT INTO Thing VALUES (20537228, 'admin_60', '대우다방', 'Q12A01', 128.639176463868, 35.8744186585571, '대구광역시', '동구', '효목동');
INSERT INTO Thing VALUES (25351488, 'admin_60', '여우주전자', 'Q09A07', 128.571565641304, 35.8771478621237, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (16581242, 'admin_60', '유얼턴카페', 'Q12A01', 128.579500092825, 35.8367575405196, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (16673190, 'admin_61', '지성이해물찜', 'Q03A05', 128.509259278277, 35.8078274291652, '대구광역시', '달서구', '대곡동');
INSERT INTO Thing VALUES (18323672, 'admin_61', '윗듀', 'Q12A01', 128.62366924989, 35.9431803424784, '대구광역시', '북구', '연경동');
INSERT INTO Thing VALUES (16230615, 'admin_61', '국가대표109무한리필', 'Q01A01', 128.613013579116, 35.8736987556987, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (17682494, 'admin_61', '주막촌돼지국밥', 'Q01A01', 128.509724374247, 35.8148108035728, '대구광역시', '달서구', '유천동');
INSERT INTO Thing VALUES (19907854, 'admin_61', '황성루', 'Q02A00', 128.60412638315, 35.8452168997362, '대구광역시', '남구', '봉덕동');
INSERT INTO Thing VALUES (20071423, 'admin_62', '송보영양탕', 'Q10A09', 128.549436914346, 35.8303821215134, '대구광역시', '달서구', '송현동');
INSERT INTO Thing VALUES (19912306, 'admin_62', '대원숯불돼지갈비', 'Q01A02', 128.580799065648, 35.840329540161, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (23197139, 'admin_62', '엄마국수', 'Q04A01', 128.589607984963, 35.866920792246, '대구광역시', '중구', '계산동2가');
INSERT INTO Thing VALUES (17437514, 'admin_62', '더팬', 'Q01A13', 128.571646856656, 35.8745787071286, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (12607157, 'admin_62', '커피구락부', 'Q12A01', 128.637708124591, 35.8252052280672, '대구광역시', '수성구', '지산동');
INSERT INTO Thing VALUES (16951601, 'admin_63', '임창정의모서리족발', 'Q01A08', 128.5928264155, 35.8678873962914, '대구광역시', '중구', '동성로3가');
INSERT INTO Thing VALUES (16463886, 'admin_63', '드롭탑', 'Q12A01', 128.655674318925, 35.8861820690357, '대구광역시', '동구', '검사동');
INSERT INTO Thing VALUES (16956566, 'admin_63', '계절푸드', 'Q01A01', 128.591927489029, 35.8616636870392, '대구광역시', '중구', '남산동');
INSERT INTO Thing VALUES (17536280, 'admin_63', '애인', 'Q01A01', 128.563401620971, 35.8674791766246, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (17142398, 'admin_63', '또오기', 'Q01A01', 128.626951261545, 35.9138525940927, '대구광역시', '북구', '검단동');
INSERT INTO Thing VALUES (19923528, 'admin_64', '이봉화추어탕', 'Q01A14', 128.617200342717, 35.8495128739277, '대구광역시', '수성구', '황금동');
INSERT INTO Thing VALUES (25854823, 'admin_64', '멕시칸치킨', 'Q05A08', 128.497091124318, 35.8722514245597, '대구광역시', '달성군', '다사읍');
INSERT INTO Thing VALUES (26250327, 'admin_64', '송강과중국성', 'Q02A00', 128.529290023103, 35.8149515861411, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (17446286, 'admin_64', '진천크라운', 'Q01A01', 128.529068963602, 35.8099862097841, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (17055370, 'admin_64', '스테이크하우스', 'Q06A08', 128.582254385527, 35.8698138483558, '대구광역시', '중구', '대신동');
INSERT INTO Thing VALUES (16648000, 'admin_65', '몬스터커피', 'Q12A01', 128.621433575305, 35.8372781089388, '대구광역시', '수성구', '두산동');
INSERT INTO Thing VALUES (17811541, 'admin_65', '산마루', 'Q12A01', 128.559252531748, 35.8364298375503, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (11766713, 'admin_65', 'cafeVaraBom', 'Q12A01', 128.568126788297, 35.8701428697853, '대구광역시', '서구', '평리동');
INSERT INTO Thing VALUES (23503519, 'admin_65', '57다방', 'Q12A01', 128.561059791887, 35.8887072668291, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (26346473, 'admin_65', '용궁', 'Q06A01', 128.706020028565, 35.830672978892, '대구광역시', '수성구', '신매동');
INSERT INTO Thing VALUES (25413414, 'admin_66', '하나손칼국수', 'Q04A02', 128.550761436765, 35.8090235109165, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (17509451, 'admin_66', '맛있는고기에솜씨를더하다', 'Q01A02', 128.696737784218, 35.8627600488946, '대구광역시', '동구', '율하동');
INSERT INTO Thing VALUES (16037130, 'admin_66', '기미중', 'Q01A01', 128.609500257537, 35.8661004671679, '대구광역시', '중구', '삼덕동3가');
INSERT INTO Thing VALUES (20649807, 'admin_66', '양지다방', 'Q12A01', 128.619690273199, 35.8693021099384, '대구광역시', '동구', '신천동');
INSERT INTO Thing VALUES (17212416, 'admin_66', '루시', 'Q12A01', 128.588596274554, 35.86936833718, '대구광역시', '중구', '남성로');
INSERT INTO Thing VALUES (8657608, 'admin_67', '을지로골뱅이대구본점', 'Q01A01', 128.624368703089, 35.8586963749058, '대구광역시', '수성구', '범어동');
INSERT INTO Thing VALUES (12544049, 'admin_67', '푸드득', 'Q01A01', 128.521043415251, 35.8145820110474, '대구광역시', '달서구', '진천동');
INSERT INTO Thing VALUES (20370147, 'admin_67', '금복다방', 'Q12A01', 128.556683281468, 35.883761348447, '대구광역시', '서구', '비산동');
INSERT INTO Thing VALUES (17286487, 'admin_67', '안동뒷고기', 'Q01A02', 128.53205145187, 35.8208251002058, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (16396953, 'admin_67', '마이카츠', 'Q06A02', 128.595365673884, 35.8698307090063, '대구광역시', '중구', '동성로2가');
INSERT INTO Thing VALUES (17438752, 'admin_68', '로니스개러지', 'Q07A01', 128.589748349848, 35.8694257799847, '대구광역시', '중구', '수동');
INSERT INTO Thing VALUES (18537788, 'admin_68', '킹스꼬마김밥', 'Q01A01', 128.506465739135, 35.8557900897036, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (18445342, 'admin_68', '바다양푼이동태탕', 'Q01A01', 128.620352129134, 35.8931205549485, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (17121173, 'admin_68', '봄이밥상', 'Q01A01', 128.500910183046, 35.842095140312, '대구광역시', '달서구', '갈산동');
INSERT INTO Thing VALUES (16070443, 'admin_68', '요거프레소', 'Q12A01', 128.606054211759, 35.8977812582412, '대구광역시', '북구', '산격동');
INSERT INTO Thing VALUES (17446776, 'admin_69', '히어위어', 'Q12A01', 128.597626611175, 35.8833573230342, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (25393402, 'admin_69', '충무굴뚝배기', 'Q03A16', 128.545529245477, 35.8335275362709, '대구광역시', '달서구', '송현동');
INSERT INTO Thing VALUES (19915182, 'admin_69', '신세계이마트아이스크림', 'Q07A07', 128.52367213425, 35.8171934697114, '대구광역시', '달서구', '대천동');
INSERT INTO Thing VALUES (20444380, 'admin_69', '부어치킨', 'Q05A08', 128.504824624662, 35.8588885513311, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (17210687, 'admin_69', '구공족발', 'Q01A08', 128.589701470159, 35.8914903409157, '대구광역시', '북구', '침산동');
INSERT INTO Thing VALUES (15780779, 'admin_70', '우복당국밥보쌈', 'Q01A08', 128.538696455304, 35.8461138719342, '대구광역시', '달서구', '감삼동');
INSERT INTO Thing VALUES (18375467, 'admin_70', '권사부', 'Q02A00', 128.589714797449, 35.8469559365246, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (25548451, 'admin_70', 'BBQChicken', 'Q05A08', 128.557866625167, 35.9355996648801, '대구광역시', '북구', '동천동');
INSERT INTO Thing VALUES (17121626, 'admin_70', '더벤티', 'Q12A01', 128.529080054113, 35.8583425467993, '대구광역시', '달서구', '용산동');
INSERT INTO Thing VALUES (15980693, 'admin_70', '복어나라복국5800', 'Q03A20', 128.567638116464, 35.8792575518675, '대구광역시', '서구', '평리동');
------------------------------------------------
--THINGRANK (done)
INSERT INTO THINGRANK VALUES ('for_match1', '17572409', 'user_45', 1, '6626-9-9', '1067-4-28');
INSERT INTO THINGRANK VALUES ('for_match2', '17050121', 'user_19', 2, '9265-2-7', '8429-12-12');
INSERT INTO THINGRANK VALUES ('for_match3', '12661454', 'user_26', 3, '4621-10-1', '7646-8-24');
INSERT INTO THINGRANK VALUES ('for_match4', '15955832', 'user_48', 4, '8833-5-13', '4556-8-3');
INSERT INTO THINGRANK VALUES ('for_match5', '25290079', 'user_39', 5, '4168-8-6', '7987-10-28');
INSERT INTO THINGRANK VALUES ('for_match6', '25755835', 'user_14', 6, '2928-2-7', '9391-1-5');
INSERT INTO THINGRANK VALUES ('for_match7', '23382779', 'user_22', 7, '7593-5-21', '1089-11-13');
INSERT INTO THINGRANK VALUES ('for_match8', '26070557', 'user_35', 8, '3482-5-18', '2162-6-15');
INSERT INTO THINGRANK VALUES ('for_match9', '25458448', 'user_17', 9, '7750-8-29', '4246-3-9');
INSERT INTO THINGRANK VALUES ('for_match10', '18013943', 'user_40', 10, '3873-4-16', '4038-8-10');
INSERT INTO THINGRANK VALUES ('for_match11', '17856847', 'user_19', 11, '4553-3-11', '9925-10-27');
INSERT INTO THINGRANK VALUES ('for_match12', '17063413', 'user_44', 12, '8733-12-11', '4582-3-19');
INSERT INTO THINGRANK VALUES ('for_match13', '19994629', 'user_1', 13, '9349-4-20', '7230-7-18');
INSERT INTO THINGRANK VALUES ('for_match14', '23266088', 'user_24', 14, '3777-2-24', '5503-5-4');
INSERT INTO THINGRANK VALUES ('for_match15', '16410914', 'user_36', 15, '8661-1-16', '2532-7-1');
INSERT INTO THINGRANK VALUES ('for_match16', '26303950', 'user_24', 16, '6321-5-3', '6917-10-29');
INSERT INTO THINGRANK VALUES ('for_match17', '16630137', 'user_3', 17, '9625-7-16', '4239-4-25');
INSERT INTO THINGRANK VALUES ('for_match18', '16726942', 'user_44', 18, '4063-4-6', '2050-8-23');
INSERT INTO THINGRANK VALUES ('for_match19', '17163701', 'user_17', 19, '1216-6-30', '4503-3-20');
INSERT INTO THINGRANK VALUES ('for_match20', '25709407', 'user_37', 20, '2794-10-30', '2087-10-5');
INSERT INTO THINGRANK VALUES ('for_match21', '16642883', 'user_32', 21, '5500-12-7', '9135-12-11');
INSERT INTO THINGRANK VALUES ('for_match22', '26248029', 'user_28', 22, '8254-1-2', '1111-11-6');
INSERT INTO THINGRANK VALUES ('for_match23', '20546259', 'user_3', 23, '8465-9-15', '4375-11-10');
INSERT INTO THINGRANK VALUES ('for_match24', '17852141', 'user_18', 24, '6553-6-23', '9661-9-23');
INSERT INTO THINGRANK VALUES ('for_match25', '16718508', 'user_1', 25, '5497-9-19', '6800-2-14');
INSERT INTO THINGRANK VALUES ('for_match26', '19913970', 'user_45', 26, '9431-12-2', '6341-1-17');
INSERT INTO THINGRANK VALUES ('for_match27', '25592608', 'user_41', 27, '4423-10-1', '1112-6-25');
INSERT INTO THINGRANK VALUES ('for_match28', '16679243', 'user_10', 28, '5312-12-26', '3681-9-19');
INSERT INTO THINGRANK VALUES ('for_match29', '12074539', 'user_27', 29, '3053-7-6', '7357-11-17');
INSERT INTO THINGRANK VALUES ('for_match30', '17262371', 'user_17', 30, '7128-7-30', '9225-9-17');
INSERT INTO THINGRANK VALUES ('for_match31', '18095238', 'user_25', 31, '4570-9-15', '3082-11-17');
INSERT INTO THINGRANK VALUES ('for_match32', '18120193', 'user_44', 32, '1353-11-24', '6083-5-17');
INSERT INTO THINGRANK VALUES ('for_match33', '18390076', 'user_24', 33, '7852-12-4', '5075-7-21');
INSERT INTO THINGRANK VALUES ('for_match34', '23317507', 'user_22', 34, '1836-6-4', '3642-3-5');
INSERT INTO THINGRANK VALUES ('for_match35', '23178356', 'user_32', 35, '4196-10-13', '2844-6-16');
INSERT INTO THINGRANK VALUES ('for_match36', '19914111', 'user_34', 36, '4380-11-21', '9610-4-12');
INSERT INTO THINGRANK VALUES ('for_match37', '18223652', 'user_25', 37, '1835-2-3', '1775-9-25');
INSERT INTO THINGRANK VALUES ('for_match38', '17126506', 'user_47', 38, '9670-6-17', '8975-9-28');
INSERT INTO THINGRANK VALUES ('for_match39', '18070554', 'user_48', 39, '4038-2-10', '1558-1-28');
INSERT INTO THINGRANK VALUES ('for_match40', '12518380', 'user_17', 40, '7594-1-12', '6664-12-22');
INSERT INTO THINGRANK VALUES ('for_match41', '25292488', 'user_16', 41, '3230-4-18', '2303-1-8');
INSERT INTO THINGRANK VALUES ('for_match42', '26390340', 'user_1', 42, '6518-3-9', '6612-11-25');
INSERT INTO THINGRANK VALUES ('for_match43', '18042774', 'user_35', 43, '1560-3-28', '6165-7-11');
INSERT INTO THINGRANK VALUES ('for_match44', '18118531', 'user_29', 44, '4836-6-3', '7280-4-20');
INSERT INTO THINGRANK VALUES ('for_match45', '16731142', 'user_18', 45, '1671-6-25', '2599-4-7');
INSERT INTO THINGRANK VALUES ('for_match46', '16947896', 'user_24', 46, '6655-11-7', '9688-12-23');
INSERT INTO THINGRANK VALUES ('for_match47', '26431599', 'user_15', 47, '6675-5-11', '4807-7-28');
INSERT INTO THINGRANK VALUES ('for_match48', '17470753', 'user_37', 48, '5759-5-25', '5339-4-6');
INSERT INTO THINGRANK VALUES ('for_match49', '17720028', 'user_32', 49, '2564-8-19', '6501-9-24');
INSERT INTO THINGRANK VALUES ('for_match50', '16060477', 'user_29', 50, '8358-8-8', '4943-5-20');
------------------------------------------------
--RECEIPT (done)
INSERT INTO RECEIPT VALUES ('receipt_1', '3201-10-28', 'http://img1.jpg');
INSERT INTO RECEIPT VALUES ('receipt_2', '2033-5-4', 'http://img2.jpg');
INSERT INTO RECEIPT VALUES ('receipt_3', '9117-8-16', 'http://img3.jpg');
INSERT INTO RECEIPT VALUES ('receipt_4', '7219-4-4', 'http://img4.jpg');
INSERT INTO RECEIPT VALUES ('receipt_5', '8993-1-29', 'http://img5.jpg');
INSERT INTO RECEIPT VALUES ('receipt_6', '7386-7-20', 'http://img6.jpg');
INSERT INTO RECEIPT VALUES ('receipt_7', '1034-12-15', 'http://img7.jpg');
INSERT INTO RECEIPT VALUES ('receipt_8', '5363-12-26', 'http://img8.jpg');
INSERT INTO RECEIPT VALUES ('receipt_9', '4748-10-4', 'http://img9.jpg');
INSERT INTO RECEIPT VALUES ('receipt_10', '6200-1-1', 'http://img10.jpg');
INSERT INTO RECEIPT VALUES ('receipt_11', '1416-11-18', 'http://img11.jpg');
INSERT INTO RECEIPT VALUES ('receipt_12', '1150-7-22', 'http://img12.jpg');
INSERT INTO RECEIPT VALUES ('receipt_13', '4548-7-24', 'http://img13.jpg');
INSERT INTO RECEIPT VALUES ('receipt_14', '1475-9-8', 'http://img14.jpg');
INSERT INTO RECEIPT VALUES ('receipt_15', '8174-8-18', 'http://img15.jpg');
INSERT INTO RECEIPT VALUES ('receipt_16', '4818-6-8', 'http://img16.jpg');
INSERT INTO RECEIPT VALUES ('receipt_17', '4584-8-10', 'http://img17.jpg');
INSERT INTO RECEIPT VALUES ('receipt_18', '1352-7-27', 'http://img18.jpg');
INSERT INTO RECEIPT VALUES ('receipt_19', '2638-3-21', 'http://img19.jpg');
INSERT INTO RECEIPT VALUES ('receipt_20', '5856-2-24', 'http://img20.jpg');
INSERT INTO RECEIPT VALUES ('receipt_21', '6450-12-23', 'http://img21.jpg');
INSERT INTO RECEIPT VALUES ('receipt_22', '9205-7-17', 'http://img22.jpg');
INSERT INTO RECEIPT VALUES ('receipt_23', '4110-5-10', 'http://img23.jpg');
INSERT INTO RECEIPT VALUES ('receipt_24', '9181-9-13', 'http://img24.jpg');
INSERT INTO RECEIPT VALUES ('receipt_25', '1565-8-8', 'http://img25.jpg');
INSERT INTO RECEIPT VALUES ('receipt_26', '7623-7-22', 'http://img26.jpg');
INSERT INTO RECEIPT VALUES ('receipt_27', '3834-6-18', 'http://img27.jpg');
INSERT INTO RECEIPT VALUES ('receipt_28', '7139-2-15', 'http://img28.jpg');
INSERT INTO RECEIPT VALUES ('receipt_29', '9330-2-25', 'http://img29.jpg');
INSERT INTO RECEIPT VALUES ('receipt_30', '3682-9-27', 'http://img30.jpg');
INSERT INTO RECEIPT VALUES ('receipt_31', '7443-6-16', 'http://img31.jpg');
INSERT INTO RECEIPT VALUES ('receipt_32', '1484-8-2', 'http://img32.jpg');
INSERT INTO RECEIPT VALUES ('receipt_33', '6054-12-28', 'http://img33.jpg');
INSERT INTO RECEIPT VALUES ('receipt_34', '7448-11-6', 'http://img34.jpg');
INSERT INTO RECEIPT VALUES ('receipt_35', '3762-9-8', 'http://img35.jpg');
INSERT INTO RECEIPT VALUES ('receipt_36', '1201-4-18', 'http://img36.jpg');
INSERT INTO RECEIPT VALUES ('receipt_37', '9983-4-13', 'http://img37.jpg');
INSERT INTO RECEIPT VALUES ('receipt_38', '9417-6-28', 'http://img38.jpg');
INSERT INTO RECEIPT VALUES ('receipt_39', '6788-8-30', 'http://img39.jpg');
INSERT INTO RECEIPT VALUES ('receipt_40', '5411-11-18', 'http://img40.jpg');
INSERT INTO RECEIPT VALUES ('receipt_41', '1093-7-26', 'http://img41.jpg');
INSERT INTO RECEIPT VALUES ('receipt_42', '9396-3-17', 'http://img42.jpg');
INSERT INTO RECEIPT VALUES ('receipt_43', '4366-7-2', 'http://img43.jpg');
INSERT INTO RECEIPT VALUES ('receipt_44', '8882-6-19', 'http://img44.jpg');
INSERT INTO RECEIPT VALUES ('receipt_45', '4274-9-14', 'http://img45.jpg');
INSERT INTO RECEIPT VALUES ('receipt_46', '8945-6-14', 'http://img46.jpg');
INSERT INTO RECEIPT VALUES ('receipt_47', '6670-1-18', 'http://img47.jpg');
INSERT INTO RECEIPT VALUES ('receipt_48', '9849-10-26', 'http://img48.jpg');
INSERT INTO RECEIPT VALUES ('receipt_49', '6425-8-20', 'http://img49.jpg');
INSERT INTO RECEIPT VALUES ('receipt_50', '1458-4-21', 'http://img50.jpg');
------------------------------------------------
--FOLLOW (done)
SELECT * FROM follow;
INSERT INTO FOLLOW VALUES ('f00001', 'user_32', 'user_46', '4959-7-22');
INSERT INTO FOLLOW VALUES ('f00002', 'user_50', 'user_8', '6152-4-14');
INSERT INTO FOLLOW VALUES ('f00003', 'user_3', 'user_20', '7092-6-10');
INSERT INTO FOLLOW VALUES ('f00004', 'user_8', 'user_34', '1063-8-5');
INSERT INTO FOLLOW VALUES ('f00005', 'user_13', 'user_9', '9603-5-24');
INSERT INTO FOLLOW VALUES ('f00006', 'user_6', 'user_42', '8467-11-26');
INSERT INTO FOLLOW VALUES ('f00007', 'user_10', 'user_45', '1825-11-1');
INSERT INTO FOLLOW VALUES ('f00008', 'user_4', 'user_21', '3789-2-20');
INSERT INTO FOLLOW VALUES ('f00009', 'user_2', 'user_35', '1834-5-2');
INSERT INTO FOLLOW VALUES ('f00010', 'user_29', 'user_29', '5277-10-22');
INSERT INTO FOLLOW VALUES ('f00011', 'user_39', 'user_5', '2229-1-6');
INSERT INTO FOLLOW VALUES ('f00012', 'user_40', 'user_41', '7933-1-28');
INSERT INTO FOLLOW VALUES ('f00013', 'user_34', 'user_34', '9230-1-16');
INSERT INTO FOLLOW VALUES ('f00014', 'user_22', 'user_48', '8558-10-26');
INSERT INTO FOLLOW VALUES ('f00015', 'user_43', 'user_25', '5932-12-21');
INSERT INTO FOLLOW VALUES ('f00016', 'user_12', 'user_16', '4746-8-18');
INSERT INTO FOLLOW VALUES ('f00017', 'user_43', 'user_41', '5015-9-29');
INSERT INTO FOLLOW VALUES ('f00018', 'user_27', 'user_4', '1921-5-27');
INSERT INTO FOLLOW VALUES ('f00019', 'user_49', 'user_37', '9044-12-24');
INSERT INTO FOLLOW VALUES ('f00020', 'user_32', 'user_4', '4236-5-12');
INSERT INTO FOLLOW VALUES ('f00021', 'user_48', 'user_14', '2677-12-29');
INSERT INTO FOLLOW VALUES ('f00022', 'user_31', 'user_11', '2624-11-9');
INSERT INTO FOLLOW VALUES ('f00023', 'user_39', 'user_12', '5049-1-18');
INSERT INTO FOLLOW VALUES ('f00024', 'user_35', 'user_37', '3906-2-15');
INSERT INTO FOLLOW VALUES ('f00025', 'user_36', 'user_36', '8237-5-24');
INSERT INTO FOLLOW VALUES ('f00026', 'user_45', 'user_7', '9039-2-7');
INSERT INTO FOLLOW VALUES ('f00027', 'user_32', 'user_40', '4046-3-16');
INSERT INTO FOLLOW VALUES ('f00028', 'user_25', 'user_17', '2632-5-15');
INSERT INTO FOLLOW VALUES ('f00029', 'user_37', 'user_40', '5866-10-12');
INSERT INTO FOLLOW VALUES ('f00030', 'user_13', 'user_44', '6695-3-24');
INSERT INTO FOLLOW VALUES ('f00031', 'user_15', 'user_46', '8112-7-26');
INSERT INTO FOLLOW VALUES ('f00032', 'user_9', 'user_23', '5926-5-18');
INSERT INTO FOLLOW VALUES ('f00033', 'user_47', 'user_46', '8329-9-27');
INSERT INTO FOLLOW VALUES ('f00034', 'user_20', 'user_27', '8871-9-11');
INSERT INTO FOLLOW VALUES ('f00035', 'user_36', 'user_32', '1642-7-9');
INSERT INTO FOLLOW VALUES ('f00036', 'user_27', 'user_38', '6236-6-29');
INSERT INTO FOLLOW VALUES ('f00037', 'user_5', 'user_10', '7803-3-14');
INSERT INTO FOLLOW VALUES ('f00038', 'user_43', 'user_42', '2322-5-8');
INSERT INTO FOLLOW VALUES ('f00039', 'user_4', 'user_36', '7040-9-14');
INSERT INTO FOLLOW VALUES ('f00040', 'user_10', 'user_2', '1025-4-10');
INSERT INTO FOLLOW VALUES ('f00041', 'user_8', 'user_37', '7552-11-20');
INSERT INTO FOLLOW VALUES ('f00042', 'user_20', 'user_13', '3246-12-16');
INSERT INTO FOLLOW VALUES ('f00043', 'user_34', 'user_36', '7298-4-7');
INSERT INTO FOLLOW VALUES ('f00044', 'user_10', 'user_3', '7523-2-14');
INSERT INTO FOLLOW VALUES ('f00045', 'user_46', 'user_46', '4133-11-30');
INSERT INTO FOLLOW VALUES ('f00046', 'user_45', 'user_3', '8929-4-28');
INSERT INTO FOLLOW VALUES ('f00047', 'user_19', 'user_11', '6284-12-1');
INSERT INTO FOLLOW VALUES ('f00048', 'user_21', 'user_21', '8760-3-2');
INSERT INTO FOLLOW VALUES ('f00049', 'user_35', 'user_25', '1561-8-27');
INSERT INTO FOLLOW VALUES ('f00050', 'user_43', 'user_37', '7883-2-16');

------------------------------------------------
--RANKING_SNAPSHOT (done)
SELECT * FROM RANKING_SNAPSHOT;
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_1', 'for_match50', 'user_48', '어쩐지 오늘 알람이 안 울려', '1446-3-1', '4762-11-24', 3762959458, 3369801087);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_2', 'for_match34', 'user_2', '아무거나 막 입었고 지각이야', '7175-2-8', '3272-3-24', 7605666612, 7334243992);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_3', 'for_match25', 'user_46', '아래로 몸을 낮추고 숨을 꾹 참아봤지만', '8644-10-11', '6618-4-27', 1118616518, 7260699957);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_4', 'for_match50', 'user_16', '아이쿠 들켰나 봐', '7332-9-16', '4554-7-20', 3080719722, 5918720226);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_5', 'for_match26', 'user_27', '내 맘이 방심할 때마다 불쑥 나타난 뒤', '4308-7-4', '8241-3-14', 3481704313, 6724632104);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_6', 'for_match32', 'user_45', '헤엄치듯 멀어지는 너', '2203-10-30', '5254-9-29', 6901501482, 
6518023661);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_7', 'for_match5', 'user_27', '또 물보라를 일으켜', '7937-12-3', '4570-4-23', 245155095, 4589768163);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_8', 'for_match9', 'user_45', 'Da-da-da-da, da-da-da-da-da-da', '7443-12-14', '4593-8-19', 5765711314, 8070524870);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_9', 'for_match36', 'user_4', 'Da-da-da-da 또 물보라를 일으켜', '5441-8-27', '2424-7-27', 6370416310, 9343950627);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_10', 'for_match9', 'user_30', 'Da-da-da-da, da-da-da-da-da-da', '2590-4-8', '8387-11-7', 1239564555, 2519140731);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_11', 'for_match45', 'user_23', 'Da-da-da-da 또 물보라를 일으켜', '4296-3-15', '7491-1-24', 1256790580, 9687774714);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_12', 'for_match39', 'user_11', '이 파도 위 난 온종일', '5369-2-24', '1541-6-5', 78379356, 9059905965);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_13', 'for_match5', 'user_38', '서핑을 하는 느낌 아찔한 feeling', '2751-11-23', '2889-12-1', 6036861241, 3763151214);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_14', 'for_match2', 'user_18', '난 솔직히 푹 빠졌지', '4009-4-26', '9806-2-8', 3193943129, 7923155746);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_15', 'for_match25', 'user_14', '하지만 이건 secret', '7660-8-8', '1284-10-8', 2981875994, 1332631273);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_16', 'for_match35', 'user_44', '또 물보라를 일으켜', '1076-12-20', '3404-5-8', 6159256668, 889477912);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_17', 'for_match24', 'user_27', '갑자기 웃으며 얼굴을 불쑥 다가온 뒤', '4606-9-9', '6170-10-22', 1210244802, 4790183635);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_18', 'for_match34', 'user_42', '원을 갈라 하트를 그려', '2556-9-11', '6979-4-14', 2065730053, 6212187146);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_19', 'for_match20', 'user_16', '또 물보라를 일으켜', '8245-1-23', '3244-10-2', 1490822776, 7259497225);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_20', 'for_match39', 'user_11', 'Da-da-da-da, da-da-da-da-da-da', '1286-2-15', '1055-3-16', 3962986289, 5371677807);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_21', 'for_match12', 'user_11', 'Da-da-da-da 또 물보라를 일으켜', '5649-4-3', '5789-10-1', 9344192871, 87414632);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_22', 'for_match5', 'user_13', 'Da-da-da-da, da-da-da-da-da-da', '4506-1-12', '6049-11-24', 9316211125, 885603851);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_23', 'for_match36', 'user_34', 'Da-da-da-da 또 물보라를 일으켜', '4668-1-28', '3315-3-26', 8744182882, 1653348692);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_24', 'for_match15', 'user_43', 'Da-da-da-da, da-da-da-da-da-da', '4606-2-7', '6304-6-4', 8860845268, 86191612);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_25', 'for_match19', 'user_37', 'Da-da-da-da 또 물보라를 일으켜', '2223-11-27', '6587-12-9', 7193502112, 3148664162);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_26', 'for_match40', 'user_32', 'Da-da, da-da-da-da-da-da', '8964-1-6', '2560-2-27', 9248174263, 1491190537);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_27', 'for_match21', 'user_9', 'Da-da-da-da 또 물보라를 일으켜', '3114-7-15', '7712-9-9', 9927484367, 8678348650);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_28', 'for_match44', 'user_6', '단팥을 넣었으면 단팥빵', '6545-7-1', '1835-1-21', 2617760610, 
8257457560);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_29', 'for_match10', 'user_1', '크림을 넣었으면 크림빵', '5409-3-9', '2146-6-3', 9284844700, 9134045240);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_30', 'for_match41', 'user_28', '겨울엔 따끈따끈 호빵', '2569-1-30', '4348-8-30', 9487135646, 
391939547);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_31', 'for_match36', 'user_6', '아침엔 똥글똥글 모닝빵', '6092-7-25', '4378-7-3', 7499889443, 
6364851718);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_32', 'for_match9', 'user_38', '가루 가루 밀가루 반죽은', '5487-11-16', '4736-2-21', 4739758939, 6321939244);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_33', 'for_match6', 'user_9', '치대고 치대면 부풀어 오르고', '5868-2-5', '9080-11-28', 1524280094, 132617011);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_34', 'for_match15', 'user_30', '오랜 시간 손맛은', '4429-7-9', '6356-2-1', 5571231969, 6283543732);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_35', 'for_match14', 'user_28', '우리를 배신하지 않는다', '9342-11-23', '9274-10-16', 2223146192, 1429105987);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_36', 'for_match17', 'user_19', '빵 먹고 빵빵 뱃속이 빵빵', '7904-4-5', '5490-10-21', 5884518002, 7120713817);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_37', 'for_match34', 'user_21', '빵 먹고 빵빵 든든해 빵빵', '5655-12-12', '9108-12-16', 6855457924, 2625945616);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_38', 'for_match12', 'user_5', '딸기잼도 샐러드도', '8357-4-16', '1428-4-6', 7889803944, 743865552);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_39', 'for_match15', 'user_20', '발라버려 어울려', '3826-7-29', '8286-5-19', 1176550933, 950371634);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_40', 'for_match12', 'user_23', '빵 먹다 뻑뻑하면 우유를 한잔', '4007-3-27', '3593-2-20', 4632200142, 6741103041);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_41', 'for_match18', 'user_13', '빵 먹다 너무달아 커피를 한잔', '8182-5-3', '9742-11-15', 6205346671, 636037865);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_42', 'for_match30', 'user_8', '꼭꼭 씹어 먹다보면', '5683-12-13', '6890-7-2', 6050093607, 589767525);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_43', 'for_match5', 'user_17', '살살 녹아버린다', '5012-4-19', '3919-3-11', 3820739897, 9020304107);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_44', 'for_match16', 'user_47', '빵빵빵빵 빵 빵빵', '1648-4-1', '5513-10-27', 2722655189, 5987965746);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_45', 'for_match1', 'user_24', '빵빵빵빵 빵 빵빵', '5578-12-20', '9449-2-18', 9967374624, 4295993114);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_46', 'for_match8', 'user_3', '빵빵빵빵공공칠 빵', '1397-1-27', '4367-6-14', 5636013645, 4946092269);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_47', 'for_match43', 'user_15', '안녕하세요', '8104-8-28', '8449-12-17', 5761242541, 4766964480);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_48', 'for_match3', 'user_35', '제 이름은 빵빵빵 입니다', '1060-2-10', '3922-4-5', 8769779884, 8156922247);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_49', 'for_match37', 'user_10', '50줄 체워야되서 쓰는데 뭘 써야될까요', '4460-3-5', '7646-4-29', 1762188277, 9275102832);
INSERT INTO RANKING_SNAPSHOT
VALUES ('snapshot_50', 'for_match35', 'user_11', '50줄 체웠나 확인해볼까요?', '5828-5-14', '1457-8-2', 1427946446, 9704019003);
DESC RANKING_SNAPSHOT;
------------------------------------------------
--VERIFY (done)
--(admin_id,신청한 날짜, 인증된 날짜) 추가 필요
--receipt_id 중복 제거 제약조건 추가 필요
INSERT INTO VERIFY VALUES ('verify1', 'receipt_46', '26248029', 'user_39', '8111-1-21');
INSERT INTO VERIFY VALUES ('verify2', 'receipt_32', '18390076', 'user_12', '9756-3-29');
INSERT INTO VERIFY VALUES ('verify3', 'receipt_4', '23382779', 'user_14', '1998-4-16');
INSERT INTO VERIFY VALUES ('verify4', 'receipt_40', '25458448', 'user_6', '4854-12-26');
INSERT INTO VERIFY VALUES ('verify5', 'receipt_50', '18095238', 'user_22', '7611-10-5');
INSERT INTO VERIFY VALUES ('verify6', 'receipt_45', '17470753', 'user_27', '3693-1-2');
INSERT INTO VERIFY VALUES ('verify7', 'receipt_38', '17856847', 'user_10', '2375-12-26');
INSERT INTO VERIFY VALUES ('verify8', 'receipt_3', '18042774', 'user_28', '7315-6-20');
INSERT INTO VERIFY VALUES ('verify9', 'receipt_28', '18095238', 'user_21', '4529-1-2');
INSERT INTO VERIFY VALUES ('verify10', 'receipt_1', '17720028', 'user_20', '8800-11-21');
INSERT INTO VERIFY VALUES ('verify11', 'receipt_14', '25755835', 'user_14', '6657-8-27');
INSERT INTO VERIFY VALUES ('verify12', 'receipt_27', '25458448', 'user_20', '2234-12-18');
INSERT INTO VERIFY VALUES ('verify13', 'receipt_42', '26070557', 'user_22', '6747-3-2');
INSERT INTO VERIFY VALUES ('verify14', 'receipt_16', '16642883', 'user_15', '7710-6-8');
INSERT INTO VERIFY VALUES ('verify15', 'receipt_26', '19914111', 'user_36', '6615-4-29');
INSERT INTO VERIFY VALUES ('verify16', 'receipt_30', '17572409', 'user_27', '6885-10-10');
INSERT INTO VERIFY VALUES ('verify17', 'receipt_25', '17262371', 'user_40', '1186-10-23');
INSERT INTO VERIFY VALUES ('verify18', 'receipt_18', '18042774', 'user_46', '6725-8-12');
INSERT INTO VERIFY VALUES ('verify19', 'receipt_24', '17126506', 'user_34', '8284-10-5');
INSERT INTO VERIFY VALUES ('verify20', 'receipt_7', '18095238', 'user_37', '2309-5-10');
INSERT INTO VERIFY VALUES ('verify21', 'receipt_29', '25458448', 'user_19', '1371-1-5');
INSERT INTO VERIFY VALUES ('verify22', 'receipt_9', '16630137', 'user_43', '2369-7-5');
INSERT INTO VERIFY VALUES ('verify23', 'receipt_13', '17126506', 'user_22', '7858-4-3');
INSERT INTO VERIFY VALUES ('verify24', 'receipt_39', '23266088', 'user_14', '9859-2-2');
INSERT INTO VERIFY VALUES ('verify25', 'receipt_44', '17856847', 'user_4', '7330-9-4');
INSERT INTO VERIFY VALUES ('verify26', 'receipt_48', '23178356', 'user_49', '1072-10-6');
INSERT INTO VERIFY VALUES ('verify27', 'receipt_19', '17856847', 'user_4', '9588-3-9');
INSERT INTO VERIFY VALUES ('verify28', 'receipt_6', '17126506', 'user_41', '8942-6-16');
INSERT INTO VERIFY VALUES ('verify29', 'receipt_33', '23317507', 'user_33', '2135-10-29');
INSERT INTO VERIFY VALUES ('verify30', 'receipt_47', '17470753', 'user_29', '4854-12-27');
INSERT INTO VERIFY VALUES ('verify31', 'receipt_11', '26070557', 'user_35', '7507-3-4');
INSERT INTO VERIFY VALUES ('verify32', 'receipt_5', '12074539', 'user_34', '5745-2-26');
INSERT INTO VERIFY VALUES ('verify33', 'receipt_8', '17126506', 'user_44', '9720-3-8');
INSERT INTO VERIFY VALUES ('verify34', 'receipt_23', '18118531', 'user_13', '6479-7-7');
INSERT INTO VERIFY VALUES ('verify35', 'receipt_35', '16947896', 'user_42', '7287-12-5');
INSERT INTO VERIFY VALUES ('verify36', 'receipt_17', '26248029', 'user_12', '3533-9-28');
INSERT INTO VERIFY VALUES ('verify37', 'receipt_43', '16410914', 'user_6', '3167-11-12');
INSERT INTO VERIFY VALUES ('verify38', 'receipt_12', '23178356', 'user_25', '9183-6-2');
INSERT INTO VERIFY VALUES ('verify39', 'receipt_36', '16642883', 'user_24', '8052-11-11');
INSERT INTO VERIFY VALUES ('verify40', 'receipt_22', '18223652', 'user_24', '3523-8-5');
INSERT INTO VERIFY VALUES ('verify41', 'receipt_31', '16726942', 'user_7', '6520-4-20');
INSERT INTO VERIFY VALUES ('verify42', 'receipt_20', '18118531', 'user_8', '8341-10-10');
INSERT INTO VERIFY VALUES ('verify43', 'receipt_49', '17856847', 'user_33', '5036-5-22');
INSERT INTO VERIFY VALUES ('verify44', 'receipt_2', '18095238', 'user_42', '7662-9-11');
INSERT INTO VERIFY VALUES ('verify45', 'receipt_34', '16947896', 'user_50', '2624-3-21');
INSERT INTO VERIFY VALUES ('verify46', 'receipt_37', '12518380', 'user_9', '2746-6-14');
INSERT INTO VERIFY VALUES ('verify47', 'receipt_41', '16410914', 'user_29', '1746-3-26');
INSERT INTO VERIFY VALUES ('verify48', 'receipt_15', '16679243', 'user_48', '7472-10-19');
INSERT INTO VERIFY VALUES ('verify49', 'receipt_21', '25290079', 'user_24', '3214-10-18');
INSERT INTO VERIFY VALUES ('verify50', 'receipt_10', '18118531', 'user_31', '1761-10-25');
------------------------------------------------
--SNAPSHOT_COMMENT
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment1', 'snapshot_9', 'user_3', 'commt50', '3625-8-23', '9295-11-14');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment2', 'snapshot_37', 'user_35', 'commt49', '4614-11-26', '9463-8-8');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment3', 'snapshot_49', 'user_34', 'commt48', '1502-7-22', '6263-11-21');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment4', 'snapshot_5', 'user_28', 'commt47', '1963-12-10', '3059-4-29');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment5', 'snapshot_17', 'user_4', 'commt46', '6019-2-28', '2252-5-30');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment6', 'snapshot_8', 'user_20', 'commt45', '3592-7-19', '5134-3-1'); 
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment7', 'snapshot_32', 'user_36', 'commt44', '1621-10-27', '4565-10-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment8', 'snapshot_29', 'user_11', 'commt43', '9337-1-13', '4283-6-4');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment9', 'snapshot_31', 'user_14', 'commt42', '8093-10-7', '9066-2-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment10', 'snapshot_42', 'user_25', 'commt41', '5850-9-16', '1281-6-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment11', 'snapshot_25', 'user_26', 'commt40', '5609-1-6', '4290-6-26');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment12', 'snapshot_14', 'user_37', 'commt39', '3214-6-14', '4490-5-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment13', 'snapshot_7', 'user_7', 'commt38', '7213-9-12', '9754-8-25');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment14', 'snapshot_2', 'user_35', 'commt37', '4844-2-24', '1661-2-5');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment15', 'snapshot_28', 'user_11', 'commt36', '3728-9-7', '5391-6-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment16', 'snapshot_39', 'user_33', 'commt35', '5182-6-11', '6575-2-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment17', 'snapshot_50', 'user_16', 'commt34', '9008-3-19', '2708-6-2');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment18', 'snapshot_1', 'user_27', 'commt33', '2199-7-28', '3413-3-11');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment19', 'snapshot_45', 'user_8', 'commt32', '7193-2-19', '4665-10-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment20', 'snapshot_18', 'user_18', 'commt31', '6978-5-19', '9753-2-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment21', 'snapshot_47', 'user_18', 'commt30', '2765-1-27', '5845-1-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment22', 'snapshot_15', 'user_43', 'commt29', '1238-2-14', '2885-1-7');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment23', 'snapshot_38', 'user_16', 'commt28', '7897-3-4', '8387-3-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment24', 'snapshot_21', 'user_16', 'commt27', '3604-12-28', '2684-7-30');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment25', 'snapshot_35', 'user_25', 'commt26', '9895-5-18', '5151-12-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment26', 'snapshot_44', 'user_21', 'commt25', '2640-4-21', '6200-1-1');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment27', 'snapshot_34', 'user_1', 'commt24', '5842-12-20', '6246-8-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment28', 'snapshot_36', 'user_21', 'commt23', '7529-2-3', '6199-10-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment29', 'snapshot_23', 'user_8', 'commt22', '5097-4-26', '9895-12-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment30', 'snapshot_30', 'user_43', 'commt21', '6829-5-6', '9873-4-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment31', 'snapshot_19', 'user_13', 'commt20', '5036-6-3', '5600-2-25');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment32', 'snapshot_27', 'user_29', 'commt19', '2482-11-19', '6552-4-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment33', 'snapshot_12', 'user_20', 'commt18', '1672-6-6', '6189-10-29');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment34', 'snapshot_41', 'user_20', 'commt17', '5027-6-4', '9916-10-19');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment35', 'snapshot_48', 'user_39', 'commt16', '2508-4-8', '1333-4-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment36', 'snapshot_22', 'user_5', 'commt15', '5391-9-28', '2161-12-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment37', 'snapshot_46', 'user_2', 'commt14', '1162-5-25', '6884-8-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment38', 'snapshot_33', 'user_10', 'commt13', '2653-9-25', '6375-2-17');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment39', 'snapshot_43', 'user_43', 'commt12', '3838-3-25', '3450-3-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment40', 'snapshot_13', 'user_21', 'commt11', '6007-2-23', '9427-10-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment41', 'snapshot_20', 'user_9', 'commt10', '4387-3-18', '1520-6-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment42', 'snapshot_26', 'user_40', 'commt9', '4365-3-10', '8088-9-6');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment43', 'snapshot_3', 'user_4', 'commt8', '5051-5-25', '2055-11-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment44', 'snapshot_16', 'user_28', 'commt7', '9999-5-18', '8199-9-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment45', 'snapshot_24', 'user_1', 'commt6', '7483-6-6', '5226-8-1');  
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment46', 'snapshot_6', 'user_42', 'commt5', '7826-10-1', '2021-12-12');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment47', 'snapshot_11', 'user_38', 'commt4', '3265-10-5', '3269-5-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment48', 'snapshot_40', 'user_18', 'commt3', '7517-10-13', '3820-10-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment49', 'snapshot_4', 'user_15', 'commt2', '8962-1-6', '9662-6-17'); 
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment50', 'snapshot_10', 'user_42', 'commt1', '8181-11-21', '4698-4-11');

select count(*) from admin; --50
select count(*) from follow; -- 50
select count(*) from ranking_snapshot; --50
select count(*) from receipt; --50
select count(*) from snapshot_comment; --50
select count(*) from thing; --334
select count(*) from thingrank; --50
select count(*) from users; --50
select count(*) from verify; --50
-- total : 690 tuples
commit;

