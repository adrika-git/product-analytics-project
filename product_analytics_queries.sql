-- Product Analytics: User Behaviour & Conversion Funnel
-- Dataset: simulated event-level ecommerce data; one row = one event.
-- Run in SQLite / DB Browser for SQLite / DuckDB (after importing data/events.csv as events).

-- 1. Basic event and user counts
SELECT
  COUNT(*) AS total_events,
  COUNT(DISTINCT user_id) AS unique_users,
  COUNT(DISTINCT session_id) AS sessions
FROM events;

-- 2. Funnel by sessions (COUNT DISTINCT avoids counting repeated events)
SELECT
  COUNT(DISTINCT CASE WHEN event_name = 'session_start' THEN session_id END) AS sessions_started,
  COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN session_id END) AS product_view_sessions,
  COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN session_id END) AS add_to_cart_sessions,
  COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN session_id END) AS checkout_sessions,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN session_id END) AS purchase_sessions
FROM events;

-- 3. Conversion by device
SELECT
  device_category,
  COUNT(DISTINCT session_id) AS sessions,
  COUNT(DISTINCT CASE WHEN event_name='purchase' THEN session_id END) AS purchase_sessions,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN event_name='purchase' THEN session_id END)
        / COUNT(DISTINCT session_id), 2) AS session_conversion_pct
FROM events
GROUP BY device_category
ORDER BY session_conversion_pct DESC;

-- 4. Conversion by traffic source
SELECT
  traffic_source,
  COUNT(DISTINCT session_id) AS sessions,
  COUNT(DISTINCT CASE WHEN event_name='purchase' THEN session_id END) AS purchase_sessions,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN event_name='purchase' THEN session_id END)
        / COUNT(DISTINCT session_id), 2) AS session_conversion_pct
FROM events
GROUP BY traffic_source
ORDER BY session_conversion_pct DESC;

-- 5. Revenue by product
SELECT
  product_name,
  product_category,
  ROUND(SUM(revenue), 2) AS revenue
FROM events
WHERE event_name='purchase'
GROUP BY product_name, product_category
ORDER BY revenue DESC;

-- 6. Daily sessions and revenue
SELECT
  event_date,
  COUNT(DISTINCT session_id) AS sessions,
  ROUND(SUM(revenue), 2) AS revenue
FROM events
GROUP BY event_date
ORDER BY event_date;
