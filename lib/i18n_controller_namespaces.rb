require 'abstract_controller/translation_with_namespace'

class ActionController::Base
  include AbstractController::TranslationWithNamespace
end