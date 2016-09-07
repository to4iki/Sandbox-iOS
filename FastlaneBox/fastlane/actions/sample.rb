# See also: https://github.com/mozilla/firefox-ios-build-tools/tree/master/fastlane/actions

module Fastlane
  module Actions
    module SharedValues
      SAMPLE_CUSTOM_VALUE = :SAMPLE_CUSTOM_VALUE
    end

    class SampleAction < Action
      def self.run(params)
        puts '>>'
        puts params[:some_param]
        puts '<<'
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'A sample action'
      end

      def self.details
        'A sample action'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :some_param,
                                       env_name: 'env',
                                       description: "SampleAction",
                                       optional: false)
        ]
      end

      def self.output
      end

      def self.return_value
      end

      def self.authors
        ["to4iki"]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
