# frozen_string_literal: true

class TodosSerializer < ActiveModel::Serializer::CollectionSerializer
  def serializer
    TodoSerializer
  end
end
