# frozen_string_literal: true

module API
  module V1
    class Base < Core
      version "v1", using: :path, vendor: "simple-todos"
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers



      error_formatter :json, Grape::Formatter::ActiveModelSerializers
    end
  end
end
