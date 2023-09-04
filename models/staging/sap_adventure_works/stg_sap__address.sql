with
    source_address as (
        select 
            addressid
            , addressline1
            --addressline2
            , city
            , stateprovinceid
            , postalcode
    from {{ source('sap_adventure_works', 'address') }}
    )

select *
from source_address  