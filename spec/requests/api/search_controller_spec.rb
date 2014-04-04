require 'spec_helper'

describe Api::SearchController do
  let(:request_headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  describe '#search' do
    context 'GET' do
      before(:each) { get '/api/search', {}, request_headers }
      it { expect(response.status).to eq(418) }
    end

    context 'POST' do
      context 'given no search params' do
        before(:each) { post '/api/search', {}, request_headers }

        it 'gives 400' do
          expect(response.status).to eq(400)
        end

        it 'has no content' do
          expect(response.body).to eq(' ')
        end
      end

      context 'given search params' do
        context 'with a query' do
          let(:search_params) do
            {
              :q => {name_cont: 'Institution'}
            }
          end

          before(:each) do
            5.times { FactoryGirl.create(:institution) }
            post '/api/search', search_params.to_json, request_headers
          end

          it 'responds with 200' do
            expect(response.status).to eq(200)
          end

          it 'returns results' do
            expect(Oj.load(response.body)['search'].length).to eq(5)
          end
        end

        context 'with an empty query' do
          let(:search_params) do
            {
              :q => {}
            }
          end

          it 'responds with 400' do
            post '/api/search', search_params.to_json, request_headers
            expect(response.status).to eq(400)
          end
        end
      end
    end
  end
end
