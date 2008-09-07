module YamlHelper  
  def YamlHelper.write_to_yaml(klass)
    outfile = File.open(File.join("#{STATIC_ROOT}","#{klass.name.downcase.pluralize}.yml"), 'w+')
    outfile.write( klass.all.to_yaml )
    outfile.close
  end              
end              


module YamlHelperTest
  
end