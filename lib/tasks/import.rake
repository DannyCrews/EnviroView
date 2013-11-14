namespace :epa_import do

	# rake epa_import:fuel_breakdown
	desc "import EIA database fuel breakdown tables"
	task fuel_breakdown: :environment do
		import_fuel_breakdown
	end

end

def import_fuel_breakdown
	require 'csv' 
	emissions_data = File.open("app/assets/data/annual_generation_state.csv")
		  csv = CSV.parse(emissions_data, :headers => true)
		  csv.each do |row|
		  	n = 0
				year = row[n]
				n += 1
				state_abbr = row[n]
				n += 1
				prod_type = row[n]
				n += 1
				fuel_type = row[n]
				n += 1
				generation = row[n]

				new_object = Fuel.create(year: year,
																		 state_abbr: state_abbr,
																		 prod_type: prod_type,
																		 fuel_type: fuel_type,
																		 generation: generation)	
				puts new_object
		  end
end
