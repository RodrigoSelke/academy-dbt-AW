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

    ,sap_businessentityaddress as (
        select *
        from {{ ref('stg_spa__businessentityaddress') }}
    )
    
    ,join_person_creditcard as (
        select 
            sap_personcreditcard.businessentityid	
            , sap_personcreditcard.creditcardid
            , sap_businessentityaddress.addressid
            , sap_businessentityaddress.addresstypeid
            , sap_person.full_name
            , sap_person.emailpromotion
            , sap_creditcard.cardtype
            , sap_person.rowguid
            , sap_person.modifieddate  
        from sap_personcreditcard
        left join sap_person on sap_person.businessentityid = sap_personcreditcard.businessentityid
        left join sap_creditcard on sap_personcreditcard.creditcardid = sap_creditcard.creditcardid
        right join sap_businessentityaddress on sap_businessentityaddress.businessentityid = sap_personcreditcard.businessentityid        
    )

select *
from join_person_creditcard

