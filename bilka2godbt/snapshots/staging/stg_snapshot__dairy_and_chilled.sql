{% snapshot stg_snapshot__dairy_and_chilled %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'dairy_and_chilled']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'dairy_and_chilled') }}

{% endsnapshot %}
