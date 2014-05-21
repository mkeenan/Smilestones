class Milestone
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :picture,
     :s3_credentials => {
      :bucket => ENV['marywdi'],
      :access_key_id => ENV['AKIAJRVTCTZTLEHPPNDA'],
      :secret_access_key => ENV['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']
    }
  #    :styles => {
  #     :thumb => "100x100#",   # Centrally cropped
  #     :small  => "150x150>"}  # Only squish if it's larger than this

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

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
