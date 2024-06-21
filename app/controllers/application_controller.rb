class ApplicationController < ActionController::Base
end

# MVC
# Model = Данные и объект
    # бизнес логика
    # user.rb / users
    # post.rb / posts
    # class User 
    # class Post
    # ORM
# View
    # отображение данных
    # html.erb чтобы зайдествовать руби код и вставить данные с model
# Controller (пульт управления)



# users

# id | name | email 
#  1    Allen  allen@mail.ru

# posts

# id | title | created_at | updated_at | body | user_id
#  1    Title1  ...         ...           Text    1
#                                         body 
#                                         about
#                                         something

# ORM - Object relational mapping


#class User  # users

#end

#User.new #  1    Allen  allen@mail.ru
#User.new #  2    Test  test@mail.ru