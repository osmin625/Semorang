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
    
thing_attr = ('thing_id', 'admin_id', 'thing_name', 'category_id', 'latitude', 'longitude')
for a in ans:
    print('INSERT INTO Thing' + str(tuple(thing_attr)) +' VALUES ' + str(tuple(a))+';')