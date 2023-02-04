class Api::ProfilesController < ApiController
	def index
		render json: { result: 'ok' }
	end

	def login
		p params
		code = params[:code]
		app_id = ENV['WX_APP_ID']
		app_secret = ENV['WX_APP_SECRET']
		res = RestClient.post("https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code", '')
		data = JSON.parse(res.body)
		openid = data["openid"]

		profile = Profile.find_by(auth_token: openid)
		if profile
			profile.update(username: params[:username])
		else
			profile = Profile.create(username: params[:username], auth_token: openid)
		end

		render json: { result: 'ok', profile: profile.as_json }
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
