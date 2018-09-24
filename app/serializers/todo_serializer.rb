# frozen_string_literal: true

class TodoSerializer < ActiveModel::Serializer
  attributes :id,
             :done,
             :description,
             :deadline,
             :created_at,
             :updated_at
end
