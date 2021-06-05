
class User < ApplicationRecord
    has_many :shareds, class_name: "UsersShared", foreign_key: "owner_id"
end




