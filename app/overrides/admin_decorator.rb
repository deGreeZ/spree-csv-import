Deface::Override.new(:virtual_path => 'spree/admin/products/index',
                     :name => 'import-button',
                     :insert_after => 'li#new_product_link',
                     :text => '<li id="import_products_link"><%= button_link_to t(:import_products), admin_csv_import_index_path, { :remote => true, :icon => "icon-upload", :id => "admin_new_product" } %></li>')
