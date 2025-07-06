{% snapshot stg_snapshot__baby_and_children %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  

select * except (job_run_datetime) 
from {{ source('bilka2go', 'baby_and_children') }}

{% endsnapshot %}