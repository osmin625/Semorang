# 이름          널?       유형            
# ----------- -------- ------------- 
# COMMENT_ID  NOT NULL VARCHAR2(11)  
# SNAPSHOT_ID NOT NULL VARCHAR2(11)  
# USER_ID              VARCHAR2(11)  
# COMMENTS             VARCHAR2(300) 
# WRITE_DATE           DATE          
# UPDATE_DATE          DATE

# INSERT INTO SNAPSHOT_COMMENT VALUES ('comment1','snapshot_2', 'user_45','commentcommentcommentcomment', '2030-11-5','9999-9-9');
import random
from random import seed

n = 50

seed(1)

def auto_comment(ind, n):
    insert_quote = []
    comment_tup = []
    for i in range(n):
        comment_id = 'comment'+str(i+1)

        snapshot_id = 'snapshot_' + str(1 + ind[i])

        user = 'user_' + str(random.randint(1,n))
        
        comment = 'commt' + str(50 - i)

        write_year = str(random.randint(1000,9999))
        write_month = str(random.randint(1,12))
        write_day = str(random.randint(1,30))
        write_date = write_year + '-' + write_month + '-' + write_day
        
        update_year = str(random.randint(1000,9999))
        update_month = str(random.randint(1,12))
        update_day = str(random.randint(1,30))
        update_date = update_year + '-' + update_month + '-' + update_day
        
        
        comment_tup.append([comment_id, snapshot_id, user, comment, write_date, update_date]) 

    
    for ad in comment_tup:
        insert_quote.append('INSERT INTO SNAPSHOT_COMMENT VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

ind = []
# 중복없이 랜덤 index 0~49
for i in range(n):
    a = random.randint(n-n,n-1)       
    while a in ind:
        a = random.randint(n-n,n-1)
    ind.append(a)

result = auto_comment(ind, n)
for r in result:
    print(r)