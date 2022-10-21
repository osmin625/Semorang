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

n = 50
ind=[]

def thing_id_extraction(ex):
    ans = []
    temp_ex = list(ex.split('\n'))
    for t in temp_ex:
        temp = list(t.split(' '))
        
        ans.append(temp[4][1:9])
    return ans

def auto_TR(tr, n):
    insert_quote = []
    # INSERT INTO THINGRANK VALUES ('for_match1', '23266088', 'user_39', 0, '1999-9-9', '1999-9-9');
    # THING_RANK_ID, THING_ID, USER_ID, RANKS, THINGKING_DATE, UPDATE_DATE
    TR_attr = ['THING_RANK_ID', 'THING_ID', 'USER_ID', 'RANKS', 'THINGKING_DATE', 'UPDATE_DATE']
    TR_tup = []
    for i in range(n):
        TR_id = 'for_match' + str(i+1)
        # thing random 추출
        thing_id = tr[ind[i]]

        usr_ind = []
        ai = random.randint(0,n-1)       
        while a in usr_ind:
            ai = random.randint(0,n-1)
        
        user_id = 'user_' + str(ai)
        
        thingking_year = str(random.randint(1000,9999))
        thingking_month = str(random.randint(1,12))
        thingking_day = str(random.randint(1,30))
        thingking_date = thingking_year + '-' + thingking_month + '-' + thingking_day
        
        update_year = str(random.randint(1000,9999))
        update_month = str(random.randint(1,12))
        update_day = str(random.randint(1,30))
        update_date = update_year + '-' + update_month + '-' + update_day
        
        TR_tup.append([TR_id, thing_id, user_id, i+1, thingking_date, update_date]) 
    
    for ad in TR_tup:
        insert_quote.append('INSERT INTO TR VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

thing_id = thing_id_extraction(need_extract)

# 중복없이 랜덤 index 0~49
for i in range(n):
    a = random.randint(0,n-1)       
    while a in ind:
        a = random.randint(0,n-1)
    ind.append(a)

ans = auto_TR(thing_id, n)

for a in ans:
    print(a)
    


"""
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
INSERT INTO THINGRANK VALUES ('for_match37', '18223652', 'user_25', 37, '1835-2-30', '1775-9-25');
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
"""