with
    souce_businessentityaddress as(
        select 
            businessentityid
            , addressid
            , addresstypeid
            -- rowguid
            -- modifieddate
        from {{ source('sap_adventure_works', 'businessentityaddress') }}

    )

select *
from souce_businessentityaddress