class ApplicationController < ActionController::API

    # before_action :authorized
    
    def issue_token(payload)
        # payload here is an object that looks like #payload => { key: 'value'}
        JWT.encode(payload, ENV['JWT_CODE'], 'HS256')
    end

    def auth_header
        request.headers['Authorization']
        # ie and authorization header that has Authorization: Bearer <insert JWT token here>
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['JWT_CODE'], true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    # def decode_token(token)
    #     JWT.decode(token, ENV['JWT_CODE'])[0]
    # end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in
        !!current_user
    end

    def authorized
        render json: {message: 'Please log in'},status: :unauthorized unless logged_in
    end

end
