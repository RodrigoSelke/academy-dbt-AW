with
    souce_address as (
        select 
            addressid
            ,addressline1
            --addressline2
            ,city
            ,stateprovinceid
            ,postalcode
            --spatiallocation
            --rowguid
            --modifieddate
        from {{ source('sap_adventure_works', 'address') }}
    )

select *
from souce_address