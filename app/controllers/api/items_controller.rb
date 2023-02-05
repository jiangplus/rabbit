class Api::ItemsController < ApiController
	def index
		if params[:sender_token]
			profile = Profile.find_by(auth_token: params[:sender_token])
			items = Item.where(sender: profile).all
		elsif params[:receiver_token]
			profile = Profile.find_by(auth_token: params[:receiver_token])
			items = Item.where(receiver: profile).all
		end

		render json: { result: 'ok', items: items.as_json }
	end

	def show
		item = Item.find(params[:id])

		render json: { result: 'ok', item: item.as_json }
	end

	def create
		profile = Profile.find_by(auth_token: params[:auth_token])

		item = Item.create(
			sender: profile,
			receiver_name: params[:receiver_name],
			data: params[:data],
			url: params[:url],
			content: params[:content],
			)

		if params[:receiver_token]
		  receiver = Profile.find_by(auth_token: params[:receiver_token])
		  item.update(receiver: receiver)
		end
		render json: { result: 'ok', item: item.as_json }
	end

	def update # receive
		profile = Profile.find_by(auth_token: params[:auth_token])
		item = Item.find(params[:id])
		item.update(receiver: profile)

		render json: { result: 'ok', item: item.as_json }
	end
end
