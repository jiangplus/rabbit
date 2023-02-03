class Api::ItemsController < ApiController
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
		profile = Profile.find_by(auth_token: params[:auth_token])

		item = Item.create(
			sender: profile,
			recever_name: params[:recever_name],
			data: params[:data],
			url: params[:url],
			content: params[:content],
			)

		render json: { result: 'ok', item: item.as_json }
	end
end
