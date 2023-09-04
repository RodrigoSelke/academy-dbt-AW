with
    souce_businessentitycontact as(
        select 
            businessentityid     
            , personid
            , contacttypeid
            -- rowguid
            -- modifieddate
        from {{ source('sap_adventure_works', 'businessentitycontact') }}

    )

select *
from souce_businessentitycontact