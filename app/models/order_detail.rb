class OrderDetail < ApplicationRecord
  
  enum production_statuses: { production_not:0, production_wait:1, in_production:2, production_completion:3 }
end