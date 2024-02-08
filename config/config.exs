import Config

if File.exists?(Path.join([Path.dirname(__ENV__.file), "#{Mix.env()}.exs"])) do
  import_config "#{Mix.env()}.exs"
end
