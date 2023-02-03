class Api::ProfilesController < ApiController
	def index
		render json: { result: 'ok' }
	end

	def show
		if params[:auth_token]
		  profile = Profile.find_by(auth_token: params[:auth_token])
		elsif params[:username]
		  profile = Profile.find_by(username: params[:username])
		end
		  	
		render json: { result: 'ok', profile: profile.as_json }
	end

	def create
		profile = Profile.create(
			username: params[:username],
			auth_token: params[:auth_token],
			auth_data: params[:auth_data],
			)
		render json: { result: 'ok', profile: profile.as_json }
	end
end
