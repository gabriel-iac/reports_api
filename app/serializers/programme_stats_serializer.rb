class ProgrammeStatsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :finished_programmes, :id, :post_quiz_completed, :pre_quiz_completed
  set_id :programme_id
end
