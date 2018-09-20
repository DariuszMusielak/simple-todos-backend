# frozen_string_literal: true

module API
  module V1
    module Todos
      class Create < Base
        desc "Create todo's object."

        params { use :create }

        post do
          todo = Todo.create(params)
          if todo.valid?
            status :ok
            todo
          else
            status :not_found
            "Something went wrong"
          end
        end
      end
    end
  end
end
