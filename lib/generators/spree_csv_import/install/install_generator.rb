module SpreeCsvImport
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_csv_import\n", :before => /\*\//, :verbose => true
      end
    end
  end
end
