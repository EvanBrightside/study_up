require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @courses" do
      course = create :course
      get :index
      expect(assigns(:courses)).to eq([course])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let!(:course) { create :course }
    let!(:params) { { id: course.id } }

    it "returns a successful response" do
      get :show, params: params
      expect(response).to be_successful
    end

    it "assigns @courses" do
      get :show, params: params
      expect(assigns(:course)).to eq(course)
    end

    it "renders the index template" do
      get :show, params: params
      expect(response).to render_template("show")
    end

    it 'raise an error' do
      expect { get :show, params: { id: 0 } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
