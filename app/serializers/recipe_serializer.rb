class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :level
  
  def level
    object.level || "unknown"
  end
end
