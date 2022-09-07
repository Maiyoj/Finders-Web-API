class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

      get '/games' do 
        game = Game.all
        game.to_json
      end

      post '/games' do
        game = Game.create(
          name: params[:name],
          description: params[:description]
        )
        game.to_json
    end

    delete '/games/:id' do 
        game = Game.find(params[:id])
        game.destroy
        game.to_json
      end
  
      patch '/games/:id' do 
        game = Game.find(params[:id])
        game.update(
            name: params[:name],
            description: params[:description]
        )
        game.to_json
      end
  

    #   Review Routes
    get '/reviews' do 
        review = Review.all
        review.to_json
      end

      post '/reviews' do
        review = Review.create(
          body: params[:body],
          game_id: params[:game_id]
        )
        review.to_json
    end

    delete '/reviews/:id' do 
        review = Review.find(params[:id])
        review.destroy
        review.to_json
      end
  
      patch '/reviews/:id' do 
        review = Review.find(params[:id])
        review.update(
            body: params[:body],
            game_id: params[:game_id]
        )
        review.to_json
      end

      # User section
      get '/users' do 
        users = User.all
        users.to_json
      end

      post '/users' do
        user = User.create(
          name: params[:name],
          email: params[:email],
          phone: params[:phone]
        )
        user.to_json
    end


    


      
end