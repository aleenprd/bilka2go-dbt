 {% snapshot stg_snapshot__pet_food %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'pet_food']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'pet_food') }}

{% endsnapshot %}
