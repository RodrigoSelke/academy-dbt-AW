with
    source_countryregion as (
        select 
            countryregioncode
            , name as country_name
    from {{ source('sap_adventure_works', 'countryregion') }}
    )

select *
from source_countryregion  