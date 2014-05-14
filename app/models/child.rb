class Child
  include Mongoid::Document
  field :name, type: String
  field :birth_date, type: Date
  embeds_many :milestones
  belongs_to :user
end
