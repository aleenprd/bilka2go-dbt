{% snapshot stg_snapshot__household %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'household']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'household') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
