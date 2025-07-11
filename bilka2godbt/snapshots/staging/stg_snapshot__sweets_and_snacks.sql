{% snapshot stg_snapshot__sweets_and_snacks %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'sweets_and_snacks']
    )
}}
  
select distinct * except (job_run_datetime) 
from {{ source('bilka2go', 'sweets_and_snacks') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
