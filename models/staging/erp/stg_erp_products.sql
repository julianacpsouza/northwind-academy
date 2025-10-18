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
        , cast(QUANTITYPERUNIT as numeric(18,2)) as quantity_per_unit
        , cast(UNITPRICE as varchar) as unit_price
        , cast(UNITSINSTOCK as int) as units_in_stock
        , cast(UNITSONORDER as int) as units_on_order
        , cast(REORDERLEVEL as int) as reorder_level
        , DISCONTINUED as is_discontinued
    from source
)

select * from
rename
