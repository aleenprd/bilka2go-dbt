{% snapshot stg_snapshot__bread_and_cakes %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all'
    )
}}
  
select * exclude (job_run_datetime) 
from {{ source('bilka2go', 'bread_and_cakes') }}

{% endsnapshot %}
