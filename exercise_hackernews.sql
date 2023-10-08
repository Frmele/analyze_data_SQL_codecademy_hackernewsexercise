WITH prep AS(SELECT
  user,
  SUM(score) AS total_users,
  ROUND((SUM(score) * 100.0 / (SELECT SUM(score) FROM hacker_news)),2) AS percentage
FROM
  hacker_news
GROUP BY
  user
ORDER BY
  percentage DESC
  LIMIT 4)
SELECT SUM(prep.percentage) AS total_percentage_top_users FROM prep;
