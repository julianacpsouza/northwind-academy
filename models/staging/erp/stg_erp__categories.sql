with
source as (
    select * from {{ source('erp', 'category') }}
),

renamed as (
    select
        cast(id as int) as category_pk
        , cast(categoryname as varchar) as category_name
        , cast(description as varchar) as category_description
    from source 

)

, final as (
    select
        category_pk
        , category_name
        , category_description
    from renamed
)

select * 
from final