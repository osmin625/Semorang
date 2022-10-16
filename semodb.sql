CREATE TABLE RECEIPT(
receipt_id VARCHAR(11) NOT NULL,
receipt_date DATE,
receipt_image_metadata BLOB
);

--DROP TABLE VERIFY;
CREATE TABLE VERIFY(
verify_id VARCHAR(11) NOT NULL,
receipt_id VARCHAR(11),
thing_id VARCHAR(11),
user_id VARCHAR(11),
verify_date DATE,
PRIMARY KEY (verify_id)
);

--DROP TABLE USERS;
CREATE TABLE USERS(
user_id VARCHAR(11) NOT NULL,
password VARCHAR(15),
name VARCHAR(30) NOT NULL,
region VARCHAR(20),
phone_number VARCHAR(13) NOT NULL,
PRIMARY KEY(user_id),
UNIQUE(phone_number)
);

--DROP TABLE FOLLOW;
CREATE TABLE FOLLOW(
follow_id VARCHAR(11) NOT NULL,
following_uid VARCHAR(11),
follow_uid VARCHAR(11),
follow_date DATE,
PRIMARY KEY(follow_id)
);

--DROP TABLE THING;
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
UNIQUE(thing_name)
);

--DROP TABLE THINGRANK;
CREATE TABLE THINGRANK(
thing_rank_id VARCHAR(11) NOT NULL,
thing_id VARCHAR(11),
user_id VARCHAR(11),
ranks NUMBER(9),
thingking_date DATE,
update_date DATE,
PRIMARY KEY(thing_rank_id)
);

--DROP TABLE ADMIN;
CREATE TABLE ADMIN(
admin_id VARCHAR(11) NOT NULL,
password VARCHAR(15) NOT NULL,
PRIMARY KEY(admin_id)
);

DROP TABLE RANKING_SNAPSHOT;
CREATE TABLE RANKING_SNAPSHOT(
snapshot_id VARCHAR(11) NOT NULL,
thing_rank_id VARCHAR(11),
user_id VARCHAR(11),
content VARCHAR(3000) NOT NULL,
taken_date DATE,
update_date DATE,
like_count NUMBER(10),
dislike_count NUMBER(10),
PRIMARY KEY(snapshot_id)
);
CREATE TABLE SNAPSHOT_COMMENT(
comment_id VARCHAR(11) NOT NULL,
snapshot_id VARCHAR(11),
user_id VARCHAR(11),
comments VARCHAR(300),
write_date DATE,
update_date DATE,
PRIMARY KEY(comment_id)
);

commit;