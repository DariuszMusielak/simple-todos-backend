Rails.application.routes.draw do

  mount API::Core, at: "/"

  mount GrapeSwaggerRails::Engine => "/swagger"
end
