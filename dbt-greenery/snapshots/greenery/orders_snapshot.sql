{% snapshot orders_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='promo_id',

      strategy='timestamp',
      updated_at='estimated_delivery_at'
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'orders') }}

{% endsnapshot %}