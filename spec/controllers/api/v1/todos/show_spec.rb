# frozen_string_literal: true

require "rails_helper"

describe API::V1::Todos::Show, type: :request do
  let(:endpoint) { "/api/v1/todos/#{id}" }
  let!(:todo) { create(:todo) }
  let(:id) { todo.id }
  subject { get endpoint }

  context "when todo exists" do
    let(:response_body) do
      {
        "id" => todo.id,
        "done" => todo.done,
        "description" => todo.description,
        "deadline" => todo.deadline,
        "created_at" => todo.created_at,
        "updated_at" => todo.updated_at
      }
    end

    it_behaves_like "200"
  end

  context "when todo doesn't exist" do
    let(:id) { not_existing_id(Todo) }

    it_behaves_like "404"
  end
end
