{% snapshot stg_snapshot__fruits_and_vegetables %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  
select * exclude (job_run_datetime) 
from {{ source('bilka2go', 'fruits_and_vegetables') }}

{% endsnapshot %}
