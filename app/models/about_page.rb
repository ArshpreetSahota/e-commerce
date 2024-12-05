class AboutPage < ApplicationRecord
  # Define explicitly allowed searchable attributes
  def self.ransackable_attributes(auth_object = nil)
    %w[title description created_at updated_at]
  end

  # Optionally define searchable associations (if applicable)
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
