with
    sap_person as (
        select * 
        from {{ ref('stg_sap__person') }}
    )

    ,sap_personcreditcard as (
        select *
        from {{ ref('stg_sap__personcreditcard') }}
    )

    ,sap_creditcard as (
        select *
        from {{ ref('stg_sap__creditcard') }}
    )

    ,join_person_creditcard as (
        select 
            sap_personcreditcard.businessentityid	
            , sap_personcreditcard.creditcardid
            , sap_person.full_name
            , sap_person.emailpromotion
            , sap_creditcard.cardtype
            , sap_person.rowguid
            , sap_person.modifieddate  
        from sap_personcreditcard
        left join sap_person on sap_person.businessentityid = sap_personcreditcard.businessentityid
        left join sap_creditcard on sap_personcreditcard.creditcardid = sap_creditcard.creditcardid
        
        
    )

select *
from join_person_creditcard

