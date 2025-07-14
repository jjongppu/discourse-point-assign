# frozen_string_literal: true

module DiscoursePointAssign
  class ManualPointsController < ::Admin::AdminController
    requires_plugin PLUGIN_NAME

    def index
      render :index
    end

    def create
      user = User.find_by(id: params[:user_id])
      points = params[:points].to_i
      reason = params[:reason]
      if user && points != 0
        score = GamificationScore.find_or_create_by(user_id: user.id, date: Date.today)
        score.score += points
        score.save!
        GamificationScoreEvent.create!(
          user_id: user.id,
          date: Date.today,
          points: points,
          description: 'manual',
          reason: reason
        )
        render json: success_json
      else
        render json: { error: I18n.t('manual_points.error') }, status: 422
      end
    end
  end
end
