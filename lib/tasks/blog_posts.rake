require 'faker'

namespace :vockice do
    desc "print remainder about eating more fruit"
    task :apple do
        puts "Eat more apples!"
    end

    desc "print remainder about drinking more water"
    task :water do
        puts "Drink more water!"
    end
end

#Create rake task to:
 #generate new blog post,
 #custom number of blog posts,
 #delete all blog posts


namespace :blog_posts do

    desc "Generate a new blog post"
    task :generate, [:title , :content] => :environment do |_, args|
        title = args[:title] || Faker::Book.title
        content = args[:content] || Faker::Lorem.paragraphs(number: 3).join("\n\n")
        BlogPost.create!(title: title, content: content)
        puts "New blog post '#{title}' has been created successfully!"
    end

    desc "Generate a custom number of blog posts"
    task :generate_many, [:number] => :environment do |_, args|
        number = args[:number].to_i
        number.times do |i|
            title = Faker::Book.title
            content = Faker::Lorem.paragraphs(number: 3).join("\n\n")
            BlogPost.create!(title: title, content: content)
        end
        puts "'#{number}' blog posts has been created successfully!"
    end

    desc "Deleting all blog posts"
    task :delete_all => :environment do 
        BlogPost.destroy_all
        puts "All blog posts has been deleted successfully!"
    end
end





    
