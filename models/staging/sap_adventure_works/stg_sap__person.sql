with
    source_person as (
        select 
            cast(businessentityid as int)  					
            , --persontype
            , --namestyle
            , --title
            , firstname
            , middlename
            , lastname
            , --suffix
            , emailpromotion
            , --additionalcontactinfo
            ,-- demographics
            , rowguid
            , modifieddate		
        from {{ source('stg_sap__person', 'person') }}
    )

select *
from source_person