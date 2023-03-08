class Move < ApplicationRecord
    belongs_to :user
    serialize :gdata, Array
end
