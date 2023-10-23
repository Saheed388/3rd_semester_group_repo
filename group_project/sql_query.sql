CREATE OR REPLACE TABLE `poetic-now-399015.eviction_dataset.date_time_table` AS
SELECT
  file_date,
  constraints_date
FROM
  `poetic-now-399015.eviction_dataset.eviction_table111`;








-- CREATE TABLE `poetic-now-399015.eviction_dataset.fact_table` AS
-- SELECT
--   eviction_id,
--   file_date,
--   non_payment,
--   breach,
--   nuisance,
--   illegal_use,
--   failure_to_sign_renewal,
--   access_denial,
--   unapproved_subtenant,
--   owner_move_in,
--   demolition,
--   capital_improvement,
--   substantial_rehab,
--   ellis_act_withdrawal,
--   condo_conversion,
--   roommate_same_unit,
--   other_cause,
--   late_payments,
--   lead_remediation,
--   development,
--   good_samaritan_ends,
--   constraints_date
-- FROM
--   `poetic-now-399015.eviction_dataset.eviction_table111`;








-- CREATE TABLE `poetic-now-399015.eviction_dataset.dimensional_table` AS
-- SELECT
--   eviction_id,
--   address,
--   city,
--   state,
--   zip,
--   supervisor_district,
--   neighborhood,
--   shape
-- FROM
--   `poetic-now-399015.eviction_dataset.eviction_table111`;


SELECT
  d.city,
  COUNT(*) AS demolition_count
FROM
  `poetic-now-399015.eviction_dataset.dimensional_table` AS d
JOIN
  `poetic-now-399015.eviction_dataset.fact_table` AS f
ON
  d.eviction_id = f.eviction_id
WHERE
  f.demolition = FALSE
GROUP BY
  d.city
ORDER BY
  demolition_count DESC
LIMIT 10;







-- SELECT
--   d.eviction_id,
--   d.address,
--   d.city,
--   d.state,
--   d.zip,
--   d.supervisor_district,
--   d.neighborhood,
--   d.shape,
--   f.file_date,
--   f.non_payment,
--   f.breach,
--   f.nuisance,
--   f.illegal_use,
--   f.failure_to_sign_renewal,
--   f.access_denial,
--   f.unapproved_subtenant,
--   f.owner_move_in,
--   f.demolition,
--   f.capital_improvement,
--   f.substantial_rehab,
--   f.ellis_act_withdrawal,
--   f.condo_conversion,
--   f.roommate_same_unit,
--   f.other_cause,
--   f.late_payments,
--   f.lead_remediation,
--   f.development,
--   f.good_samaritan_ends,
-- FROM
--   `poetic-now-399015.eviction_dataset.dimensional_table` AS d
-- JOIN
--   `poetic-now-399015.eviction_dataset.fact_table` AS f
-- ON
--   d.eviction_id = f.eviction_id
-- JOIN
--   `poetic-now-399015.eviction_dataset.date_time_table` AS dt
-- ON
--   f.file_date = dt.file_date;

SELECT
  file_date,
  IFNULL(CAST(IF(non_payment, 1, 0) AS INT64), 0) AS non_payment,
  IFNULL(CAST(IF(breach, 1, 0) AS INT64), 0) AS breach,
  IFNULL(CAST(IF(nuisance, 1, 0) AS INT64), 0) AS nuisance,
  IFNULL(CAST(IF(illegal_use, 1, 0) AS INT64), 0) AS illegal_use,
  IFNULL(CAST(IF(failure_to_sign_renewal, 1, 0) AS INT64), 0) AS failure_to_sign_renewal,
  IFNULL(CAST(IF(access_denial, 1, 0) AS INT64), 0) AS access_denial,
  IFNULL(CAST(IF(unapproved_subtenant, 1, 0) AS INT64), 0) AS unapproved_subtenant,
  IFNULL(CAST(IF(owner_move_in, 1, 0) AS INT64), 0) AS owner_move_in,
  IFNULL(CAST(IF(demolition, 1, 0) AS INT64), 0) AS demolition,
  IFNULL(CAST(IF(capital_improvement, 1, 0) AS INT64), 0) AS capital_improvement,
  IFNULL(CAST(IF(substantial_rehab, 1, 0) AS INT64), 0) AS substantial_rehab,
  IFNULL(CAST(IF(ellis_act_withdrawal, 1, 0) AS INT64), 0) AS ellis_act_withdrawal,
  IFNULL(CAST(IF(condo_conversion, 1, 0) AS INT64), 0) AS condo_conversion,
  IFNULL(CAST(IF(roommate_same_unit, 1, 0) AS INT64), 0) AS roommate_same_unit,
  IFNULL(CAST(IF(other_cause, 1, 0) AS INT64), 0) AS other_cause,
  IFNULL(CAST(IF(late_payments, 1, 0) AS INT64), 0) AS late_payments,
  IFNULL(CAST(IF(lead_remediation, 1, 0) AS INT64), 0) AS lead_remediation,
  IFNULL(CAST(IF(development, 1, 0) AS INT64), 0) AS development,
  IFNULL(CAST(IF(good_samaritan_ends, 1, 0) AS INT64), 0) AS good_samaritan_ends
FROM
  `poetic-now-399015.eviction_dataset.fact_table`;

