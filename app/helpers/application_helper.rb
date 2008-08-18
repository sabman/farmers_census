# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # def display_answer_field(answer, answer_form)
  #   image_tag("#{answer.question.title_label}", :alt => "#{answer.question.text}", :title => "#{answer.question.text}")
  # 
  #   if answer.question.qtype == "text_field" or answer.question.qtype == "text_area" 
  #     answer_form.send("#{answer.question.qtype}", :text, :id => "#{answer.question.text}", :rows => 3)
  #   elsif answer.question.qtype == "list"
  #     for option in answer.question.options 
  #       check_box_tag( "survey[answer_attributes][#{answer.id}][option_ids][]", 
  #                     option.id, answer.options.include?(option), :id => option.text  )
  #             image_tag "#{option.filename}", :alt => "#{option.text}"
  #     end
  #   elsif answer.question.qtype == "options" or answer.question.qtype == "yes_no"
  #     for option in answer.question.options
  #       radio_button_tag( "survey[answer_attributes][#{answer.id}][option_ids][]", 
  #                     option.id, answer.options.include?(option), :id => option.text )
  #             image_tag "#{option.filename}", :alt => "#{option.text}" 
  #     end 
  #   end
  # end

  def image_label(label_name)
    image_tag("/images/labels/#{label_name}.png")
  end

  def title(page_title)
    content_for(:title) { h(page_title) }  
  end
  
  def stylesheets(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def show_avatar(rec=nil)
    rec = @current_survey ? @current_survey : rec
    if rec.avatars.first
      return rec.avatars.first.public_filename(:thumb)
    else
      return 'no_avatar.jpg'
    end
  end

  def show_avatars(rec=nil)
    rec = @current_survey ? @current_survey : rec
    unless rec.avatars.empty?
      rec.avatars.each{ |avatar| yield avatar.public_filename(:thumb) }
    else
      yield 'no_avatar.jpg'
    end
  end

  def mouseover_file(file)
    File.join(File.dirname(file), File.basename(file, File.extname(file))+"_mouseover"+File.extname(file))    
  end
  
end
