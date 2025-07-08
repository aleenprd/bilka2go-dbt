{% snapshot stg_snapshot__world_food %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'world_food']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'world_food') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
