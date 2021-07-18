require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe 'GET #new' do
    let!(:course) { create :course }
    let!(:params) { { course: { id: course.id } } }

    it 'returns a successful response' do
      get :new, params: params
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new, params: params
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    let!(:course) { create :course }
    let!(:student_group) { create :student_group, course_id: course.id }
    let!(:params) { { student: { name: Faker::Name.name, email: 'hello@ivanzabrodin.com', course_id: course.id } } }

    it 'redirect to course path' do
      post :create, params: params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/courses/#{course.id}")
    end
  end
end
