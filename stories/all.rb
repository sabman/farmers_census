dir = File.dirname(__FILE__)
Dir[File.expand_path("#{dir}/**/*.rb")].uniq.each do |file|
  require file
end

# the app should 
#   allow us to take a census by registering
#   maintain a list of completed census
   

# Question has many Answers
# Answer has a Question
# Census has many Questions and Answers
# 
# QuestionGroup has many Questions
# Questions belongs to a QuestionGroup
# 
# Question text:string question_group_id:integer

