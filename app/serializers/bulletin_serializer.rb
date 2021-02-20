class BulletinSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :board_id
end
