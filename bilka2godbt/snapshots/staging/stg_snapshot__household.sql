{% snapshot stg_snapshot__household %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  
select * exclude (job_run_datetime) 
from {{ source('bilka2go', 'household') }}

{% endsnapshot %}
