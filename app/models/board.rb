class Board < ApplicationRecord 
    has_many :bulletins, dependent: :destroy
end
