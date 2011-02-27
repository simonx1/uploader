#ADD THIS
# @apneadiving
# this file provides refactoring for all models using paperclip
# set your own values in the model to override these

Paperclip.interpolates :normalized_name do |attachment, style|
    attachment.instance.normalized_name
end

module Paperclip
  class Attachment
    def self.default_options
      @default_options = {
        :url => "/assets/:class/:attachment/:id/:style/:normalized_name",
        :path => ":rails_root/public/assets/:class/:attachment/:id/:style/:normalized_name",
        :default_url   => "/images/missing.png",
        :convert_options => { },
        :processors    => [],
        :default_style => :original,
        :storage       => :filesystem,
        :validations   => [],
        :whiny         => Paperclip.options[:whiny]
        }
    end
  end
  
  module InstanceMethods
    
    def attachment_name
      self.class.attachment_definitions.first.at(0).to_s
    end
    
    def normalized_name
      eval( attachment_name + '_file_name').gsub( /[^a-zA-Z0-9_\.]/, '_') 
    end
    
  end
  
end