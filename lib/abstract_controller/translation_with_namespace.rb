# I18nControllerNamespaces
module AbstractController::TranslationWithNamespace
  
  def translate_with_namespace(key, options = {})
    translate_without_namespace(scope_key_by_call_stack(key), options)
  end
  
  def self.included(base)
    base.class_eval do
      alias_method_chain :translate, :namespace
      alias :t :translate
    end
  end
  
  private
  
  def scope_key_by_call_stack(key)
    if key.to_s.first == '.'
      # First remove the Controller part from the class name
      # And in case that the controller is within a namespace
      parts = (self.class.to_s[0..-11]).underscore.split('::')
      
      # Transform to underscore version
      parts = parts.map { |i| i.to_s.downcase }
      
      # 0 => my_translate
      # 1 => calling method (should be controller action name)
      parts << caller[1][/`([^']*)'/, 1]
      
      # namespace + key
      parts.join('.') + key
    else
      # The original key
      key
    end
  end
  
end