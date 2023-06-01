{% test is_macro_age_valid(model, column_name) %}

with age_validation as (

    select
        date_diff('year', current_date, birth_date) as valid_age
        , {{ column_name }} as age

    from {{ model }}

),

validation_errors as (

    select
        *

    from age_validation
    where valid_age != age

)

select *
from validation_errors

{% endtest %}