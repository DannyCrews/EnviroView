class MainController < ApplicationController
  respond_to :html, :xml, :json
  include HTTParty

  def index
    @main_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_DIM_FACILITY/ROWS/0:50/XML')
    @emissions_data = HTTParty.get('http://iaspub.epa.gov/enviro/efservice/PUB_FACTS_SUBP_GHG_EMISSION/ROWS/0:50/XML')
    @bills = Congress.bills_search(:query => "green house gases")
end

end
