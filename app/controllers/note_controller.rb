class NoteController < ApplicationController
    def index
    end
    
    
    def food
        @foods=Food.all
    end
    
    def activity
        @activities = Activity.all
    end
    
    def ttmaking
    end
    
end
