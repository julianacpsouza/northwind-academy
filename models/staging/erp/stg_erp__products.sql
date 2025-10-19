with 
    source as(
        select *
        from {{ source('erp', 'products') }}
    )

, rename as (
    select
        cast(ID as int) as product_id
        , cast(PRODUCTNAME as varchar) as product_name
        , cast(SUPPLIERID as int) as supplier_fk
        , cast(CATEGORYID as int) as category_fk
        , cast(QUANTITYPERUNIT as string) as quantity_per_unit
        , cast(UNITPRICE as numeric(18,2)) as unit_price
        , cast(UNITSINSTOCK as int) as units_in_stock
        , cast(UNITSONORDER as int) as units_on_order
        , cast(REORDERLEVEL as int) as reorder_level
        , DISCONTINUED as is_discontinued
    from source
)

, final as (
    select
        product_id
        , product_name
        , supplier_fk
        , category_fk
        , quantity_per_unit
        , unit_price
        , units_in_stock
        , units_on_order
        , reorder_level
        , is_discontinued
    from rename
)

select * from
final
