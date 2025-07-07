{% snapshot stg_snapshot__hardware_store %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'hardware_store']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'hardware_store') }}

{% endsnapshot %}
