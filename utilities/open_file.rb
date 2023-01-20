require 'json'

def open_file(path)
  File.new(path, 'w') unless File.exist?(path)
  json_sting = File.read(path)
  json_sting != '' && json_sting != 'null' ? JSON.parse(json_sting) : []
end
