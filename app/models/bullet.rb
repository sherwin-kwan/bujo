class Bullet < ApplicationRecord
  enum type: %i(task event note)
  enum state: %i(incomplete complete migrated scheduled irrelevant)
end
