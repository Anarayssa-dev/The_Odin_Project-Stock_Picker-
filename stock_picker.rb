# Metodo de stock picker

def stock_picker(array)
	# par de dias day_buy e day_sell
	day_buy = array[0]

	day_sell = 0

	x_day = 0
	y_day = 0

	n_day = 0

	index_sell = 0
	index_buy = 0
	# O melhor dia de comprar
	array.each_with_index do |day_price, i|
		price_next_day = array[i+1]
		
		if price_next_day && day_price>0 && price_next_day>0
			if day_price < day_buy || day_buy == 0
				 
				array[i+1..-1].each_with_index do |n, t|
					x_day = n - day_price
					 
					if x_day >= y_day
						day_sell = n
						y_day = x_day					
						day_buy = day_price
						index_buy = i
						index_sell = i+t+1
					end
				end
			end 
		end
	end
	 
	return [index_buy, index_sell]
	
end

p stock_picker([17,3,6,9,15,8,6,1,10])
