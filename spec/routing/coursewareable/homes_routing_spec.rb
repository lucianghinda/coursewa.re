require 'spec_helper'

describe Coursewareable::HomesController do

  before do
    @routes = Coursewareable::Engine.routes
  end

  describe 'routing' do
    it 'for landing page' do
      get('/').should route_to('coursewareable/homes#index')
    end

    it 'for dashboard' do
      get('/dashboard').should route_to('coursewareable/homes#dashboard')
    end

    it 'for about page' do
      get('/about').should route_to('coursewareable/homes#about')
    end

    it 'for contact page' do
      get('/contact').should route_to('coursewareable/homes#contact')
    end

    it 'for feedback' do
      post('/feedback').should route_to('coursewareable/homes#feedback')
    end

    it 'for survey' do
      post('/survey').should route_to('coursewareable/homes#survey')
    end

    describe 'on a subdomain' do
      it 'goes to classroom langing page' do
        get('http://test.lvh.me').should route_to(
          'coursewareable/classrooms#dashboard')
      end
    end
  end
end
