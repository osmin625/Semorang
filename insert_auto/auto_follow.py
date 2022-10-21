# INSERT INTO FOLLOW VALUES ('f00001','user_1', 'user_2','2005-10-10');

# 이름            널?       유형           
# ------------- -------- ------------ 
# FOLLOW_ID     NOT NULL VARCHAR2(11) 
# FOLLOWING_UID NOT NULL VARCHAR2(11) 
# FOLLOWER_UID  NOT NULL VARCHAR2(11) 
# FOLLOW_DATE            DATE 

import random

n = 50

def auto_follow(u, n):
    insert_quote = []
    follow_attr = ['follow_id', 'following_uid', 'follow_uid', 'follow_date']
    follow_tup = []
    for i in range(n):
        follow_id = 'f'+str(i+1).zfill(5)
        
        following_uid = 'user_' + str(u[i][0])
        follow_uid = 'user_' + str(u[i][1])
        
        year = str(random.randint(1000,9999))
        month = str(random.randint(1,12))
        day = str(random.randint(1,30))
        date = year + '-' + month + '-' + day
        
        follow_tup.append([follow_id, following_uid, follow_uid, date]) 
    
    for ad in follow_tup:
        insert_quote.append('INSERT INTO FOLLOW VALUES ' + str(tuple(ad)) + ';') 

    return insert_quote

usr = []
while len(usr) != n:
    a = random.randint(1,n)
    b = random.randint(1,n)       
    while (a in usr) and (b in usr) and (a == b):
        a = random.randint(1,n)
        b = random.randint(1,n)       
    usr.append([a, b])

ans = auto_follow(usr, n)
for a in ans:
    print(a)

"""
INSERT INTO FOLLOW VALUES ('f00001', 'user_32', 'user_46', '4959-7-22');
INSERT INTO FOLLOW VALUES ('f00002', 'user_50', 'user_8', '6152-4-14');
INSERT INTO FOLLOW VALUES ('f00003', 'user_3', 'user_20', '7092-6-10');
INSERT INTO FOLLOW VALUES ('f00004', 'user_8', 'user_34', '1063-8-5');
INSERT INTO FOLLOW VALUES ('f00005', 'user_13', 'user_9', '9603-5-24');
INSERT INTO FOLLOW VALUES ('f00006', 'user_6', 'user_42', '8467-11-26');
INSERT INTO FOLLOW VALUES ('f00007', 'user_10', 'user_45', '1825-11-1');
INSERT INTO FOLLOW VALUES ('f00008', 'user_4', 'user_21', '3789-2-20');
INSERT INTO FOLLOW VALUES ('f00009', 'user_2', 'user_35', '1834-5-2');
INSERT INTO FOLLOW VALUES ('f00010', 'user_29', 'user_29', '5277-10-22');
INSERT INTO FOLLOW VALUES ('f00011', 'user_39', 'user_5', '2229-1-6');
INSERT INTO FOLLOW VALUES ('f00012', 'user_40', 'user_41', '7933-1-28');
INSERT INTO FOLLOW VALUES ('f00013', 'user_34', 'user_34', '9230-1-16');
INSERT INTO FOLLOW VALUES ('f00014', 'user_22', 'user_48', '8558-10-26');
INSERT INTO FOLLOW VALUES ('f00015', 'user_43', 'user_25', '5932-12-21');
INSERT INTO FOLLOW VALUES ('f00016', 'user_12', 'user_16', '4746-8-18');
INSERT INTO FOLLOW VALUES ('f00017', 'user_43', 'user_41', '5015-9-29');
INSERT INTO FOLLOW VALUES ('f00018', 'user_27', 'user_4', '1921-5-27');
INSERT INTO FOLLOW VALUES ('f00019', 'user_49', 'user_37', '9044-12-24');
INSERT INTO FOLLOW VALUES ('f00020', 'user_32', 'user_4', '4236-5-12');
INSERT INTO FOLLOW VALUES ('f00021', 'user_48', 'user_14', '2677-12-29');
INSERT INTO FOLLOW VALUES ('f00022', 'user_31', 'user_11', '2624-11-9');
INSERT INTO FOLLOW VALUES ('f00023', 'user_39', 'user_12', '5049-1-18');
INSERT INTO FOLLOW VALUES ('f00024', 'user_35', 'user_37', '3906-2-15');
INSERT INTO FOLLOW VALUES ('f00025', 'user_36', 'user_36', '8237-5-24');
INSERT INTO FOLLOW VALUES ('f00026', 'user_45', 'user_7', '9039-2-7');
INSERT INTO FOLLOW VALUES ('f00027', 'user_32', 'user_40', '4046-3-16');
INSERT INTO FOLLOW VALUES ('f00028', 'user_25', 'user_17', '2632-5-15');
INSERT INTO FOLLOW VALUES ('f00029', 'user_37', 'user_40', '5866-10-12');
INSERT INTO FOLLOW VALUES ('f00030', 'user_13', 'user_44', '6695-3-24');
INSERT INTO FOLLOW VALUES ('f00031', 'user_15', 'user_46', '8112-7-26');
INSERT INTO FOLLOW VALUES ('f00032', 'user_9', 'user_23', '5926-5-18');
INSERT INTO FOLLOW VALUES ('f00033', 'user_47', 'user_46', '8329-9-27');
INSERT INTO FOLLOW VALUES ('f00034', 'user_20', 'user_27', '8871-9-11');
INSERT INTO FOLLOW VALUES ('f00035', 'user_36', 'user_32', '1642-7-9');
INSERT INTO FOLLOW VALUES ('f00036', 'user_27', 'user_38', '6236-6-29');
INSERT INTO FOLLOW VALUES ('f00037', 'user_5', 'user_10', '7803-3-14');
INSERT INTO FOLLOW VALUES ('f00038', 'user_43', 'user_42', '2322-5-8');
INSERT INTO FOLLOW VALUES ('f00039', 'user_4', 'user_36', '7040-9-14');
INSERT INTO FOLLOW VALUES ('f00040', 'user_10', 'user_2', '1025-4-10');
INSERT INTO FOLLOW VALUES ('f00041', 'user_8', 'user_37', '7552-11-20');
INSERT INTO FOLLOW VALUES ('f00042', 'user_20', 'user_13', '3246-12-16');
INSERT INTO FOLLOW VALUES ('f00043', 'user_34', 'user_36', '7298-4-7');
INSERT INTO FOLLOW VALUES ('f00044', 'user_10', 'user_2', '7523-2-14');
INSERT INTO FOLLOW VALUES ('f00045', 'user_46', 'user_46', '4133-11-30');
INSERT INTO FOLLOW VALUES ('f00046', 'user_45', 'user_3', '8929-4-28');
INSERT INTO FOLLOW VALUES ('f00047', 'user_19', 'user_11', '6284-12-1');
INSERT INTO FOLLOW VALUES ('f00048', 'user_21', 'user_21', '8760-3-2');
INSERT INTO FOLLOW VALUES ('f00049', 'user_35', 'user_25', '1561-8-27');
INSERT INTO FOLLOW VALUES ('f00050', 'user_43', 'user_37', '7883-2-16');
"""