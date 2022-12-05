import random

need_extract = """INSERT INTO Thing VALUES (17050121, 'admin_1', '사월동버거', 'Q01A01', 128.712138415124, 35.8366126400214, '대구광역시', '수성구', '신매동');
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
INSERT INTO Thing VALUES (26070557, 'admin_10', '네네치킨화원점', 'Q05A08', 128.495664465549, 35.7978073003374, '대구광역시', '달성군', '화원읍');"""

# INSERT INTO VERIFY VALUES ('verify1', 'receipt3', 20546259, 'user_11','4232-4-3');

# 이름          널?       유형           
# ----------- -------- ------------ 
# VERIFY_ID   NOT NULL VARCHAR2(11) 
# RECEIPT_ID           VARCHAR2(11) 
# THING_ID             NUMBER(8)    
# USER_ID              VARCHAR2(11) 
# VERIFY_DATE          DATE


n = 50

def thing_id_extraction(ex):
    ans = []
    temp_ex = list(ex.split('\n'))
    for t in temp_ex:
        temp = list(t.split(' '))
        
        ans.append(temp[4][1:9])
    return ans

def auto_verify(ex, ind, n):
    insert_quote = []
    verify_tup = []
    for i in range(n):
        verify_id = 'verify'+str(i+1)
        
        receipt_id = 'receipt' + str(ind[i] + 1)
        
        thing_id = ex[random.randint(1,n)-1]
        
        user = 'user_' + str(random.randint(1,n))

        year = str(random.randint(1000,9999))
        month = str(random.randint(1,12))
        day = str(random.randint(1,30))
        date = year + '-' + month + '-' + day
        
        verify_tup.append([verify_id, receipt_id, thing_id, user, date]) 
    
    for ad in verify_tup:
        insert_quote.append('INSERT INTO VERIFY VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

ind = []
# 중복없이 랜덤 index 0~49
for i in range(n):
    a = random.randint(0,n-1)       
    while a in ind:
        a = random.randint(0,n-1)
    ind.append(a)


thing_id = thing_id_extraction(need_extract)
ans = auto_verify(thing_id, ind, n)

for a in ans:
    print(a)

"""
INSERT INTO VERIFY VALUES ('verify1', 'receipt46', '26248029', 'user_39', '8111-1-21');
INSERT INTO VERIFY VALUES ('verify2', 'receipt32', '18390076', 'user_12', '9756-3-29');
INSERT INTO VERIFY VALUES ('verify3', 'receipt4', '23382779', 'user_14', '1998-4-16');
INSERT INTO VERIFY VALUES ('verify4', 'receipt40', '25458448', 'user_6', '4854-12-26');
INSERT INTO VERIFY VALUES ('verify5', 'receipt50', '18095238', 'user_22', '7611-10-5');
INSERT INTO VERIFY VALUES ('verify6', 'receipt45', '17470753', 'user_27', '3693-1-2');
INSERT INTO VERIFY VALUES ('verify7', 'receipt38', '17856847', 'user_10', '2375-12-26');
INSERT INTO VERIFY VALUES ('verify8', 'receipt3', '18042774', 'user_28', '7315-6-20');
INSERT INTO VERIFY VALUES ('verify9', 'receipt28', '18095238', 'user_21', '4529-1-2');
INSERT INTO VERIFY VALUES ('verify10', 'receipt1', '17720028', 'user_20', '8800-11-21');
INSERT INTO VERIFY VALUES ('verify11', 'receipt14', '25755835', 'user_14', '6657-8-27');
INSERT INTO VERIFY VALUES ('verify12', 'receipt27', '25458448', 'user_20', '2234-12-18');
INSERT INTO VERIFY VALUES ('verify13', 'receipt42', '26070557', 'user_22', '6747-3-2');
INSERT INTO VERIFY VALUES ('verify14', 'receipt16', '16642883', 'user_15', '7710-6-8');
INSERT INTO VERIFY VALUES ('verify15', 'receipt26', '19914111', 'user_36', '6615-4-29');
INSERT INTO VERIFY VALUES ('verify16', 'receipt30', '17572409', 'user_27', '6885-10-10');
INSERT INTO VERIFY VALUES ('verify17', 'receipt25', '17262371', 'user_40', '1186-10-23');
INSERT INTO VERIFY VALUES ('verify18', 'receipt18', '18042774', 'user_46', '6725-8-12');
INSERT INTO VERIFY VALUES ('verify19', 'receipt24', '17126506', 'user_34', '8284-10-5');
INSERT INTO VERIFY VALUES ('verify20', 'receipt7', '18095238', 'user_37', '2309-5-10');
INSERT INTO VERIFY VALUES ('verify21', 'receipt29', '25458448', 'user_19', '1371-1-5');
INSERT INTO VERIFY VALUES ('verify22', 'receipt9', '16630137', 'user_43', '2369-7-5');
INSERT INTO VERIFY VALUES ('verify23', 'receipt13', '17126506', 'user_22', '7858-4-3');
INSERT INTO VERIFY VALUES ('verify24', 'receipt39', '23266088', 'user_14', '9859-2-2');
INSERT INTO VERIFY VALUES ('verify25', 'receipt44', '17856847', 'user_4', '7330-9-4');
INSERT INTO VERIFY VALUES ('verify26', 'receipt48', '23178356', 'user_49', '1072-10-6');
INSERT INTO VERIFY VALUES ('verify27', 'receipt19', '17856847', 'user_4', '9588-3-9');
INSERT INTO VERIFY VALUES ('verify28', 'receipt6', '17126506', 'user_41', '8942-6-16');
INSERT INTO VERIFY VALUES ('verify29', 'receipt33', '23317507', 'user_33', '2135-10-29');
INSERT INTO VERIFY VALUES ('verify30', 'receipt47', '17470753', 'user_29', '4854-12-27');
INSERT INTO VERIFY VALUES ('verify31', 'receipt11', '26070557', 'user_35', '7507-3-4');
INSERT INTO VERIFY VALUES ('verify32', 'receipt5', '12074539', 'user_34', '5745-2-26');
INSERT INTO VERIFY VALUES ('verify33', 'receipt8', '17126506', 'user_44', '9720-3-8');
INSERT INTO VERIFY VALUES ('verify34', 'receipt23', '18118531', 'user_13', '6479-7-7');
INSERT INTO VERIFY VALUES ('verify35', 'receipt35', '16947896', 'user_42', '7287-12-5');
INSERT INTO VERIFY VALUES ('verify36', 'receipt17', '26248029', 'user_12', '3533-9-28');
INSERT INTO VERIFY VALUES ('verify37', 'receipt43', '16410914', 'user_6', '3167-11-12');
INSERT INTO VERIFY VALUES ('verify38', 'receipt12', '23178356', 'user_25', '9183-6-2');
INSERT INTO VERIFY VALUES ('verify39', 'receipt36', '16642883', 'user_24', '8052-11-11');
INSERT INTO VERIFY VALUES ('verify40', 'receipt22', '18223652', 'user_24', '3523-8-5');
INSERT INTO VERIFY VALUES ('verify41', 'receipt31', '16726942', 'user_7', '6520-4-20');
INSERT INTO VERIFY VALUES ('verify42', 'receipt20', '18118531', 'user_8', '8341-10-10');
INSERT INTO VERIFY VALUES ('verify43', 'receipt49', '17856847', 'user_33', '5036-5-22');
INSERT INTO VERIFY VALUES ('verify44', 'receipt2', '18095238', 'user_42', '7662-9-11');
INSERT INTO VERIFY VALUES ('verify45', 'receipt34', '16947896', 'user_50', '2624-3-21');
INSERT INTO VERIFY VALUES ('verify46', 'receipt37', '12518380', 'user_9', '2746-6-14');
INSERT INTO VERIFY VALUES ('verify47', 'receipt41', '16410914', 'user_29', '1746-3-26');
INSERT INTO VERIFY VALUES ('verify48', 'receipt15', '16679243', 'user_48', '7472-10-19');
INSERT INTO VERIFY VALUES ('verify49', 'receipt21', '25290079', 'user_24', '3214-10-18');
INSERT INTO VERIFY VALUES ('verify50', 'receipt10', '18118531', 'user_31', '1761-10-25');
"""