module Specjour
  module Cucumber
    module Preloader
      def self.load
        Specjour.benchmark("Loading Cucumber Environment") do
          require 'cucumber' unless defined?(::Cucumber::Cli)
          configuration = ::Cucumber::Cli::Configuration.new
          configuration.parse! []
          runtime = ::Cucumber::Runtime.new(configuration)
          runtime.send :load_step_definitions
          Cucumber.runtime = runtime
        end
      end
    end
  end
end
