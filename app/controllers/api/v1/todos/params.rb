# frozen_string_literal: true

module API
  module V1
    module Todos
      module Params
        extend Grape::API::Helpers

        params :_todo do
          requires :description, type: String, desc: "Todo description."
          requires :done, type: Boolean, desc: "Todo state - if it is done or no."
          requires :deadline, type: DateTime, desc: "Todo deadline date"
        end

        params :_todo_id do
          requires :todo_id, type: Integer, desc: "Todo id"
        end

        params :show do
          use :_todo_id
        end

        params :delete do
          use :_todo_id
        end

        params :create do
          use :_todo
        end

        params :update do
          requires :todo_id, type: Integer, desc: "Todo id"
          use :_todo
        end
      end
    end
  end
end
