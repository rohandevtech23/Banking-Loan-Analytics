-- Banking Loan Analytics: executive KPIs

SELECT
    COUNT(*) AS total_approved_loans,
    SUM(funded_amnt) AS total_funded_amount,
    SUM(total_pymnt) AS total_payment_received,
    SUM(total_rec_int) AS total_interest_received,
    SUM(recoveries) AS total_recoveries,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(dti), 2) AS avg_dti,
    ROUND(AVG(fico_score), 0) AS avg_fico_score
FROM accepted_loans;

SELECT
    COUNT(*) AS total_loans,
    SUM(CASE WHEN good_bad_loan = 'Good Loan' THEN 1 ELSE 0 END) AS good_loans,
    SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) AS bad_loans,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Good Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS good_loan_pct,
    ROUND(100.0 * SUM(CASE WHEN good_bad_loan = 'Bad Loan' THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_loan_pct
FROM accepted_loans;

SELECT
    approved.total_approved_applications,
    rejected.total_rejected_applications,
    approved.total_approved_applications + rejected.total_rejected_applications AS total_applications,
    ROUND(
        100.0 * approved.total_approved_applications /
        NULLIF(approved.total_approved_applications + rejected.total_rejected_applications, 0),
        2
    ) AS approval_rate
FROM
    (SELECT COUNT(*) AS total_approved_applications FROM accepted_loans) approved
CROSS JOIN
    (SELECT COUNT(*) AS total_rejected_applications FROM rejected_applications) rejected;

