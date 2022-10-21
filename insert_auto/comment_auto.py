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
    a = random.randint(0,n-1)       
    while a in ind:
        a = random.randint(0,n-1)
    ind.append(a)

result = auto_comment(ind, n)
for r in result:
    print(r)

"""
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment1', 'snapshot_9', 'user_3', 'commt50', '3625-8-23', '9295-11-14');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment2', 'snapshot_37', 'user_35', 'commt49', '4614-11-26', '9463-8-8');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment3', 'snapshot_49', 'user_34', 'commt48', '1502-7-22', '6263-11-21');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment4', 'snapshot_5', 'user_28', 'commt47', '1963-12-10', '3059-4-29');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment5', 'snapshot_17', 'user_4', 'commt46', '6019-2-28', '2252-5-30');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment6', 'snapshot_8', 'user_20', 'commt45', '3592-7-19', '5134-3-1'); 
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment7', 'snapshot_32', 'user_36', 'commt44', '1621-10-27', '4565-10-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment8', 'snapshot_29', 'user_11', 'commt43', '9337-1-13', '4283-6-4');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment9', 'snapshot_31', 'user_14', 'commt42', '8093-10-7', '9066-2-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment10', 'snapshot_42', 'user_25', 'commt41', '5850-9-16', '1281-6-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment11', 'snapshot_25', 'user_26', 'commt40', '5609-1-6', '4290-6-26');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment12', 'snapshot_14', 'user_37', 'commt39', '3214-6-14', '4490-5-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment13', 'snapshot_7', 'user_7', 'commt38', '7213-9-12', '9754-8-25');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment14', 'snapshot_2', 'user_35', 'commt37', '4844-2-24', '1661-2-5');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment15', 'snapshot_28', 'user_11', 'commt36', '3728-9-7', '5391-6-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment16', 'snapshot_39', 'user_33', 'commt35', '5182-6-11', '6575-2-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment17', 'snapshot_50', 'user_16', 'commt34', '9008-3-19', '2708-6-2');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment18', 'snapshot_1', 'user_27', 'commt33', '2199-7-28', '3413-3-11');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment19', 'snapshot_45', 'user_8', 'commt32', '7193-2-19', '4665-10-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment20', 'snapshot_18', 'user_18', 'commt31', '6978-5-19', '9753-2-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment21', 'snapshot_47', 'user_18', 'commt30', '2765-1-27', '5845-1-20');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment22', 'snapshot_15', 'user_43', 'commt29', '1238-2-14', '2885-1-7');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment23', 'snapshot_38', 'user_16', 'commt28', '7897-3-4', '8387-3-22');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment24', 'snapshot_21', 'user_16', 'commt27', '3604-12-28', '2684-7-30');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment25', 'snapshot_35', 'user_25', 'commt26', '9895-5-18', '5151-12-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment26', 'snapshot_44', 'user_21', 'commt25', '2640-4-21', '6200-1-1');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment27', 'snapshot_34', 'user_1', 'commt24', '5842-12-20', '6246-8-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment28', 'snapshot_36', 'user_21', 'commt23', '7529-2-3', '6199-10-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment29', 'snapshot_23', 'user_8', 'commt22', '5097-4-26', '9895-12-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment30', 'snapshot_30', 'user_43', 'commt21', '6829-5-6', '9873-4-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment31', 'snapshot_19', 'user_13', 'commt20', '5036-6-3', '5600-2-25');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment32', 'snapshot_27', 'user_29', 'commt19', '2482-11-19', '6552-4-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment33', 'snapshot_12', 'user_20', 'commt18', '1672-6-6', '6189-10-29');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment34', 'snapshot_41', 'user_20', 'commt17', '5027-6-4', '9916-10-19');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment35', 'snapshot_48', 'user_39', 'commt16', '2508-4-8', '1333-4-13');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment36', 'snapshot_22', 'user_5', 'commt15', '5391-9-28', '2161-12-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment37', 'snapshot_46', 'user_2', 'commt14', '1162-5-25', '6884-8-16');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment38', 'snapshot_33', 'user_10', 'commt13', '2653-9-25', '6375-2-17');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment39', 'snapshot_43', 'user_43', 'commt12', '3838-3-25', '3450-3-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment40', 'snapshot_13', 'user_21', 'commt11', '6007-2-23', '9427-10-10');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment41', 'snapshot_20', 'user_9', 'commt10', '4387-3-18', '1520-6-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment42', 'snapshot_26', 'user_40', 'commt9', '4365-3-10', '8088-9-6');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment43', 'snapshot_3', 'user_4', 'commt8', '5051-5-25', '2055-11-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment44', 'snapshot_16', 'user_28', 'commt7', '9999-5-18', '8199-9-15');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment45', 'snapshot_24', 'user_1', 'commt6', '7483-6-6', '5226-8-1');  
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment46', 'snapshot_6', 'user_42', 'commt5', '7826-10-1', '2021-12-12');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment47', 'snapshot_11', 'user_38', 'commt4', '3265-10-5', '3269-5-27');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment48', 'snapshot_40', 'user_18', 'commt3', '7517-10-13', '3820-10-3');
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment49', 'snapshot_4', 'user_15', 'commt2', '8962-1-6', '9662-6-17'); 
INSERT INTO SNAPSHOT_COMMENT VALUES ('comment50', 'snapshot_10', 'user_42', 'commt1', '8181-11-21', '4698-4-11');

"""