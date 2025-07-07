{% snapshot stg_snapshot__garden %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'garden']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'garden') }}

{% endsnapshot %}
