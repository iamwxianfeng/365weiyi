namespace :db do
  desc "empty database"
  task :delete_data => :environment do
    puts "deleting customizations..."
    Customization.delete_all
    puts 'deleting categories...'
    Category.delete_all
    Subcategory.delete_all


    puts "deleting products..."
    Product.delete_all
    puts "deleting photos..."
    Photo.delete_all

    puts "deleting users..."
    User.delete_all
    Profile.delete_all

    puts "deleting notices..."
    Notice.delete_all

    puts "deleting footer helps..."
    Help.delete_all
    
    puts "deleting comments..."
    Comment.delete_all
    Reply.delete_all

    puts "deleting banners..."
    Banner.delete_all
    
    puts "deleting links..."
    Link.delete_all

    puts "deleting measure_pages..."
    MeasurePage.delete_all

    puts "deleting measure_properties..."
    MeasureProperty.delete_all

    puts "deleting measurements..."
    Measurement.delete_all

    puts "deleting inquiries..."
    Inquiry.delete_all
  end
end
