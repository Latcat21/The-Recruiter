class PlayerPosition < ActiveRecord::Base
  belongs_to :position
  belongs_to :player
end