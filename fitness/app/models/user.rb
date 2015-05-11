class User < ActiveRecord::Base
    validates_presence_of :name, :email, :password
    validates_length_of :password, :minimum => 6
    validates_length_of :name, :minimum => 4
    validates_uniqueness_of :email
    validates_format_of :email, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
