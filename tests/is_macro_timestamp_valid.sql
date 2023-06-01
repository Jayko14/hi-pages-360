{% test is_macro_timestamp_valid(model, column_name) %}

with timestamp_validation as (

    select
        transaction_date AT TIME ZONE 'UTC' as transaction_date_utc
        , {{ column_name }} as transaction_date

    from {{ model }}

),

validation_errors as (

    select
        *

    from timestamp_validation
    where transaction_date_utc != transaction_date

)

select *
from validation_errors

{% endtest %}