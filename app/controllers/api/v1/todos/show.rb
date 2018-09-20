# frozen_string_literal: true

module API
  module V1
    module Todos
      class Show < Base
        desc "Returns serialized todo object as json."

        params { use :show }

        get do
          if @todo
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
