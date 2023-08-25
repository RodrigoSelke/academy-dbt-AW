with
    source_person as (
        select 
            cast(businessentityid as int)  					
            , persontype											
            , firstname						
            , middlename						
            , lastname											
            , emailpromotion																
            , rowguid						
            , modifieddate			
        from {{ source('sap', 'person') }}
    )

select *
from source_person