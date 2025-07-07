{% snapshot stg_snapshot__beverages %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'beverages']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'beverages') }}

{% endsnapshot %}
