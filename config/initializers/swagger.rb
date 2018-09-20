GrapeSwaggerRails.options.url = "/api/docs"
GrapeSwaggerRails.options.api_key_name = "Authorization"
GrapeSwaggerRails.options.api_key_type = "header"
GrapeSwaggerRails.options.app_name = "Simple todos"
GrapeSwaggerRails.options.before_action_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
}
GrapeSwaggerRails.options.doc_expansion = "none"
GrapeSwaggerRails.options.hide_api_key_input = false
GrapeSwaggerRails.options.hide_url_input = true

