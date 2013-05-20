require 'yaml'
require 'harvested'

module Harvester
  CONFIG_PATH = File.expand_path File.join(File.dirname(__FILE__),'..','..','config.yml')
  module Company
    module_function

    if File.exists? CONFIG_PATH
      CONFIG = YAML.load_file CONFIG_PATH
    else
      puts "Company expected config file here: #{CONFIG_PATH}."
      CONFIG = {}
    end

    def harvest
      @harvest ||= begin
        Harvest.hardy_client(CONFIG['COMPANY_ID'], CONFIG['LOGIN'], CONFIG['PASSWORD'])
      end
    end
  end
end