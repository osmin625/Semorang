#Admin_id, Password, phone_number

from random import random, seed


n = 10 # 10명 이상 (default = 10)

seed(1)

def auto_admin(n):
    insert_quote = []
    admin_attr = ['admin_id', 'password', 'phone_number']
    admin_tup = []
    for i in range(n):
        admin_id = 'admin_'+str(i+1)
        # pw는 8자 이상 15자 미만
        pw = str(int(random() * 10000000))
        pw = 'pw' + pw.zfill(7)
        # phone number 010 제외하고 뒤에 8자리만
        phone_num = str(int(random() * 100000000))
        phone_num = '010' + phone_num.zfill(8)
        admin_tup.append([admin_id, pw, phone_num]) 
    
    for ad in admin_tup:
        insert_quote.append('INSERT INTO Admin' + str(tuple(admin_attr)) +' VALUES ' + str(tuple(ad)) + ';')

    return insert_quote
result = auto_admin(n)
for r in result:
    print(r)