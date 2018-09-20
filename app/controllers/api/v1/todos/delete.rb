# frozen_string_literal: true

module API
  module V1
    module Todos
      class Delete < Base
        desc "Delete todo's object."

        params { use :delete }

        delete do
          if @todo&.destroy
            status :no_content
            body false
          else
            status :not_found
            "Something went wrong"
          end
        end
      end
    end
  end
end
