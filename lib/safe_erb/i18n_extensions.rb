module I18n
  module Backend
    Simple.class_eval do
      # Untaint *.yml translation files when reading from disk.  In theory,
      # we shouldn't have to do this, but Rails frequently fails to escape
      # strings from these files in ActionView::Helper methods.
      #--
      # TODO - Submit ActionView::Helper patches putting h(...) around
      # translations.
      def load_yml(filename)
        YAML::load(IO.read(filename).untaint)
      end
    end
  end
end
