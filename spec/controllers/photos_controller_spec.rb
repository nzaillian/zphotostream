require 'rails_helper'

describe PhotosController do
  render_views

  before :all do
    @photo1, @photo2 = FactoryGirl.create(:photo), FactoryGirl.create(:photo)
  end

  describe '#index' do
    it "should render 2 photos" do
      get :index
      expect(response.body).to match(/id="photo_#{@photo1.id}"/)
      expect(response.body).to match(/id="photo_#{@photo2.id}"/)
    end
  end

  describe '#show' do
    it "should render a photo" do
      get :show, params: {id: @photo1.uuid}

      expect(response).to be_success
      expect(response.body).to match(/photo-detail-page/)
      expect(response.body).to match(/data-photo-id="#{@photo1.id}"/)
    end
  end  
end