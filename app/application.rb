require 'shotgun'
require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find {|i| i.name == item_name}
      # resp.write item.price
      # binding.pry
        if @@items.include?(item)
          # item = @@items.find {|i| i.name == item_name}
          resp.write item.price
        else
          resp.write "Item not found"
          # binding.pry
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
