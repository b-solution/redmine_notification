module RedmineNotification
  module ProjectPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        # Same as typing in the class.
        unloadable # Send unloadable so it will not be unloaded in development.
        safe_attributes 'send_notification', 'percentage_time', 'number_days'
      end
    end
  end

  module InstanceMethods

  end
end