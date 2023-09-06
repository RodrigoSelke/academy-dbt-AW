with
    source_product as (
        select
        productid
        , name
        , productnumber
        , standardcost
        , listprice
        , productsubcategoryid
        , productmodelid
        , sellstartdate
        from {{ source('sap_adventure_works', 'product') }}

    )

select *
from source_product