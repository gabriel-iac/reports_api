class V1::ProgrammeStatsController < ApplicationController

  def programmes_completion_stats
    @result_set = ActiveRecord::Base.connection.select_all("Select ANY_VALUE(assessment_v2_assessment_programmes.id) as programme_id,COUNT(assessment_v2_assessment_programmes.id) as finished_programmes from assessment_v2_assessment_programmes WHERE assessment_v2_assessment_programmes.post_quiz_completed IS NOT NULL").to_a
    results = []
    @result_set.each do |instance|
      results <<  OpenStruct.new(instance)
    end
    json_response(ProgrammeStatsSerializer.new(results).serialized_json)
  end

  private

  def programme_stats_params
    # whitelist params
    params.permit(:programme_id, :finished_programmes)
  end
end
