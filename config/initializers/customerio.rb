Rails.configuration.customerio = {
  :site_id      => ENV['cfd8095c7ac57cbaeed4'],
  :api_key      => ENV['4f8759e65d218c28bcfc']
}
  
customerio = Customerio::Client.new("cfd8095c7ac57cbaeed4", "4f8759e65d218c28bcfc")