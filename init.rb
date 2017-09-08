Redmine::Plugin.register :redmine_notification do
  name 'Redmine Notification plugin'
  author 'ISPEHE'
  description 'This is a plugin for Redmine'
  version '0.0.1'

end

Rails.application.config.to_prepare do
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form, :partial=> 'projects/notification'
  end
  Project.send(:include, RedmineNotification::ProjectPatch)
  Issue.send(:include, RedmineNotification::IssuePatch)
end
