# frozen_string_literal: true

require "rails_helper"

describe API::V1::Todos::Delete, type: :request do
  let(:endpoint) { "/api/v1/todos/#{todo_id}" }
  let!(:todo) { create(:todo) }
  let(:todo_id) { todo.id }
  subject { delete endpoint }

  context "when todo exists" do
    it_behaves_like "204"

    it "deletes Todo" do
      expect{ subject }.to change{ Todo.count }.by(-1)
    end
  end

  context "when todo doesn't exist" do
    let(:todo_id) { not_existing_id(Todo) }

    it_behaves_like "404"
  end
end
