with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

, selfjoin as (
    select
        employees.employee_pk      
        , employees.full_name
        , manager.full_name as manager_name
        , employees.empoloyee_title
        , employees.empoloyee_birth_date
        , employees.empoloyee_hire_date
        , employees.empoloyee_city
        , employees.empoloyee_region
        , employees.empoloyee_country
    from employees
    left join employees as manager on employees.manager_fk = manager.employee_pk
)

select *
from selfjoin
