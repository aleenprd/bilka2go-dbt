{% snapshot stg_snapshot__clothing_and_shoes %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  
select * exclude (job_run_datetime) 
from {{ source('bilka2go', 'clothing_and_shoes') }}

{% endsnapshot %}
