require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "GET #new" do
    let!(:course) { create :course }
    let!(:params) { { course: { id: course.id } } }

    it "returns a successful response" do
      get :new, params: params
      expect(response).to be_successful
    end

    it "renders the new template" do
      get :new, params: params
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    let!(:course_1) { create :course }
    let!(:course_2) { create :course }
    let!(:student_group) { create :student_group, course_id: course_1.id }
    let!(:params_1) { { student: { name: Faker::Name.name, email: 'hello@ivanzabrodin.com', course_id: course_1.id } } }
    let!(:params_2) { { student: { name: Faker::Name.name, email: 'itsme@ivanzabrodin.com', course_id: course_2.id } } }

    it "returns a successful response" do
      post :create, params: params_1
      expect(response).to be_successful
    end


    it "redirect to course path" do
      post :create, params: params_2

      expect(response).to redirect_to("/courses/#{course_2.id}")
    end
  end
end
