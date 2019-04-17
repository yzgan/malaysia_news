class ApiServices
  attr_reader :api_key, :api

  def initialize(api_service, api_key)
    @api = api_service
    @api_key = api_key
  end

  def get(url, **query)
    response = api.get(url, headers: headers, query: query)
    JSON.parse(response.body)
  end

  private

  def headers
    {
      Authorization: "bearer #{api_key}"
    }
  end
end