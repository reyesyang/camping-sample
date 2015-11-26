require 'bundler/setup'

Camping.goes :Nuts

module Nuts::Models
  class Page < Base
  end

  class PageFields < V 1.0
    def self.up
      create_table Page.table_name do |t|
        t.string :title
        t.text :content

        t.timestamps
      end
    end

    def self.down
      drop_table Page.table_name
    end
  end

  class AddTagColumnToPage < V 1.1
    def self.change
      add_column Page.table_name, :tag, :string
      Page.reset_column_information
    end
  end
end

def Nuts.create
  Nuts::Models.create_schema
end

# module Nuts::Controllers
#   class Index < R '/'
#     def get
#       @time = Time.now
#       render :sundial
#     end
#   end
#
#   class Words < R '/welcome/to/my/site'
#     def get
#       "You got here by: /welcome/to/my/site"
#     end
#   end
#
#   class Digits < R '/nuts/(\d+)'
#     def get(number)
#       "You got here by: /nuts/#{number}"
#     end
#   end
#
#   class Segment < R '/gorp/([^/]+)'
#     def get(everything_else_than_a_slash)
#       "You got here by: /gorp/#{everything_else_than_a_slash}"
#     end
#   end
#
#   class DigitsAndEverything < R '/nuts/(\d+)/([^/]+)'
#     def get(number, everything)
#       "You got here by: /nuts/#{number}/#{everything}"
#     end
#   end
# end
#
# module Nuts::Views
#   def layout
#     html {
#       head {
#         title { "Nuts And GORP" }
#       }
#
#       body { self << yield }
#     }
#   end
#
#   def sundial
#     p "The current time is: #{@time}"
#   end
# end
