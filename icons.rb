require 'rubygems'
require 'sinatra'    
require 'maruku'
require 'yaml'

class Icon
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
end

class IconSet    
  attr_accessor :icons, :name, :url, :creator, :download, :description, :keywords
  
  def initialize(path)   
    # these should use File.join
    @url = "/sets/" + path 
    @path = "public/icons/" + path 

    @metadata = load_metadata
    
    @name = @metadata['name']                
    @creator = @metadata['creator']                
    @download = @metadata['download']                
    @description = markdown(@metadata['description'])                
    @keywords = @metadata['labels'].split(',')                

    @icons = get_icons
  end                 
              
  def size
    icons.length
  end              

  private   
  
  def get_icons
    icon_set = []
    Dir.chdir(@path) do
      Dir.glob("*.{jpg,JPG,png,PNG}") do |icon|
        icon_set << Icon.new(File.join("/icons/",File.basename(@path),icon))
      end
    end 
    return icon_set      
  end                         
  
  def load_metadata
    read_yaml
  end
  
  def read_yaml
    content = File.read(File.join(@path, "README"))
    if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
      content = content[($1.size + $2.size)..-1]
      data = YAML.load($1)
      data['description'] = content 
    end
    return data
  end 
  
  def markdown(content)
    Maruku.new(content).to_html
  end
end

helpers do
  def find_icon_sets
    icon_sets = []
    Dir.glob("public/icons/*") do |set|
      icon_sets << IconSet.new(File.basename(set))
    end 
    return icon_sets
  end                      
end

get '/' do
  @icon_sets = find_icon_sets
  erb :index
end   

get '/sets/:icon_set_path' do
  @icon_set = IconSet.new(params[:icon_set_path])
  erb :icons
end