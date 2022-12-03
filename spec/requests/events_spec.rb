require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /" do
    it 'should not register the events if it does not have the action attribute' do
      post "/", :params => '{ "test": "test" }'

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq({ 'test' => 'test' })

      get "/issues/all"
      expect(JSON.parse(response.body)).to match_array([])
    end

    it 'should save when it has the action attribute' do
      post "/", :params => '{ "action": "test", "issue": { "number": 1, "user": { "login": "test" } } }'

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include({
                                                     "action" => "test",
                                                     "issue" => {
                                                       "number" => 1,
                                                       "user" => {
                                                         "login" => "test"
                                                       }
                                                     }
                                                   })

      get "/issues/1/events"
      expect(JSON.parse(response.body)).to match_array([
                                                         hash_including({
                                                                          "action" => "test",
                                                                          "create_by" => "test"
                                                                        })
                                                       ])

    end

    it 'should return bad request when it doesn\'t find the issues' do
      get "/issues/1111/events"
      expect(response).to have_http_status(400)
    end
  end
end
