class Wine < ApplicationRecord
  has_many :glasses
  belongs_to :winemaker

end