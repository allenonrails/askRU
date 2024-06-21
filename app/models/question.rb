class Question < ApplicationRecord
    belongs_to :user

    validates :title, :body, presence: true

    # private 

    # %w(validation save create update destroy).each do |action|
    #     %w(before after).each do |time|
    #         puts "#{time}_#{action}"
    #         define_method("#{time}_#{action}") do 
    #             puts "****> #{time} #{action}"
    #         end
    #     end
    # end

    # before/after validation
    # before save
    # before/after update
    # after save 
end
