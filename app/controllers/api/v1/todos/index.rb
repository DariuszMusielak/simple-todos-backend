# frozen_string_literal: true

module API
  module V1
    module Todos
      class Index < Base
        desc "Returns all todos objects as json."

        get do
          status :ok
          Todo.all
        end
      end
    end
  end
end
