with
    sap_businessentityaddress as (
        select * 
        from {{ ref('stg_spa__businessentityaddress') }}
    )

    ,sap_addresstype as (
        select *
        from {{ ref('stg_spa__addresstype') }}
    )

    ,sap_address as (
        select *
        from {{ ref('stg_sap_address') }}
    )

    ,sap_person as (
        select * 
        from {{ ref('stg_sap__person') }}
    )

    ,join_address as (
        select 
            sap_businessentityaddress.businessentityid
            , sap_businessentityaddress.addressid
            , sap_businessentityaddress.addresstypeid 
            , sap_addresstype.name
            , sap_address.addressline1
            , sap_address.city
            , sap_address.stateprovinceid
            , sap_address.postalcode
            , sap_person.full_name
            , sap_person.emailpromotion 
        from sap_businessentityaddress
        left join sap_addresstype on sap_addresstype.addresstypeid = sap_businessentityaddress.addresstypeid
        left join sap_address on sap_address.addressid = sap_businessentityaddress.addressid
        left join sap_person on sap_person.businessentityid = sap_businessentityaddress.businessentityid       
    )

select *
from join_address   
