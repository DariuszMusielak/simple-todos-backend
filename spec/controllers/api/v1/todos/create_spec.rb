# frozen_string_literal: true

require "rails_helper"

# QUESTION: How in a easy way we can test datetime - created_at here in response_body. I know I can use Timecop and I did use it but I'm not sure if that is the best approach.

describe API::V1::Todos::Create, type: :request do
  let(:endpoint) { "/api/v1/todos" }
  subject { post endpoint, params: params }
  let(:mocked_date) { Time.local(2018, 9, 24, 8, 0, 0) }

  before {  Timecop.freeze(mocked_date) }
  after {  Timecop.return }

  context "when params are valid" do
    let(:params) do
      {
        "done" => false,
        "description" => "New todo",
        "deadline" => Time.zone.now + 2.days,
      }
    end

    let(:response_body) do
      {
        "id" => Todo.last.id,
        "done" => params["done"],
        "description" => params["description"],
        "deadline" => params["deadline"],
        "created_at" => "2018-09-24T06:00:00.000Z",
        "updated_at" => "2018-09-24T06:00:00.000Z",
      }
    end

    it_behaves_like "200"

    it "creates todo" do
      expect{ subject }.to change{ Todo.count }.by(1)
    end
  end

  context "when params are invalid" do
    let(:params) {}
    let(:response_body) do
      { "error" => "description is missing, done is missing, deadline is missing" }
    end

    it "doesn't create todo" do
      expect{ subject }.to_not change{ Todo.count }
    end

    it_behaves_like "400"
  end
end
