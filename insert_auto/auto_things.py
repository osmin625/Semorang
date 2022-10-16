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
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (19956546, 'admin_1', '놀
부잔치마당', '한식', 128.582744978558, 35.8899289576918);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25721903, 'admin_1', '팔
공식당', '한식', 128.608384485469, 35.8678907393624);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16279477, 'admin_1', '바
름족발', '한식', 128.532266462261, 35.8364532324913);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (26427188, 'admin_1', '카
페리버', '커피점/카페', 128.428906962298, 35.8514410876675);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (20457402, 'admin_1', '어
담횟집', '한식', 128.563724907644, 35.9318408590601);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17700450, 'admin_2', '꽁
꽁냠냠효목점청년24시무인편의점', '패스트푸드', 128.639913393644, 35.8792998820455);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17840517, 'admin_2', '에
브리커피코리아', '커피점/카페', 128.644611620351, 35.8645652361682);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (18118921, 'admin_2', '반
야월원조말고기', '한식', 128.701041218587, 35.8698734436991);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17917192, 'admin_2', '케
이커웨이', '제과제빵떡케익', 128.594862258343, 35.8454343659936);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25339812, 'admin_2', '옹
고집', '한식', 128.43751620885, 35.862784848117);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16007871, 'admin_3', '가
우정', '한식', 128.536921734977, 35.8324576597571);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17837332, 'admin_3', '후
르쯔', '커피점/카페', 128.458255292497, 35.6931290424445);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (27293429, 'admin_3', '원
조굴국밥전문점', '한식', 128.594000693971, 35.8798241057735);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17528463, 'admin_3', '오
레오', '유흥주점', 128.608689243012, 35.8643019347209);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25807866, 'admin_3', '편
의방순대볶음전문점', '분식', 128.605712949588, 35.8558715804791);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17494596, 'admin_4', '온
나', '유흥주점', 128.628477324523, 35.8728347054572);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16429856, 'admin_4', '와
룡총각', '한식', 128.49815233782, 35.8560231344394);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25222908, 'admin_4', '쫄
쫄이포차', '한식', 128.552997000645, 35.8378017630786);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17270983, 'admin_4', '싱
싱서민회수산', '일식/수산물', 128.637752644427, 35.823853002125);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (9032277, 'admin_4', '이 
인영선산곱창', '한식', 128.583586554048, 35.8521414356912);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (15979946, 'admin_5', '천
왕왕갈비', '한식', 128.6009559675, 35.847576241394);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17228866, 'admin_5', '왕
돌해물찜', '일식/수산물', 128.63995704287, 35.9122517527952);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25748804, 'admin_5', '소
문난대성돼지국밥', '한식', 128.632096882379, 35.8210076428385);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (23387946, 'admin_5', '봉
구비어', '유흥주점', 128.514676626432, 35.8088408956724);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (26168908, 'admin_5', '미
소김밥천국', '분식', 128.558942480214, 35.8790008899253);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (20462610, 'admin_6', '레
드제플린식당', '유흥주점', 128.581339725858, 35.8567761238209);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16984288, 'admin_6', '그
곳에가고싶다', '한식', 128.650252710797, 35.7864800373685);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17813680, 'admin_6', '서
변돈가', '한식', 128.598652555725, 35.9195941749528);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25361027, 'admin_6', '역
전우동0410', '분식', 128.539582647123, 35.8184030003013);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (20681853, 'admin_6', '참
시루떡케익', '제과제빵떡케익', 128.631593154196, 35.8747381754755);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (19920455, 'admin_7', '우
당탕반점', '중식', 128.635907062745, 35.8560851233215);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (8722078, 'admin_7', '주 
택떡방앗간', '제과제빵떡케익', 128.568568119659, 35.8776668269216);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17564746, 'admin_7', '치
맥킹달성군청점', '닭/오리요리', 128.428729577338, 35.7752245875183);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16686422, 'admin_7', '153구포국수', '분식', 128.598201258016, 35.8684556274608);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (16636468, 'admin_7', '민
들레', '한식', 128.454957909134, 35.6981350529763);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (25337113, 'admin_8', '소
나무식당', '한식', 128.606538162797, 35.8784455293806);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (26215627, 'admin_8', '삼
삼정생고기', '한식', 128.569266794529, 35.8669648146996);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (23365788, 'admin_8', '갤
럭시', '유흥주점', 128.623119946164, 35.8406042805448);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (15996961, 'admin_8', '불
로포차', '유흥주점', 128.640497552835, 35.9133304468206);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17718061, 'admin_8', '스
파이스치킨', '닭/오리요리', 128.567582519194, 35.8761212132118);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17882119, 'admin_9', '아
싸명품가리비', '한식', 128.516256897196, 35.8956320508841);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (20092048, 'admin_9', '밥
앤드', '한식', 128.59788202904, 35.87165690903);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (22551678, 'admin_9', '엔
자임베이커리', '제과제빵떡케익', 128.609422776474, 35.8776738213158);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (18544447, 'admin_9', '황
금뜰', '한식', 128.621286483594, 35.8411275280425);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (19918213, 'admin_9', '창
녕식당', '한식', 128.613198414293, 35.8804396858784);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17229415, 'admin_10', ' 
아이스크림할인점', '패스트푸드', 128.597162964225, 35.9233780988592);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (28479949, 'admin_10', ' 
호산정식당', '한식', 128.604442489229, 35.8926879220643);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (22890071, 'admin_10', ' 
도람집숯불갈비', '한식', 128.563792436339, 35.8710646115385);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17450234, 'admin_10', ' 
파스타입니다', '한식', 128.700042960923, 35.8684281455287);
INSERT INTO Thing('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude') VALUES (17062555, 'admin_10', ' 
대동실내식당', '한식', 128.537178404161, 35.836052820374);
"""

"""
INSERT INTO Thing VALUES (17153533, 'admin_1', '육각수냉면', '한식', 128.499237601021, 35.8065805508925, '대구광역시', '달성군', '화원읍');
INSERT INTO Thing VALUES (16071652, 'admin_1', '육십계본리.감삼.', '유흥주점', 128.551598170642, 35.8436037337688, '대구광역시', '달서구', '성당동');
INSERT INTO Thing VALUES (26493497, 'admin_1', '한반도', '한식', 128.624202672212, 35.861527388391, '대구광역시', '수성구', '범 
어동');
INSERT INTO Thing VALUES (16607846, 'admin_1', '춤추는아양쭈꾸미', '일식/수산물', 128.650131883562, 35.8802094236444, '대구광역 
시', '동구', '효목동');
INSERT INTO Thing VALUES (19913706, 'admin_1', '칠성혼수찌짐', '한식', 128.603868744562, 35.8754756069556, '대구광역시', '북구', '칠성동1가');
INSERT INTO Thing VALUES (18141266, 'admin_2', '예안정', '한식', 128.624699814921, 35.8529171763849, '대구광역시', '수성구', '범
어동');
INSERT INTO Thing VALUES (20466207, 'admin_2', '진분식', '분식', 128.597899128692, 35.8724590000986, '대구광역시', '중구', '동문
동');
INSERT INTO Thing VALUES (17915881, 'admin_2', '큰바우국밥', '한식', 128.639328979746, 35.8216904576232, '대구광역시', '수성구', '지산동');
INSERT INTO Thing VALUES (20351420, 'admin_2', '서문떡집', '제과제빵떡케익', 128.57789971147, 35.8709615275397, '대구광역시', ' 
서구', '비산동');
INSERT INTO Thing VALUES (25670448, 'admin_2', '풍미한식당', '한식', 128.60226691967, 35.921333662681, '대구광역시', '북구', '동
변동');
INSERT INTO Thing VALUES (18099685, 'admin_3', '빵가워', '제과제빵떡케익', 128.638088052534, 35.9223383738416, '대구광역시', '동
구', '봉무동');
INSERT INTO Thing VALUES (26404842, 'admin_3', '주혜정식당', '한식', 128.551495122259, 35.8463081904392, '대구광역시', '달서구', '성당동');
INSERT INTO Thing VALUES (20454431, 'admin_3', '달달이분식당', '한식', 128.446911783266, 35.6978136647507, '대구광역시', '달성군
', '현풍읍');
INSERT INTO Thing VALUES (11809427, 'admin_3', '지혜의숲식당', '한식', 128.545705967274, 35.8334726542352, '대구광역시', '달서구
', '송현동');
INSERT INTO Thing VALUES (17121913, 'admin_3', '오진다떡볶이', '분식', 128.546791897699, 35.8610663758323, '대구광역시', '서구', '내당동');
INSERT INTO Thing VALUES (17180957, 'admin_4', '샌디치꿀비', '패스트푸드', 128.5208245668, 35.8623805059536, '대구광역시', '달서
구', '용산동');
INSERT INTO Thing VALUES (16429892, 'admin_4', '일차돌', '한식', 128.464349714026, 35.8597277815676, '대구광역시', '달성군', '다
사읍');
INSERT INTO Thing VALUES (17061688, 'admin_4', '파리바게뜨', '제과제빵떡케익', 128.480147916509, 35.8538971823181, '대구광역시', '달서구', '신당동');
INSERT INTO Thing VALUES (13650981, 'admin_4', '욜로참숯구이', '한식', 128.614440943869, 35.8964858142127, '대구광역시', '북구', '복현동');
INSERT INTO Thing VALUES (12452035, 'admin_4', '꼬마대통령테크노폴리스', '커피점/카페', 128.455104439843, 35.6928074935941, '대 
구광역시', '달성군', '현풍읍');
INSERT INTO Thing VALUES (25446803, 'admin_5', '낙영찜갈비별관', '한식', 128.605215869932, 35.872043808422, '대구광역시', '중구', '동인동1가');
INSERT INTO Thing VALUES (25637413, 'admin_5', '솔베르크', '커피점/카페', 128.639136482184, 35.993364763276, '대구광역시', '동구
', '중대동');
INSERT INTO Thing VALUES (26152749, 'admin_5', '명동돈까스', '양식', 128.578141773982, 35.8798924643544, '대구광역시', '서구', '원대동1가');
INSERT INTO Thing VALUES (20537228, 'admin_5', '대우다방', '커피점/카페', 128.639176463868, 35.8744186585571, '대구광역시', '동 
구', '효목동');
INSERT INTO Thing VALUES (19915168, 'admin_5', '서대구뽈찜', '일식/수산물', 128.551517827193, 35.854383977092, '대구광역시', '달
서구', '두류동');
INSERT INTO Thing VALUES (18522378, 'admin_6', '미숙이네떡볶이', '분식', 128.526568806148, 35.8117547878727, '대구광역시', '달서
구', '진천동');
INSERT INTO Thing VALUES (17250531, 'admin_6', '키친', '양식', 128.611015059739, 35.8686975922807, '대구광역시', '중구', '동인동
4가');
INSERT INTO Thing VALUES (16998558, 'admin_6', '핫도그&와플', '패스트푸드', 128.687334633763, 35.8316735949202, '대구광역시', ' 
수성구', '대흥동');
INSERT INTO Thing VALUES (17065522, 'admin_6', '헤일리', '커피점/카페', 128.563072825711, 35.8397739551717, '대구광역시', '남구', '대명동');
INSERT INTO Thing VALUES (16766353, 'admin_6', '아시안상회논라', '한식', 128.576783241062, 35.8635940680071, '대구광역시', '중구
', '대신동');
INSERT INTO Thing VALUES (17132968, 'admin_7', '알마튜나', '일식/수산물', 128.606376125991, 35.8557240238825, '대구광역시', '중 
구', '대봉동');
INSERT INTO Thing VALUES (17037699, 'admin_7', '진라멘', '한식', 128.638960666359, 35.8226838754232, '대구광역시', '수성구', '지
산동');
INSERT INTO Thing VALUES (18036508, 'admin_7', '윤옥연할매떡뽁이', '분식', 128.704623209293, 35.8416863032674, '대구광역시', '수
성구', '매호동');
INSERT INTO Thing VALUES (16596912, 'admin_7', '워커스피자', '양식', 128.593546105728, 35.8693620114877, '대구광역시', '중구', '남일동');
INSERT INTO Thing VALUES (19914667, 'admin_7', '본가장수촌', '한식', 128.582056400725, 35.8836230554125, '대구광역시', '북구', '고성동3가');
INSERT INTO Thing VALUES (17476050, 'admin_8', '통큰수산', '일식/수산물', 128.547470916243, 35.8293725890696, '대구광역시', '달 
서구', '송현동');
INSERT INTO Thing VALUES (12446973, 'admin_8', '보고싶다', '유흥주점', 128.599623775009, 35.8661952308069, '대구광역시', '중구', '삼덕동1가');
INSERT INTO Thing VALUES (25450382, 'admin_8', '김치찌개전문점', '한식', 128.553197866474, 35.838035184197, '대구광역시', '달서 
구', '성당동');
INSERT INTO Thing VALUES (11805327, 'admin_8', '김밥천국', '분식', 128.418961015721, 35.6544596755604, '대구광역시', '달성군', '구지면');
INSERT INTO Thing VALUES (18528355, 'admin_8', '유정김밥', '분식', 128.544981023683, 35.8132410522898, '대구광역시', '달서구', '상인동');
INSERT INTO Thing VALUES (25504095, 'admin_9', '누리마을', '한식', 128.504700014006, 35.8549502702625, '대구광역시', '달서구', '이곡동');
INSERT INTO Thing VALUES (18339760, 'admin_9', '한잔어때', '한식', 128.718280657715, 35.8806865251244, '대구광역시', '동구', '각
산동');
INSERT INTO Thing VALUES (17894218, 'admin_9', '유진식당', '한식', 128.589936131402, 35.8469458369239, '대구광역시', '남구', '대
명동');
INSERT INTO Thing VALUES (17705906, 'admin_9', '바른치킨', '닭/오리요리', 128.695806847404, 35.8702644000526, '대구광역시', '동 
구', '율하동');
INSERT INTO Thing VALUES (17147299, 'admin_9', '황제닭강정한방족발', '닭/오리요리', 128.704639394456, 35.8710421303414, '대구광 
역시', '동구', '신기동');
INSERT INTO Thing VALUES (16084483, 'admin_10', '디퍼스트펍', '유흥주점', 128.461156717619, 35.6981024525105, '대구광역시', '달 
성군', '유가읍');
INSERT INTO Thing VALUES (20637469, 'admin_10', '캐슬유흥주점', '유흥주점', 128.496419862494, 35.8036358348076, '대구광역시', ' 
달성군', '화원읍');
INSERT INTO Thing VALUES (12514592, 'admin_10', '배스킨라빈스31', '패스트푸드', 128.610463954441, 35.879137686358, '대구광역시', '동구', '신암동');
INSERT INTO Thing VALUES (20454525, 'admin_10', '통통돼지국밥', '한식', 128.619501802522, 35.9062481086533, '대구광역시', '북구', '검단동');
INSERT INTO Thing VALUES (17494619, 'admin_10', 'parcwooroc', '한식', 128.653318164299, 35.7244064444995, '대구광역시', '달성군', '가창면');
"""