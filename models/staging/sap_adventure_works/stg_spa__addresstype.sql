with
    source_addresstype as (
        select
            addresstypeid
            , name
            --rowguid
            --modifieddate
        from {{ source('sap_adventure_works', 'addresstype') }}

    )

select *
from source_addresstype