# frozen_string_literal: true

# name: discourse-point-assign
# about: Manual point assignment for Discourse Gamification
# version: 0.1
# authors: jonggil kim

enabled_site_setting :manual_points_enabled

PLUGIN_NAME ||= "discourse-point-assign"

after_initialize do
  add_admin_route("js.manual_points.title", "manual-points", { use_new_show_route: true })

  Discourse::Application.routes.append do
    get '/admin/plugins/manual-points' => 'admin/plugins#index'
  end

  # module ::DiscoursePointAssign
  #   class Engine < ::Rails::Engine
  #     engine_name PLUGIN_NAME
  #     isolate_namespace DiscoursePointAssign
  #   end
  # end

  # DiscoursePointAssign::Engine.routes.draw do
  #   post "/" => "manual_points#create"
  # end

  # Discourse::Application.routes.append do
  #   mount ::DiscoursePointAssign::Engine, at: "/admin/plugins/manual-points/api"
  # end
end
