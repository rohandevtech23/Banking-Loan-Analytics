-- Banking Loan Analytics: table setup
-- Recommended database: PostgreSQL

DROP TABLE IF EXISTS accepted_loans;
DROP TABLE IF EXISTS rejected_applications;

CREATE TABLE accepted_loans (
    id BIGINT,
    loan_amnt NUMERIC(12,2),
    funded_amnt NUMERIC(12,2),
    term VARCHAR(20),
    int_rate NUMERIC(6,2),
    installment NUMERIC(12,2),
    grade VARCHAR(5),
    sub_grade VARCHAR(5),
    emp_length VARCHAR(30),
    home_ownership VARCHAR(30),
    annual_inc NUMERIC(14,2),
    verification_status VARCHAR(50),
    issue_d VARCHAR(20),
    loan_status VARCHAR(50),
    purpose VARCHAR(80),
    addr_state VARCHAR(5),
    dti NUMERIC(8,2),
    fico_range_low NUMERIC(8,2),
    fico_range_high NUMERIC(8,2),
    open_acc NUMERIC(8,2),
    revol_bal NUMERIC(14,2),
    revol_util NUMERIC(8,2),
    total_acc NUMERIC(8,2),
    total_pymnt NUMERIC(14,2),
    total_rec_prncp NUMERIC(14,2),
    total_rec_int NUMERIC(14,2),
    recoveries NUMERIC(14,2),
    last_pymnt_d VARCHAR(20),
    application_type VARCHAR(30),
    fico_score NUMERIC(8,2),
    income_group VARCHAR(50),
    dti_band VARCHAR(30),
    credit_score_band VARCHAR(30),
    good_bad_loan VARCHAR(30),
    risk_segment VARCHAR(30),
    branch_id VARCHAR(10),
    branch_name VARCHAR(80),
    region VARCHAR(30)
);

CREATE TABLE rejected_applications (
    amount_requested NUMERIC(12,2),
    application_date DATE,
    loan_title VARCHAR(150),
    risk_score NUMERIC(8,2),
    debt_to_income_ratio VARCHAR(20),
    state VARCHAR(5),
    employment_length VARCHAR(30),
    policy_code NUMERIC(8,2),
    application_status VARCHAR(20)
);

-- PostgreSQL import examples:
-- COPY accepted_loans
-- FROM 'R:/Projects/Banking-Loan-Analytics/dataset/sample/accepted_loans_sample_200k.csv'
-- WITH (FORMAT CSV, HEADER TRUE);
--
-- COPY rejected_applications
-- FROM 'R:/Projects/Banking-Loan-Analytics/dataset/sample/rejected_loans_sample_100k.csv'
-- WITH (FORMAT CSV, HEADER TRUE);

