require 'spec_helper'

describe Coursewareable::MembershipsController do

  let(:classroom) { Fabricate('coursewareable/classroom') }
  let(:classroom_membership) do
    Fabricate('coursewareable/membership', :classroom => classroom)
  end
  let(:member) { classroom_membership.user }

  describe 'GET index' do
    before(:each) do
      @request.host = "#{classroom.slug}.#{@request.host}"
      get(:index, :use_route => :coursewareable)
    end

    context 'being logged in as a member' do
      before(:all) do
        setup_controller_request_and_response
        @controller.send(:auto_login, member)
      end

      it { should redirect_to(login_path) }
    end
  end

  describe 'POST create' do
    let(:email) { '' }
    before(:each) do
      @request.host = "#{classroom.slug}.#{@request.host}"
      post(:create, :email => email, :use_route => :coursewareable)
    end

    context 'being logged in as a member' do
      before(:all) do
        setup_controller_request_and_response
        @controller.send(:auto_login, member)
      end

      it { should redirect_to(login_path) }
    end
  end

  describe 'DELETE destroy' do
    let(:membership) do
      Fabricate('coursewareable/membership', :classroom => classroom)
    end

    before(:each) do
      @request.host = "#{classroom.slug}.#{@request.host}"
      delete(:destroy, :id => membership.id, :use_route => :coursewareable)
    end

    context 'being logged in as a member' do
      before(:all) do
        setup_controller_request_and_response
        @controller.send(:auto_login, member)
      end

      it { should redirect_to(login_path) }
    end
  end

end
