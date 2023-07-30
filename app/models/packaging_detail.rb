class PackagingDetail < ApplicationRecord

    validates :package_type, :weight, :height, :length, :cbm, presence: true

end
