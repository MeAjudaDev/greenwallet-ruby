class UsersShared < ApplicationRecord
    belongs_to :owner, class_name: "User"
    belongs_to :shared, class_name: "User", :foreign_key => 'shared_id'
end

