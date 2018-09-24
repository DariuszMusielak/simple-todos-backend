# frozen_string_literal: true

require "rails_helper"

describe API::V1::Todos::Index, type: :request do
  let(:endpoint) { "/api/v1/todos" }
  subject { get endpoint }

  context "when todos exist" do
    let!(:todos) { create_list(:todo, 2) }
    let(:response_body) do
      [
        {
          "id" => todos.first.id,
          "done" => todos.first.done,
          "description" => todos.first.description,
          "deadline" => todos.first.deadline,
          "created_at" => todos.first.created_at,
          "updated_at" => todos.first.updated_at
        },
        {
          "id" => todos.second.id,
          "done" => todos.second.done,
          "description" => todos.second.description,
          "deadline" => todos.second.deadline,
          "created_at" => todos.second.created_at,
          "updated_at" => todos.second.updated_at
        },
      ]
    end

    it_behaves_like "200"
  end

  context "when todos don't exist" do
    let(:response_body) { [] }

    it_behaves_like "200"
  end
end
