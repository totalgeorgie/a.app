SELECT
  COUNT(*)
FROM
  users

User.count

SELECT
  COUNT(*)
FROM
  users
WHERE
  users.active = TRUE

SQL + ActiveRecord

(from InstaCart) Write the following queries in SQL and in Rails:

"count all users",
"count all active users (you define what active means)",
"count all users who visited the site within a certain time period".
SELECT
  COUNT(*)
FROM
  users;

User.count
SELECT
  COUNT(*)
FROM
  users
WHERE
  users.active = true;

User.where(:active => "TRUE").count
SELECT
  COUNT(*)
FROM
  users
WHERE
  users.last_login > DATETIME() - ?;

User.where("last_login > DATETIME() - ?", number_of_seconds).count