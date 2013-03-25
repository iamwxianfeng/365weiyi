# http://stackoverflow.com/questions/3694352/rails-3-default-datetime-format-without-utc
# http://stackoverflow.com/questions/5366567/customizing-datetime-format-in-en-yml-in-rails-3
Date::DATE_FORMATS[:default] = "%Y-%m-%d"
DateTime::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M:%S"
Time::DATE_FORMATS[:default] = "%Y-%m-%d %H:%M:%S"

# https://github.com/rails/rails/blob/2-3-stable/activesupport/lib/active_support/core_ext/time/conversions.rb
# http://jasonseifer.com/2010/03/10/rails-date-formats
Time::DATE_FORMATS[:ymd] = "%Y-%m-%d"
