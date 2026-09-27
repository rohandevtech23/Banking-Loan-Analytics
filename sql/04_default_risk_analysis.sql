-- Banking Loan Analytics: default and risk analysis

SELECT
    risk_segment,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate,
    SUM(funded_amnt) AS funded_amount,
    SUM(recoveries) AS recoveries
FROM accepted_loans
GROUP BY risk_segment
ORDER BY default_rate DESC;

SELECT
    purpose,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(dti), 2) AS avg_dti,
    SUM(funded_amnt) AS funded_amount
FROM accepted_loans
GROUP BY purpose
HAVING COUNT(*) >= 100
ORDER BY default_rate DESC;

SELECT
    credit_score_band,
    dti_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate,
    ROUND(AVG(funded_amnt), 2) AS avg_funded_amount
FROM accepted_loans
GROUP BY credit_score_band, dti_band
ORDER BY default_rate DESC;

