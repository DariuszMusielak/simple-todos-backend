# frozen_string_literal: true

module API
  module V1
    module Todos
      class Update < Base
        desc "Update todo's object."

        params { use :update }

        patch do
          if @todo&.update(params.except(:todo_id))
            status :ok
            @todo
          else
            status :not_found
            "Record not found"
          end
        end
      end
    end
  end
end
