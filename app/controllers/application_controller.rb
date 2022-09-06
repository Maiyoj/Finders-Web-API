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
  
      
end