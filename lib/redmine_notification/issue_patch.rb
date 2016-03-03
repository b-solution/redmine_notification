require_dependency 'issue'
module RedmineNotification
  module IssuePatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        # Same as typing in the class.
        unloadable # Send unloadable so it will not be unloaded in development.
      end
    end
  end

  module InstanceMethods
    def days_before_due_date
      (due_date - Date.today).to_i
    end

    def issue_duration
      (due_date - start_date).to_i
    end

    def days_not_updated
      (Date.today - updated_on).to_i
    end

    def can_notify_if_due_is_coming?
      pr_percent_time = project.percentage_time
      return false if pr_percent_time.to_i.zero? or due_date < Date.today
      if due_date == Date.today
        return true
      end
      if (issue_duration / days_before_due_date.to_f) < pr_percent_time.to_i
        return true
      end
      false
    end

    def can_notify_if_not_updated?
      days_not_updated > project.number_days ? true :false
    end
  end
end
