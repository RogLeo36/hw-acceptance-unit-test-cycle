
require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    
    it 'destroys a movie with given id' do
        movie = Movie.create(:title => "Avatar", :director => "James Cameroon")
        delete :destroy, :id => movie.id
        expect{Movie.find(movie.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it 'tests creation of a movie' do
        post :create, :movie => { :title => "ABC", :director => "DEF", :rating => "RTNG", :release_date =>"05/10/2018"}
        expect(flash[:notice]).to be_present
        expect(response).to redirect_to(movies_path)
    end
    
end
