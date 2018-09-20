# frozen_string_literal: true

require "grape-swagger"

module API
  class Core < Grape::API
    prefix :api

     mount API::V1::Base

     add_swagger_documentation \
      mount_path: "/docs",
      produces: "application/vnd.api+json",
      info: {
        title: "Simple todos API.",
        description: "Simple todos API",
        contact_name: "Webguru Dariusz Musielak",
        contact_email: "webgurudm@gmail.com",
      }

  end
end
