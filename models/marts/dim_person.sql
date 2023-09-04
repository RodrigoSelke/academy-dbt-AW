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
        from {{ ref('stg_sap__businessentityaddress') }}
    )

    ,sap_address as (
        select *
        from {{ ref('stg_sap__address') }}
    )    
    
    ,sap_addresstype as (
        select *
        from {{ ref('stg_sap__addresstype') }}
    )

    ,sap_stateprovince as (
        select *
        from {{ ref('stg_sap__stateprovince') }}
    )

    ,sap_countryregion as (
        select *
        from {{ ref('stg_sap__countryregion') }}
    )

    ,join_person as (
        select 
            sap_personcreditcard.businessentityid	
            , sap_personcreditcard.creditcardid
            , sap_businessentityaddress.addressid
            , sap_businessentityaddress.addresstypeid
            , sap_address.stateprovinceid
            , sap_stateprovince.territoryid
            , sap_person.full_name
            , sap_person.emailpromotion
            , sap_creditcard.cardtype
            , sap_addresstype.local_name
            , sap_countryregion.country_name
            , sap_stateprovince.countryregioncode
            , sap_stateprovince.name
            , sap_address.city 
            , sap_address.addressline1         
            , sap_address.postalcode 
        from sap_personcreditcard
        left join sap_person on sap_person.businessentityid = sap_personcreditcard.businessentityid
        left join sap_creditcard on sap_personcreditcard.creditcardid = sap_creditcard.creditcardid
        right join sap_businessentityaddress on sap_businessentityaddress.businessentityid = sap_personcreditcard.businessentityid    
        left join sap_address on sap_address.addressid = sap_businessentityaddress.addressid
        left join sap_addresstype on  sap_addresstype.addresstypeid =  sap_businessentityaddress.addresstypeid
        left join sap_stateprovince on sap_stateprovince.stateprovinceid = sap_address.stateprovinceid
        left join sap_countryregion on sap_countryregion.countryregioncode = sap_stateprovince.countryregioncode
    )

select *
from join_person  


          
            