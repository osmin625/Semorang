DROP TABLE RECEIPT;
CREATE TABLE RECEIPT(
receipt_id VARCHAR(11) NOT NULL,
receipt_date DATE,
receipt_url VARCHAR(1000),
PRIMARY KEY (receipt_id)
);
commit;

DROP TABLE VERIFY;
CREATE TABLE VERIFY(
verify_id VARCHAR(11) NOT NULL,
receipt_id VARCHAR(11),
thing_id NUMBER(8),
user_id VARCHAR(11),
verify_date DATE,
PRIMARY KEY (verify_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_id) REFERENCES THING(thing_id) ON DELETE CASCADE,
FOREIGN KEY (receipt_id) REFERENCES RECEIPT(receipt_id) ON DELETE CASCADE
);


commit;
DROP TABLE USERS CASCADE CONSTRAINTS;
CREATE TABLE USERS(
user_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
name VARCHAR(30) NOT NULL,
region VARCHAR(20),
phone_number VARCHAR(13) NOT NULL,
PRIMARY KEY(user_id),
UNIQUE(phone_number)
);

DROP TABLE FOLLOW;
CREATE TABLE FOLLOW(
follow_id VARCHAR(11) NOT NULL,
following_uid VARCHAR(11) NOT NULL,
follower_uid VARCHAR(11) NOT NULL,
follow_date DATE,
PRIMARY KEY(follow_id),
FOREIGN KEY (follower_uid) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (following_uid) REFERENCES USERS(user_id) ON DELETE CASCADE
);
DELETE FROM FOLLOW 
WHERE FOLLOW.follow_id = 'f00106';
ALTER TABLE FOLLOW
    ADD UNIQUE (following_uid, follower_uid);

DROP TABLE THING CASCADE CONSTRAINTS;
CREATE TABLE THING(
thing_id NUMBER(8) NOT NULL,
admin_id VARCHAR(11),
thing_name VARCHAR(30) NOT NULL,
categories VARCHAR(6),
latitude NUMBER(18,15),
longitude NUMBER(18,15),
sido VARCHAR2(15),
sigoongoo VARCHAR2(15),
bubjungdong VARCHAR2(15),
PRIMARY KEY(thing_id),
UNIQUE(thing_name),
FOREIGN KEY (admin_id) REFERENCES ADMIN(admin_id) ON DELETE CASCADE
);

commit;

DROP TABLE THINGRANK;
CREATE TABLE THINGRANK(
thing_rank_id VARCHAR(11) NOT NULL,
thing_id NUMBER(8),
user_id VARCHAR(11),
ranks NUMBER(9),
thingking_date DATE,
update_date DATE,
PRIMARY KEY(thing_rank_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_id) REFERENCES THING(thing_id) ON DELETE CASCADE
);


DROP TABLE ADMIN;
CREATE TABLE ADMIN(
admin_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
PRIMARY KEY(admin_id)
);

DROP TABLE RANKING_SNAPSHOT CASCADE CONSTRAINTS;
CREATE TABLE RANKING_SNAPSHOT(
snapshot_id VARCHAR(11) NOT NULL,
thing_rank_id VARCHAR(11),
user_id VARCHAR(11),
content VARCHAR(3000) NOT NULL,
taken_date DATE,
update_date DATE,
like_count NUMBER(10),
dislike_count NUMBER(10),
PRIMARY KEY(snapshot_id),
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
FOREIGN KEY (thing_rank_id) REFERENCES THINGRANK(thing_rank_id) ON DELETE CASCADE
);

DROP TABLE SNAPSHOT_COMMENT;
CREATE TABLE SNAPSHOT_COMMENT(
comment_id VARCHAR(11) NOT NULL,
snapshot_id VARCHAR(11) NOT NULL,
user_id VARCHAR(11),
comments VARCHAR(300),
write_date DATE,
update_date DATE,
PRIMARY KEY(comment_id,snapshot_id),
FOREIGN KEY (snapshot_id) REFERENCES RANKING_SNAPSHOT(snapshot_id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE SET NULL
);

commit;

