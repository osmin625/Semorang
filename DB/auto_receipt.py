# 예시)  INSERT INTO RECEIPT VALUES('receipt1', '2000-1-2','http://img1.jpg');

# 이름           널?       유형             
# ------------ -------- -------------- 
# RECEIPT_ID   NOT NULL VARCHAR2(11)   
# RECEIPT_DATE          DATE           
# RECEIPT_URL           VARCHAR2(1000) 

import random
from random import seed

n = 50

seed(1)

def auto_receipt(n):
    insert_quote = []
    receipt_attr = ['receipt_id', 'receipt_date', 'receipt_url']
    receipt_tup = []
    for i in range(n):
        receipt_id = 'receipt_'+str(i+1)
        
        year = str(random.randint(2019,2022))
        month = str(random.randint(1,12))
        day = str(random.randint(1,30))
        date = year + '-' + month + '-' + day
        
        img_url = 'http://img' + str(i+1) + '.jpg'

        receipt_tup.append([receipt_id, date, img_url]) 
    
    for ad in receipt_tup:
        insert_quote.append('INSERT INTO RECEIPT VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote
result = auto_receipt(n)
for r in result:
    print(r)


"""
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
"""









INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_1', 'pw1343642', '민서호', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_2', 'pw7609624', '윤지서', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_3', 'pw4878566', '고주서', '대구광역시 수성구');        
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_4', 'pw4453871', '전지은', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_5', 'pw0305899', '김지아', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_6', 'pw6864838', '조민아', '대구광역시 달서구');        
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_7', 'pw4378875', '윤채원', '대구광역시 남구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_8', 'pw6768485', '오윤호', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_9', 'pw8375779', '장지윤', '대구광역시 수성구');        
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_10', 'pw9925434', '민도윤', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_11', 'pw9732522', '장주아', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_12', 'pw2841593', '고윤아', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_13', 'pw8532879', '윤지서', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_14', 'pw1730074', '장지후', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_15', 'pw6637578', '이예아', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_16', 'pw4896935', '김윤준', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_17', 'pw8483015', '임현은', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_18', 'pw1703491', '장지준', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_19', 'pw9200864', '장지서', '대구광역시 달서구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_20', 'pw5777948', '윤도진', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_21', 'pw7836552', '민채우', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_22', 'pw9497192', '윤하은', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_23', 'pw4134000', '민하서', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_24', 'pw5384787', '임현후', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_25', 'pw0279749', '최지우', '대구광역시 달서구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_26', 'pw0916014', '장도준', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_27', 'pw8680780', '윤민호', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_28', 'pw1094886', '임예후', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_29', 'pw1674703', '정채우', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_30', 'pw7115899', '윤하연', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_31', 'pw0236345', '조하서', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_32', 'pw1087616', '고채원', '대구광역시 달서구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_33', 'pw9755534', '최민서', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_34', 'pw7188354', '박윤아', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_35', 'pw8322449', '권채연', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_36', 'pw6485064', '조지은', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_37', 'pw6309478', '김도우', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_38', 'pw3063866', '민서호', '대구광역시 수성구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_39', 'pw1582073', '임도우', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_40', 'pw8787178', '김현원', '대구광역시 남구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_41', 'pw8279131', '민현아', '대구광역시 서구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_42', 'pw2004074', '이지은', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_43', 'pw1941186', '이지서', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_44', 'pw4997999', '강현서', '대구광역시 북구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_45', 'pw1569652', '민하은', '대구광역시 중구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_46', 'pw4292404', '정지윤', '대구광역시 동구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_47', 'pw3438498', '고지아', '대구광역시 달서구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_48', 'pw9855082', '최서준', '대구광역시 남구');
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_49', 'pw1696941', '고채원', '대구광역시 달서구');       
INSERT INTO USERS('user_id', 'password', 'name', 'region') VALUES ('user_50', 'pw3322334', '장도후', '대구광역시 중구');