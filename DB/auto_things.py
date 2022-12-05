import numpy as np
import pandas as pd
# thing_id, admin_id, thing_name, category_id, latitude, longitude (경도, 위도는 float64타입으로 받아야 할듯)
p = "Semorang/insert_auto/"
df_things = pd.read_csv(p + "thing_50.csv")
# print(df_things)
cnt = 0
ans = []
df_things = df_things.fillna("NULL")

# print(df_things)
for i in range(df_things.shape[0]):
    temp = []
    
    for j in range(1, df_things.shape[1]):
        # admin_id를 넣기 위해
        if j == 2:
            if i % 5 == 0:
                cnt += 1
            ad_id = 'admin_'+str(cnt)
            temp.append(ad_id)

        # print(type(df_things.iloc[i][j]))
        if type(df_things.iloc[i][j]) == str:
            temp.append(str(df_things.iloc[i][j]))
        elif type(df_things.iloc[i][j]) == np.int64 or type(df_things.iloc[i][j]) == np.float64 or type(df_things.iloc[i][j]) == int:
            if type(df_things.iloc[i][j]) == float or type(df_things.iloc[i][j]) == np.float64:
                temp.append(df_things.iloc[i][j])
            else:
                temp.append(int(df_things.iloc[i][j]))
        
    ans.append(temp)
    
thing_attr = ('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude', 'sido', 'sigoongoo', 'bubjungdong')
for a in ans:
    print('INSERT INTO Thing' +' VALUES ' + str(tuple(a))+';') # + str(tuple(thing_attr)) 

"""
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
"""