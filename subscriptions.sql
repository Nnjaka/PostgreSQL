CREATE TABLE subscriptions_users (
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  subscribed_at TIMESTAMP,
  PRIMARY KEY (from_user_id, to_user_id)
);

CREATE TABLE subscriptions_communities (
  user_id INT NOT NULL,
  community_id INT NOT NULL,
  subscribed_at TIMESTAMP,
  PRIMARY KEY (community_id, user_id)
);
