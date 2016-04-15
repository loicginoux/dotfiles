require "awesome_print"
include Rails.application.routes.url_helpers

AwesomePrint.irb!
def y(obj)
  puts obj.to_yaml
end