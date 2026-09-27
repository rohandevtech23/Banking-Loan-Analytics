-- Banking Loan Analytics: approval analysis

WITH applications_by_state AS (
    SELECT addr_state AS state, COUNT(*) AS approved_applications, 0 AS rejected_applications
    FROM accepted_loans
    GROUP BY addr_state

    UNION ALL

    SELECT state, 0 AS approved_applications, COUNT(*) AS rejected_applications
    FROM rejected_applications
    GROUP BY state
)
SELECT
    state,
    SUM(approved_applications) AS approved_applications,
    SUM(rejected_applications) AS rejected_applications,
    SUM(approved_applications) + SUM(rejected_applications) AS total_applications,
    ROUND(
        100.0 * SUM(approved_applications) /
        NULLIF(SUM(approved_applications) + SUM(rejected_applications), 0),
        2
    ) AS approval_rate
FROM applications_by_state
GROUP BY state
ORDER BY total_applications DESC;

SELECT
    grade,
    COUNT(*) AS approved_loans,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(fico_score), 0) AS avg_fico_score,
    ROUND(AVG(dti), 2) AS avg_dti,
    SUM(funded_amnt) AS funded_amount
FROM accepted_loans
GROUP BY grade
ORDER BY grade;

