{% snapshot stg_snapshot__home_and_kitchen %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  
select * exclude (job_run_datetime) 
from {{ source('bilka2go', 'home_and_kitchen') }}

{% endsnapshot %}
