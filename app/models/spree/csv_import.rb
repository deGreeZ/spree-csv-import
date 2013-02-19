class Spree::CsvImport

  def persisted?
    false
  end

  class << self

    def generate_template(fields)
      ((required_fields + fields).uniq & available_fields).join(',')
    end

    def import(file)
      result = false
      begin
        Spree::Product.transaction do
          spreadsheet = CSV.read(file.path, headers: true)
          result = spreadsheet.size
          spreadsheet.each do |row|
            attrs = row.to_hash.symbolize_keys
            raise if (attrs[:sku].blank? || attrs[:price].blank?)
            attrs[:available_on] = Time.parse(attrs[:available_on]) unless attrs[:available_on].blank?
            Spree::Product.create!(attrs)
          end
        end
        return result
      rescue
        return false
      end
    end

    def required_fields
      %w(name price sku)
    end

    def optional_fields
      %w(description available_on on_hand)
    end

    def available_fields
      required_fields + optional_fields
    end

  end

end
