class Monument < ApplicationRecord
    validates_presence_of :monument_type, :single_or_double, :length, :width, :height, :color
end
