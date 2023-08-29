with
    source_personcreditcard as (
        select
            businessentityid
            , creditcardid
            --modifieddate
        from {{ source('sap_adventure_works', 'personcreditcard') }}
    )

select *
from source_personcreditcard
