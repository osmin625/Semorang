#Admin_id, Password, phone_number

from random import random, seed


n = 10 # 10명 이상 (default = 10)

seed(1)

def auto_admin(n):
    insert_quote = []
    admin_attr = ['admin_id', 'password']
    admin_tup = []
    for i in range(n):
        admin_id = 'admin_'+str(i+1)
        # pw는 8자 이상 15자 미만
        pw = str(int(random() * 10000000))
        pw = 'pw' + pw.zfill(7)
        # phone number 010 제외하고 뒤에 8자리만
        phone_num = str(int(random() * 100000000))
        phone_num = '010' + phone_num.zfill(8)
        admin_tup.append([admin_id, pw]) 
    
    for ad in admin_tup:
        insert_quote.append('INSERT INTO Admin VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote
result = auto_admin(n)
for r in result:
    print(r)


"""
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_1', 'pw1343642', '01084743373');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_2', 'pw7637746', '01025506902');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_3', 'pw4954350', '01044949106');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_4', 'pw6515929', '01078872335');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_5', 'pw0938595', '01002834747');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_6', 'pw8357651', '01043276706');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_7', 'pw7622800', '01000210605');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_8', 'pw4453871', '01072154003');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_9', 'pw2287622', '01094527069');
INSERT INTO Admin('admin_id', 'password', 'phone_number') VALUES ('admin_10', 'pw9014274', '01003058998');
"""

"""
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_1', 'pw1343642');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_2', 'pw7637746');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_3', 'pw4954350');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_4', 'pw6515929');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_5', 'pw0938595');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_6', 'pw8357651');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_7', 'pw7622800');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_8', 'pw4453871');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_9', 'pw2287622');
INSERT INTO Admin('admin_id', 'password') VALUES ('admin_10', 'pw9014274');
"""