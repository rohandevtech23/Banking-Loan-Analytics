-- Banking Loan Analytics: branch performance

WITH branch_metrics AS (
    SELECT
        branch_id,
        branch_name,
        region,
        COUNT(*) AS total_loans,
        SUM(funded_amnt) AS funded_amount,
        SUM(total_pymnt) AS total_payment_received,
        SUM(total_rec_int) AS interest_received,
        SUM(recoveries) AS recoveries,
        SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
        SUM(CASE WHEN risk_segment = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_loans
    FROM accepted_loans
    GROUP BY branch_id, branch_name, region
)
SELECT
    branch_id,
    branch_name,
    region,
    total_loans,
    funded_amount,
    total_payment_received,
    interest_received,
    recoveries,
    ROUND(100.0 * bad_loans / NULLIF(total_loans, 0), 2) AS default_rate,
    ROUND(100.0 * high_risk_loans / NULLIF(total_loans, 0), 2) AS high_risk_exposure_pct,
    RANK() OVER (ORDER BY 100.0 * bad_loans / NULLIF(total_loans, 0) DESC) AS default_risk_rank,
    RANK() OVER (ORDER BY funded_amount DESC) AS funded_amount_rank
FROM branch_metrics
ORDER BY default_risk_rank;

