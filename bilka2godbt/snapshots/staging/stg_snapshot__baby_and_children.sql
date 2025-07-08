{% snapshot stg_snapshot__baby_and_children %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'baby_and_children'],
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'baby_and_children') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}