class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

      get '/games' do 
        game = Game.all
        game.to_json
      end

      get '/games/:id' do 
        game = Game.find(params[:id])
        game.to_json(include: :reviews)
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
      reviews = Review.all
      reviews.to_json
    end

    post '/reviews' do
      review = Review.create(
        title: params[:title],
        body: params[:body],
        game_id: params[:game_id],
        user_id: params[:user_id]

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
        )
        review.to_json
      end

      # User routes
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

    # reviews routes
    get '/reviews' do 
      reviews = Review.all
      reviews.to_json
    end

    post '/reviews' do
      review = Review.create(
        title: params[:title],
        body: params[:body],
        game_id: params[:game_id],
        user_id: params[:user_id]

      
      )
      review.to_json
  end

  #profile routes
  get '/profiles' do 
    profiles = Profile.first
    profiles.to_json(include: :user)
  end

  post '/profiles' do
     profile = Profile.create(
      twitter: params[:twitter],
      twich: params[:twich],
      bio: params[:bio],
      user_id: params[:user_id]

    )
    profile.to_json
end

delete '/profiles/:id' do 
  profile = Profile.find(params[:id])
  profile.destroy
  profile.to_json
end
    
      
end