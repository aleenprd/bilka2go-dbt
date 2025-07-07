{% snapshot stg_snapshot__toys %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'toys']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'toys') }}

{% endsnapshot %}
