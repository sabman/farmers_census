module StagesHelper
  def progress_bar(stage)
    percentage = ((stage.id.to_f/Stage.count.to_f)*100)
    case stage.id
    when 1
      return ["Tillering Begins", percentage.to_f ]
    when 2
      return ["Leaf Sheaths", percentage.to_f ]
    when 3  
      return ["Node Detectable", percentage.to_f ]
    when 4 
      return ["Flag Leaf Visible", percentage.to_f ]
    when 5
      return ["First Ears Visible", percentage.to_f ]
    when 6
      return ["Ripening", percentage.to_f ]
    when 7..10
      return ["Harvest Time :)", percentage.to_f ]
    end
  end
end
