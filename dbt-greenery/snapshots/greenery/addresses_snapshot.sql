{% snapshot addresses_snapshot %}

  {{
    config(
      target_schema='mikew_snapshots',
      unique_key='address_id',

      strategy='check',
      check_cols=['state','zipcode','country'],
    )
  }}

  SELECT * 
  FROM {{ source('tutorial', 'addresses') }}

{% endsnapshot %}