# frozen_string_literal: true

shared_examples "200" do
  it "responds with success status" do
    subject
    expect(response).to have_http_status(:ok)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "201" do
  it "responds with success status" do
    subject
    expect(response).to have_http_status(:created)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "204" do
  it "responds with success status" do
    subject
    expect(response).to have_http_status(:no_content)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq("")
  end
end

shared_examples "400" do
  it "returns 400 status" do
    subject
    expect(response).to have_http_status(400)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "401" do |message = "You are not authorized to perform this action."|
  it "responds with 401" do
    subject
    expect(response).to have_http_status(:unauthorized)
  end

  it "responds with proper body" do
    subject
    response_body = { error: message }.to_json
    expect(response.body).to eq(response_body)
  end
end

shared_examples "invalid_token - 401" do
  include_examples "401", I18n.t("doorkeeper.errors.messages.invalid_token.unknown")
end

shared_examples "403" do
  it "returns 403 status" do
    subject
    expect(response).to have_http_status(403)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "404" do |message = "Record not found"|
  it "returns 404 status" do
    subject
    expect(response).to have_http_status(404)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(message.to_json)
  end
end

shared_examples "422" do
  it "returns 422 status" do
    subject
    expect(response).to have_http_status(422)
  end

  it "responds with proper body" do
    subject
    expect(response.body).to eq(response_body.to_json)
  end
end
