-- Banking Loan Analytics: final SQL views
-- Use these views for Power BI dashboard pages and portfolio presentation.

CREATE OR REPLACE VIEW vw_executive_summary AS
SELECT
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(total_pymnt) AS total_payment_received,
    SUM(total_rec_int) AS total_interest_received,
    SUM(recoveries) AS total_recoveries,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(dti), 2) AS avg_dti,
    ROUND(AVG(fico_score), 0) AS avg_fico_score,
    SUM(CASE WHEN good_bad_loan = 'Good Loan' THEN 1 ELSE 0 END) AS good_loans,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Good Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS good_loan_percentage,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_percentage
FROM accepted_loans;

CREATE OR REPLACE VIEW vw_risk_analysis AS
SELECT
    risk_segment,
    credit_score_band,
    dti_band,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate,
    ROUND(AVG(fico_score), 0) AS avg_fico_score,
    ROUND(AVG(dti), 2) AS avg_dti,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate
FROM accepted_loans
GROUP BY risk_segment, credit_score_band, dti_band;

CREATE OR REPLACE VIEW vw_branch_performance AS
SELECT
    branch_id,
    branch_name,
    region,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate,
    SUM(CASE WHEN risk_segment = 'High Risk' THEN 1 ELSE 0 END) AS high_risk_loans,
    ROUND(100.0 * SUM(CASE WHEN risk_segment = 'High Risk' THEN 1 ELSE 0 END) / COUNT(*), 2) AS high_risk_exposure_percentage,
    ROUND(AVG(funded_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(fico_score), 0) AS avg_fico_score,
    RANK() OVER (
        ORDER BY 100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*) DESC
    ) AS default_risk_rank
FROM accepted_loans
GROUP BY branch_id, branch_name, region;

CREATE OR REPLACE VIEW vw_approval_analysis AS
WITH applications_by_state AS (
    SELECT
        addr_state AS state,
        COUNT(*) AS approved_applications,
        0 AS rejected_applications
    FROM accepted_loans
    GROUP BY addr_state

    UNION ALL

    SELECT
        state,
        0 AS approved_applications,
        COUNT(*) AS rejected_applications
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
    ) AS approval_rate,
    ROUND(
        100.0 * SUM(rejected_applications) /
        NULLIF(SUM(approved_applications) + SUM(rejected_applications), 0),
        2
    ) AS rejection_rate
FROM applications_by_state
GROUP BY state;

CREATE OR REPLACE VIEW vw_profitability_analysis AS
SELECT
    good_bad_loan,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(total_pymnt) AS total_payment_received,
    SUM(total_rec_prncp) AS principal_received,
    SUM(total_rec_int) AS interest_received,
    SUM(recoveries) AS recoveries,
    SUM(total_pymnt + recoveries - funded_amnt) AS estimated_net_gain_loss,
    ROUND(
        100.0 * SUM(total_pymnt + recoveries - funded_amnt) / NULLIF(SUM(funded_amnt), 0),
        2
    ) AS estimated_return_percentage
FROM accepted_loans
GROUP BY good_bad_loan;

CREATE OR REPLACE VIEW vw_monthly_loan_trend AS
SELECT
    TO_DATE(issue_d, 'Mon-YYYY') AS issue_month,
    COUNT(*) AS total_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate
FROM accepted_loans
WHERE issue_d IS NOT NULL
GROUP BY TO_DATE(issue_d, 'Mon-YYYY');
