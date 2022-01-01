class Bullet < ApplicationRecord
  has_ancestry
  enum bullet_type: %i(task event note)
  enum state: %i(incomplete complete migrated scheduled irrelevant)
  belongs_to :collection

  def hashify
    hash = {
      "id": self.id,
      "parent": self.parent_id,
      "root": self.root_id,
      "collection": self.collection_id,
      "body": self.body,
      "state": self.state,
      "type": self.bullet_type,
      "date": self.created_at.to_s,
      "priority": self.priority,
      "inspiration": self.inspiration,
      "children": self.children.map(&:hashify)
    }
    if self.state == "migrated"
      hash.merge!({"migratedTo": self.migrated})
    elsif self.state == "scheduled"
      hash.merge!({"scheduledAs": self.migrated})
    end
    hash
  end
end
