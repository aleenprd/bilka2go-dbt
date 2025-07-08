{% snapshot stg_snapshot__personal_care %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'personal_care']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'personal_care') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
