module API
  module V1
    module SharedParams
      extend Grape::API::Helpers

      params :user do
        requires :user, type: Hash do
          requires :email, type: String

          optional :first_name, :last_name, :password, :password_confirmation,
              :birthdate, :state, :ss_currently_collecting, :current_earnings_cents,
              :final_year_earnings_cents, :roth_first, :retirement_date,
              :marital_status, :created_at, :updated_at

          optional :partner, type: Hash do
            optional :name, :birthdate, :state, :ss_currently_collecting,
              :current_earnings_cents, :final_year_earnings_cents, :roth_first,
              :retirement_date, :created_at, :updated_at
          end
        end
      end

      params :create_user do
        requires :user, type: Hash do
          requires :email, type: String
          requires :password, type: String
          requires :password_confirmation, type: String
        end
      end

      params :find_user do
        requires :id, type: String, desc: "ID of the user"
      end

      def delete_from_params(params, key)
         params.delete key
      end

      def turn_into_attribute(params, key)
        attributes = key.to_s + '_attributes'
        params[attributes.to_sym] = params.delete key
      end

    end
  end
end
