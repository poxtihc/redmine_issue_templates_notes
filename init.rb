require 'redmine'
require 'admin_menu_hooks'
require 'issue_templates_notes_hook'

Redmine::Plugin.register :redmine_issue_templates_notes do
  name 'Redmine Issue Templates Notes plugin'
  author 'Bruno Fonseca & Adriano Cinto Ceccareli'
  description 'Plugin para template de notas'
  author_url 'http://www.sisloc.com.br/institucional/equipe'
  version '0.0.1'
  settings :default => {'empty' => true}, :partial => 'settings/redmine_notes'
  
  menu :admin_menu, :redmine_issue_templates_notes, {:controller => 'issue_templates_notes_settings',:action => 'back_partial_init'}, :caption => :template_notes, :after => :settings, :if => Proc.new{User.current.admin?} 
 
  project_module :issue_templates_notes do    
    permission :load_issue_templates_notes  , {:issue_templates_notes =>[:load]}
  end
end