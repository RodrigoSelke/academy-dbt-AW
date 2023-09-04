with
    souce_stateprovince as(
        select 
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            -- isonlystateprovinceflag
            , name
            , territoryid
        from {{ source('sap_adventure_works', 'stateprovince') }}

    )

select *
from souce_stateprovince