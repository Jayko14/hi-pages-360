{% test is_contact_valid(model, column_name) %}

with transactions as (

    select distinct 
        {{ column_name }}
    from {{ model }}
    

),

validation_errors as (

    select
        even_field

    from transactions
      
      left join {{ source('salesforce','contacts') }}  as contacts
      on contacts.id = transactions.contact_id
    where
      contacts.id is null
)

select *
from validation_errors

{% endtest %}  