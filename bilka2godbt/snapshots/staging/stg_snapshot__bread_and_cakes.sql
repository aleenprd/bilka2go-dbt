{% snapshot stg_snapshot__bread_and_cakes %}

{{
config(
        unique_key='product_id',
        strategy='check',
        check_cols='all',
        tags=['staging', 'snapshot', 'bilka2go', 'bread_and_cakes']
    )
}}
  
select * except (job_run_datetime) 
from {{ source('bilka2go', 'bread_and_cakes') }}
where image_url != '/images/svg/loading.svg'

{% endsnapshot %}
