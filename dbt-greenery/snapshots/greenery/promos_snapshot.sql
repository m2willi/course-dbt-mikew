{% snapshot promos_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='promo_id',

      strategy='check',
      check_cols=['discount','status'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'promos') }}

{% endsnapshot %}