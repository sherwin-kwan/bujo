class Collection < ApplicationRecord
  enum collection_type: %i(daily monthly future index), _prefix: :type

  before_save :check_duplicate
  has_many :bullets

  def check_duplicate
    if Collection.where(collection_type: self.collection_type).where(start_date: self.start_date).count > 0
      raise "Warning: Creating a duplicate"
    end
  end

  def hashify
    root_bullets = self.bullets.filter{_1.root_id == _1.id}
    {
      count: root_bullets.count,
      type: self.collection_type,
      bullets: root_bullets.map(&:hashify)
    }
  end
end
