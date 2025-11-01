with
    source as (
        select *
        from {{ source('erp', 'employees') }}

    )

, renamed as (
    select
        cast(ID as int) as employee_pk       
        , cast(LASTNAME as varchar) as last_name
        , cast(FIRSTNAME as varchar) as first_name
        , first_name || ' ' || last_name as full_name
        , cast(TITLE as varchar) as empoloyee_title
        --, cast(TITLEOFCOURTESY as varchar)
        , cast(BIRTHDATE as date) as empoloyee_birth_date
        , cast(HIREDATE as date) as empoloyee_hire_date
        --, cast(ADDRESS as varchar) as 
        , cast(CITY as varchar) as empoloyee_city
        , cast(REGION as varchar) as empoloyee_region
        --, cast(POSTALCODE as varchar) as 
        , cast(COUNTRY as varchar) as empoloyee_country
        --, cast(HOMEPHONE as varchar) as 
        --, cast(EXTENSION as varchar) as 
        --, cast(PHOTO as varchar) as 
        --, cast(NOTES as varchar) as 
        , cast(REPORTSTO as int) as manager_fk
        --, cast(PHOTOPATH as varchar) as 

    from source
)

, final as (
    select
        employee_pk      
        , manager_fk
        , full_name
        , empoloyee_title
        , empoloyee_birth_date
        , empoloyee_hire_date
        , empoloyee_city
        , empoloyee_region
        , empoloyee_country
    from renamed
)
select *
from final