{% snapshot stg_snapshot__leisure_and_sport %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'leisure_and_sport']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'leisure_and_sport') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
