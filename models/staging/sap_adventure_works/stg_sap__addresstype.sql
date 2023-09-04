with
    source_addresstype as (
        select 
            addresstypeid
            , name as local_name
    from {{ source('sap_adventure_works', 'addresstype') }}
    )

select *
from source_addresstype 