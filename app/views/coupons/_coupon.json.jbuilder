json.extract! coupon, :id, :title, :description, :image_url, :start_time, :end_time, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
