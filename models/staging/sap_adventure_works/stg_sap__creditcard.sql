with
    source_creditcard as (
        select 
            creditcardid
            , cardtype
            --cardnumber
            --expmonth
            --expyear
            -- modifieddate
    from {{ source('sap_adventure_works', 'creditcard') }}
    )

select *
from source_creditcard  