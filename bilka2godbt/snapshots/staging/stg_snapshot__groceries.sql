{% snapshot stg_snapshot__groceries %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'groceries']
    )
}}
  

select distinct * except (job_run_datetime) 
from {{ source('bilka2go', 'groceries') }}
where image_url != '/images/svg/loading.svg'


{% endsnapshot %}
