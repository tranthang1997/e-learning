class LearningService
  def initialize cur_user, word
    @cur_user = cur_user
    @word = word
  end

  def mark_learned
    learnings = Learning.find_by user_id: @cur_user.id, word_id: @word.id
    return if learnings
    (@cur_user.learnings.build word_id: @word.id).save
  end
end
