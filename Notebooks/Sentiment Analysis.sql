-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### Get the latest messages

-- COMMAND ----------

SELECT message
FROM sentiment_analysis_result
order by timestamp desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Get daily sentiments count

-- COMMAND ----------

SELECT DATE(timestamp) AS day, labels, COUNT(labels) AS total_message_count 
FROM sentiment_analysis_result
GROUP BY day, labels

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Get total sentiments till date

-- COMMAND ----------

SELECT labels, COUNT(labels) AS total_message_count 
FROM sentiment_analysis_result
GROUP BY labels

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Get the highly positive message for the day

-- COMMAND ----------

SELECT message, MAX(score) AS highest_score
FROM sentiment_analysis_result
WHERE DATE(timestamp) = CURRENT_DATE()
AND labels = 'POS'
GROUP BY message
ORDER BY highest_score DESC
LIMIT 1

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Get the highly negative message for the day

-- COMMAND ----------

SELECT message, MAX(score) AS highest_score
FROM sentiment_analysis_result
WHERE DATE(timestamp) = CURRENT_DATE()
AND labels = 'NEG'
GROUP BY message
ORDER BY highest_score DESC
LIMIT 1

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### All Positive Messages till date

-- COMMAND ----------

SELECT message AS positive_messages
FROM sentiment_analysis_result
WHERE labels = 'POS'
ORDER BY score DESC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### All Negative Messages till date

-- COMMAND ----------

SELECT message AS negative_messages
FROM sentiment_analysis_result
WHERE labels = 'NEG'
ORDER BY score DESC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### All Negative Messages

-- COMMAND ----------

SELECT message AS negative_message, score AS message_weightage
FROM sentiment_analysis_result
WHERE labels = 'NEG'
ORDER BY score DESC

-- COMMAND ----------


