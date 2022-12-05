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

n = 300

seed(1)

def auto_comment(n):
    insert_quote = []
    comment_tup = []
    for i in range(n):
        comment_id = 'cmt_'+str(i+1)

        snapshot_id = 'snap_' + str(random.randint(1,99))

        user = 'user_' + str(random.randint(1,50))
        
        comment = '댓글내용입니다' + str(50 - i)

        write_year = str(random.randint(2016,2019))
        write_month = str(random.randint(1,12))
        write_day = str(random.randint(1,28))
        write_date = write_year + '-' + write_month + '-' + write_day
        
        update_year = str(random.randint(2020,2022))
        update_month = str(random.randint(1,12))
        update_day = str(random.randint(1,28))
        update_date = update_year + '-' + update_month + '-' + update_day
        
        
        comment_tup.append([comment_id, snapshot_id, user, comment, write_date, update_date]) 

    
    for ad in comment_tup:
        insert_quote.append('INSERT INTO SNAPSHOT_COMMENT VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

result = auto_comment(n)
for r in result:
    print(r)