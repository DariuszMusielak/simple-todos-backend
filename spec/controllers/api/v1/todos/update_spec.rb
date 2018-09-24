# frozen_string_literal: true

require "rails_helper"

# QUESTION: How in a easy way we can test datetime - created_at here in response_body. I know I can use Timecop and I did use it but I'm not sure if that is the best approach.

describe API::V1::Todos::Update, type: :request do
  subject { patch endpoint, params: params }

  let(:endpoint) { "/api/v1/todos/#{todo_id}" }
  let(:mocked_date) { Time.local(2018, 9, 24, 8, 0, 0) }

  let(:todo) { create(:todo, done: false, description: "old", deadline: Time.zone.now + 2.days) }
  let(:todo_id) { todo.id }

  before {  Timecop.freeze(mocked_date) }
  after {  Timecop.return }

  let(:params) do
    { "done" => true, "description" => "new", "deadline" => Time.zone.now + 4.days }
  end

  context "when params are valid" do
    let(:response_body) do
      {
        "id" => todo.id,
        "done" => params["done"],
        "description" => params["description"],
        "deadline" => params["deadline"],
        "created_at" => "2018-09-24T06:00:00.000Z",
        "updated_at" => "2018-09-24T06:00:00.000Z",
      }
    end

    it_behaves_like "200"

    it "updates todo" do
      expect{ subject }.to change{ todo.reload.done }.from(false).to(true).
        and change{ todo.reload.description }.from("old").to("new").
        and change{ todo.reload.deadline }.from(Time.zone.now + 2.days).to(Time.zone.now + 4.days)
    end
  end

  context "when todo doesnt' exist" do
    let(:todo_id) { not_existing_id(Todo) }
    it_behaves_like "404"
  end
end
