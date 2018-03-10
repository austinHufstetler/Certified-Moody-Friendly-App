json.extract! coupon, :id, :title, :description, :image_url, :start_date, :end_date, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
