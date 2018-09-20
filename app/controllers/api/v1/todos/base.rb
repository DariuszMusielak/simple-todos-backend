# frozen_string_literal: true

module API
  module V1
    module Todos
      class Base < Core
        helpers Params

        namespace :todos do
          mount API::V1::Todos::Create
          mount API::V1::Todos::Index

          route_param :todo_id, type: Integer do
            before do
              @todo = Todo.find_by(id: params[:todo_id])
            end

            mount API::V1::Todos::Show
            mount API::V1::Todos::Update
            mount API::V1::Todos::Delete
          end
        end
      end
    end
  end
end
