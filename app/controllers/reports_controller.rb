class ReportsController < WebServiceController

  def total_sales
     totalSales = { number_of_sales: Sale.count, total: Sale.sum(:total) }
     render json: totalSales
  end

  def sales_per_item
      sales = Sale.all
      burgerTotal = 0
      chipTotal = 0
      drinkTotal = 0

      salesPerItem = {'burger' => {'number_of_sales' => "", 'total' => ""}, 'chips' => {'number_of_sales' => "", 'total' => ""}, 'soft drink' => {'number_of_sales' => "", 'total' => ""} }
     
      sales.each do |sale|
	sale.items.each do |item|
	   item['name'].equal? 'burger'
	     burgerTotal += item['burger']['total']	
	end
      end     
      render json: salesPerItem
	
  end

end
