with
    source_person as (
        select 
            businessentityid				
             --persontype
             --namestyle
             --title
            , firstname
            -- middlename
            , lastname
            , cast( firstname || ' ' || lastname as string) as full_name
             --suffix
            , emailpromotion
             --additionalcontactinfo
             -- demographics
            , rowguid
            , modifieddate		
        from {{ source('sap_adventure_works', 'person') }}
    )

select *
from source_person