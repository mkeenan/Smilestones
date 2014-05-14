class Milestone
  include Mongoid::Document
  field :date, type: Date
  field :notes, type: String
  field :name, type: String
  field :custom, type: String
  embedded_in :child

  def computed_name
    if self.name == "Other"
      self.custom_name
    else
      self.name
    end
  end
end
