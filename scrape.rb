require 'watir'
require 'nokogiri'

BR = Watir::Browser.new :firefox

BR.goto('https://www.bunnings.com.au/search/products?facets=CategoryIdPath%3D2a021706-07d5-4648-bf26-2ea8fea049df%20%3E%206ef144fa-daa0-4ac6-9558-56e4480742ea%20%3E%204d53fb34-dc69-457b-8577-2d9d647206f4%20%3E%200a0286f2-f05b-4e56-949f-120b9ab56109')

def click_button
  BR.link(:class => 'view-more').click
end


def get_xml
  page = BR.html
  Nokogiri::HTML(page)
end

def get_average
  xml = get_xml
  prices = xml.css('.product-list__item.hproduct .price-value')
  for price in prices
    puts price.text.gsub('.', '').gsub('$', '');
  end
end

def keep_clicking
  while true
    begin
      click_button
    rescue
      break
    end
  end
end
