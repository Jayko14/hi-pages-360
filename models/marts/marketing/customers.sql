SELECT
    id,
    gender,
    {{ age_in_years('birth_date') }} AS age,
    , category 
    sum(amount) as total_expense,
    min(transaction_date) AS first_transaction_date,
    max(transaction_date) AS last_transaction_date
FROM {{ ref('contacts_joined_with_transactions') }}
GROUP BY
    1,2,3,4