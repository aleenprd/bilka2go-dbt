{% snapshot stg_snapshot__meat_and_fish %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'meat_and_fish']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'meat_and_fish') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
