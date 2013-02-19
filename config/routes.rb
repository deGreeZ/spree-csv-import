Spree::Core::Engine.routes.prepend do
  namespace :admin do
    get '/csv_imports', controller: :csv_imports, action: :index, as: :csv_import_index
    post '/csv_imports/template', controller: :csv_imports, action: :template, as: :csv_import_template, defaults: { format: 'csv' }
    post '/csv_imports/import', controller: :csv_imports, action: :import, as: :csv_import_import, defaults: { format: 'html' }
  end
end
