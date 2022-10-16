#user_id, password, name, region

from random import random, seed, choice

n = 50 # 50명 이상 (default = 50)

seed(1)

first_name_samples = "김이박최정강조윤장임권전오민고"
middle_name_samples = "민서예지도하주윤채현지"
last_name_samples = "준윤우원호후서연아은진"

region1 = ['대구광역시 ']
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
        user_id = 'user_'+str(i)
        # pw는 8자 이상 15자 미만
        pw = str(int(random() * 10000000))
        pw = 'pw' + pw.zfill(7)
        # name은 한글로 2~4글자 (일단 3글자로 해놓음)
        name = random_name()
        # region은 대구만 넣음 (군/구 까지만 넣음)
        region = random_region()

        user_tup.append([user_id, pw, name, region]) 
    
    for ad in user_tup:
        insert_quote.append('INSERT INTO User' + str(tuple(user_attr)) +' VALUES ' + str(tuple(ad)) + ';')

    return insert_quote
result = auto_user(n)
for r in result:
    print(r)
