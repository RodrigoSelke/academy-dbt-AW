with
    sap_person as (
        select * 
        from {{ ref('stg_sap__person') }}
    )