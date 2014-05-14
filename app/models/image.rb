class Image
  include Mongoid::Document
  has_many :milestones
end
