class Collection < ApplicationRecord
  enum type: %i(daily monthly future index)
end
