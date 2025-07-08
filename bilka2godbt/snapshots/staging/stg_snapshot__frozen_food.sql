{% snapshot stg_snapshot__frozen_food %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'frozen_food']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'frozen_food') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
