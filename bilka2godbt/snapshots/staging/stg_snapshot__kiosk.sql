{% snapshot stg_snapshot__kiosk %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'kiosk']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'kiosk') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
