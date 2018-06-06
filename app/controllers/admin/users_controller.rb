class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end
    
    def new
        
        
    end
    
    def create
        
        user = User.new
        user.name = params[:name]
        user.surname = params[:surname]
        user.email = params[:email]
        user.address = params[:address]
        user.password = params[:password]
        
        user.roles = params[:user_type]
    #    if params[:user_type]=="student_org"
    #        user.add_role 'student_org'
    #    elsif params[:user_type]=="class"
    #        user.add_role 'class'
    #    elsif params[:user_type]=="adviser"
    #        user.add_role 'adviser'
    #    elsif params[:user_type]=="employee"
    #        user.add_role 'employee'
    #    elsif params[:user_type]=="facility"
    #        user.add_role 'facility'
    #    elsif params[:user_type]=="osa"
    #        user.add_role 'osa'
    #   elsif params[:user_type]=="sao"
    #        user.add_role 'sao'
    #    end
        user.save!

        @users = User.all
    end
    
    def studentOrgs
        @users = User.with_role('student_org')
    end
    
    def classGroup
        
        
    end
    
    def adviser
        
        
    end
    
    def employee
        
        
    end
    
    def facility
        
        
    end
    
    def osa
        
        
    end
    
    def sao
        
        
    end
    
    def self.authenticate(password)
        if user.find_by_password(password)#match_password(password)
            return true
        else
            return false
        end 
    end
  
end
