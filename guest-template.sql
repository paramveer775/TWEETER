CREATE TABLE USER (
  user_id int NOT NULL PRIMARY KEY,
  name varchar NOT NULL,
  email integer NOT NULL,
  phone_number integer NOT NULL,
  password integer NOT NULL,
  pic integer NOT NULL
);

CREATE TABLE ACCOUNT (
  account_id int NOT NULL PRIMARY KEY,
  user_id int NOT NULL,
  name text NOT NULL,
  profile_pic integer NOT NULL,
  FOREIGN KEY (user_id) REFERENCES USER(user_id)
);

CREATE TABLE POST (
  post_id int NOT NULL PRIMARY KEY,
  account_id varchar NOT NULL,
  text integer NOT NULL,
  content integer NOT NULL,
  likes integer NOT NULL,
  comments integer NOT NULL,
  FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE POST_LIKES (
  post_id int NOT NULL PRIMARY KEY,
  post_likecount int NOT NULL,
  post_discount int NOT NULL,
  FOREIGN KEY (post_id) REFERENCES POST(post_id)
);

CREATE TABLE COMMENT (
  comment_id int NOT NULL PRIMARY KEY,
  post_id int NOT NULL,
  account_id int NOT NULL,
  text_body text NOT NULL,
  FOREIGN KEY (post_id) REFERENCES POST(post_id),
  FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE FOLLOWERS (
  account_id int NOT NULL PRIMARY KEY,
  follower_id int NOT NULL,
  following_id int NOT NULL,
  FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

CREATE TABLE MESSAGES (
  message_id int NOT NULL PRIMARY KEY,
  senders_id int NOT NULL,
  receivers_id int NOT NULL,
  message_text text NOT NULL,
  post_id int NOT NULL,
  FOREIGN KEY (senders_id) REFERENCES ACCOUNT(account_id),
  FOREIGN KEY (receivers_id) REFERENCES ACCOUNT(account_id),
  FOREIGN KEY (post_id) REFERENCES POST(post_id)
);

CREATE TABLE TAGS (
  tag_id int NOT NULL PRIMARY KEY,
  account_id int NOT NULL,
  name int NOT NULL,
  FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id),
  FOREIGN KEY (name) REFERENCES POST(post_id)
);

CREATE TABLE tags_post (
  tag_id int NOT NULL PRIMARY KEY,
  post_id varchar NOT NULL,
  FOREIGN KEY (tag_id) REFERENCES TAGS(tag_id),
  FOREIGN KEY (post_id) REFERENCES POST(post_id)
);

CREATE TABLE tags_comment (
  tag_id int NOT NULL PRIMARY KEY,
  comment_id varchar NOT NULL,
  FOREIGN KEY (tag_id) REFERENCES TAGS(tag_id),
  FOREIGN KEY (comment_id) REFERENCES COMMENT(comment_id)
);