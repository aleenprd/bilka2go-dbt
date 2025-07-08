{% snapshot stg_snapshot__fruits_and_vegetables %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'fruits_and_vegetables']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'fruits_and_vegetables') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
