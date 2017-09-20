require 'rails_helper'

RSpec.describe UsageController, type: :controller do

  describe "#index" do

    let(:stats) { Vmstat.snapshot }

    it 'be successful' do
      get :index
      expect(response).to be_success
    end
  end

  describe "#memory" do

    let(:stats) { Vmstat.snapshot }

    it 'be successful' do
      get :memory
      expect(response).to be_success
    end
  end

  describe "#cpu" do

    let(:stats) { Vmstat.snapshot }

    it 'be successful' do
      get :cpu
      expect(response).to be_success
    end
  end

  describe "#disk" do

    let(:stats) { Vmstat.snapshot }

    it 'be successful' do
      get :disk
      expect(response).to be_success
    end
  end
end
