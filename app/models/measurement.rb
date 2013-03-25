#coding:utf-8
class Measurement < ActiveRecord::Base
  belongs_to :measure_property
  belongs_to :user

protected
  def self.create_from_params(params, user)
    measure_page = MeasurePage.find(params["measure_page_id"])
    measure_page_id = ((measure_page)? (measure_page.id) : (MeasurePage.find(:first).id))
    user_id = user.id

      measurement_array = Array.new

      params[:properties].each do |key, value|
        key.strip!
        value.strip!
        unless (value.blank?)
          # update if record exists
          if (measurement = user.measurements.find_by_id(key))
            measurement.measure = value
            measurement.save!
          else
            measurement_array << {:measure_property_id => key, :measure => value, :user_id => user_id}
          end
        end

      end

      return true if (Measurement.create(measurement_array))

      return false

    end

end
