{% snapshot stg_snapshot__electronics %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'electronics']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'electronics') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
