{% snapshot stg_snapshot__clothing_and_shoes %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'clothing_and_shoes']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'clothing_and_shoes') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
