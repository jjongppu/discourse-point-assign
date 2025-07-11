# frozen_string_literal: true

# name: discourse-point-assign
# about: Manual point assignment for Discourse Gamification
# version: 0.1
# authors: ChatGPT

enabled_site_setting :manual_points_enabled

PLUGIN_NAME ||= "discourse-point-assign"

after_initialize do
  module ::DiscoursePointAssign
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace DiscoursePointAssign
    end
  end

  DiscoursePointAssign::Engine.routes.draw do
    get "/" => "manual_points#index"
    post "/" => "manual_points#create"
  end

  Discourse::Application.routes.append do
    mount ::DiscoursePointAssign::Engine, at: "/admin/point-assign"
  end
end
