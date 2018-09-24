# frozen_string_literal: true

require "rails_helper"

RSpec.describe TodoSerializer do
  subject { described_class.new(todo).attributes }
  let(:todo) { create(:todo) }

  it { expect(subject[:id]).to eq(todo.id) }
  it { expect(subject[:done]).to eq(todo.done) }
  it { expect(subject[:description]).to eq(todo.description) }
  it { expect(subject[:deadline]).to eq(todo.deadline) }
  it { expect(subject[:created_at]).to eq(todo.created_at) }
  it { expect(subject[:updated_at]).to eq(todo.updated_at) }
end
