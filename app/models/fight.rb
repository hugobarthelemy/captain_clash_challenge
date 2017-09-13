class Fight < ApplicationRecord
  belongs_to :perso
  has_many :weapons
end
