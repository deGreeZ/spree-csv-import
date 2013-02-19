class Spree::Admin::CsvImportsController < Spree::Admin::BaseController
  respond_to :html, :js

  def index
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.js { render :layout => false }
    end
  end

  def template
    respond_to do |format|
      format.csv { send_data Spree::CsvImport.generate_template(params[:import_fields]), filename: 'import_template.csv', type: 'text/csv' }
    end
  end

  def import
    import_result = Spree::CsvImport.import(params[:file])
    respond_to do |format|
      format.html do
        if import_result
          redirect_to admin_products_path, notice: t('csv_import.import_success', :count => import_result)
        else
          redirect_to admin_products_path, flash: { error: t('csv_import.import_error') }
        end
      end
    end
  end

end
