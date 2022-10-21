#user_id, password, name, region

from random import random, seed, choice

n = 50 # 50명 이상 (default = 50)

seed(1)

first_name_samples = "김이박최정강조윤장임권전오민고"
middle_name_samples = "민서예지도하주윤채현지"
last_name_samples = "준윤우원호후서연아은진"

region1 = ['대구 ']
region2 = ['북구', '남구', '중구', '서구', '동구', '수성구', '달서구']

def random_name():
    result = ""
    result += choice(first_name_samples)
    result += choice(middle_name_samples)
    result += choice(last_name_samples)
    return result

def random_region():
    result = ""
    result += choice(region1)
    result += choice(region2)
    return result

def auto_user(n):
    insert_quote = []
    user_attr = ['user_id', 'password', 'name', 'region']
    user_tup = []
    for i in range(n):
        user_id = 'user_'+str(i+1)
        # pw는 8자 이상 15자 미만
        pw = str(int(random() * 10000000))
        pw = 'pw' + pw.zfill(7)
        # name은 한글로 2~4글자 (일단 3글자로 해놓음)
        name = random_name()
        # region은 대구만 넣음 (군/구 까지만 넣음)
        region = random_region()
        # phone number
        ph_num = str(int(random() * 100000000))
        ph_num = '010' + ph_num.zfill(8)

        user_tup.append([user_id, pw, name, region, ph_num]) 
    
    for ad in user_tup:
        insert_quote.append('INSERT INTO Users'  +' VALUES ' + str(tuple(ad)) + ';') # + str(tuple(user_attr))

    return insert_quote
result = auto_user(n)
# for r in result:
#     print(r)


"""
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_1', 'pw1343642', '민서호', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_2', 'pw7609624', '윤지서', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_3', 'pw4878566', '고주서', '대구광역시 수성구');        
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_4', 'pw4453871', '전지은', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_5', 'pw0305899', '김지아', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_6', 'pw6864838', '조민아', '대구광역시 달서구');        
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_7', 'pw4378875', '윤채원', '대구광역시 남구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_8', 'pw6768485', '오윤호', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_9', 'pw8375779', '장지윤', '대구광역시 수성구');        
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_10', 'pw9925434', '민도윤', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_11', 'pw9732522', '장주아', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_12', 'pw2841593', '고윤아', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_13', 'pw8532879', '윤지서', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_14', 'pw1730074', '장지후', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_15', 'pw6637578', '이예아', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_16', 'pw4896935', '김윤준', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_17', 'pw8483015', '임현은', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_18', 'pw1703491', '장지준', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_19', 'pw9200864', '장지서', '대구광역시 달서구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_20', 'pw5777948', '윤도진', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_21', 'pw7836552', '민채우', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_22', 'pw9497192', '윤하은', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_23', 'pw4134000', '민하서', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_24', 'pw5384787', '임현후', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_25', 'pw0279749', '최지우', '대구광역시 달서구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_26', 'pw0916014', '장도준', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_27', 'pw8680780', '윤민호', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_28', 'pw1094886', '임예후', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_29', 'pw1674703', '정채우', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_30', 'pw7115899', '윤하연', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_31', 'pw0236345', '조하서', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_32', 'pw1087616', '고채원', '대구광역시 달서구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_33', 'pw9755534', '최민서', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_34', 'pw7188354', '박윤아', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_35', 'pw8322449', '권채연', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_36', 'pw6485064', '조지은', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_37', 'pw6309478', '김도우', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_38', 'pw3063866', '민서호', '대구광역시 수성구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_39', 'pw1582073', '임도우', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_40', 'pw8787178', '김현원', '대구광역시 남구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_41', 'pw8279131', '민현아', '대구광역시 서구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_42', 'pw2004074', '이지은', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_43', 'pw1941186', '이지서', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_44', 'pw4997999', '강현서', '대구광역시 북구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_45', 'pw1569652', '민하은', '대구광역시 중구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_46', 'pw4292404', '정지윤', '대구광역시 동구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_47', 'pw3438498', '고지아', '대구광역시 달서구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_48', 'pw9855082', '최서준', '대구광역시 남구');
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_49', 'pw1696941', '고채원', '대구광역시 달서구');       
INSERT INTO User('user_id', 'password', 'name', 'region') VALUES ('user_50', 'pw3322334', '장도후', '대구광역시 중구');
"""

"""

"""