{% snapshot stg_snapshot__car_accessories %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'car_accessories']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'car_accessories') }}

{% endsnapshot %}
