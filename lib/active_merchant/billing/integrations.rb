
# make the bogus gateway be classified correctly by the inflector
(ActiveSupport.const_defined?(:Inflector) ? ActiveSupport::Inflector : Inflector).inflections do |inflect|
  inflect.uncountable 'bogus'
end

module ActiveMerchant
  module Billing
    module Integrations        
    
      Dir[File.dirname(__FILE__) + '/integrations/*.rb'].each do |f|      
      
        # Get camelized class name 
        filename = File.basename(f, '.rb')
        # Camelize the string to get the class name
        gateway_class = filename.camelize.to_sym
              
        # Register for autoloading
        autoload gateway_class, f      
      end
    end
  end
end
