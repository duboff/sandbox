require 'grape'

module API
  module V1
    module SharedParams
      extend Grape::API::Helpers

      params :user do
        requires :user, type: Hash do
          requires :email, type: String

          Boolean = Virtus::Attribute::Boolean
          
          #user params
          optional :first_name, type: String, desc: 'User first name'
          optional :last_name, type: String, desc: 'User last name'
          optional :password, type: String, desc: 'User password'
          optional :password_confirmation, type: String, desc: 'User password confirmation'
          optional :birthdate, type: Date, desc: 'User birthdate'
          optional :state, type: String, desc: 'User state' 
          optional :ss_currently_collecting, type: Boolean, desc: 'Whether user is currently collecting social security benefits' 
          optional :current_earnings_cents, type: Integer, desc: "User's current earnings per year"
          optional :final_year_earnings_cents, type: Integer, desc: "User's earnings the year before retirement"
          optional :roth_first, type: Boolean, desc: "True = User will withdraw from Roth-IRA first, False reverses the order"
          optional :retirement_date, type: Date, desc: "Date user will retire"
          optional :marital_status, type: Boolean, desc: "True = user is married, False means user is not married"
          optional :created_at, type: Date, desc: 'Time user record was created'
          optional :updated_at, type: Date, desc: 'Time user record was last updated'

          optional :partner, type: Hash do
            optional :name, type: String,  desc: 'Partner Name'
            optional :birthdate, type: Date, desc: 'Partner birthdate'
            optional :state, type: String, desc: 'Partner state' 
            optional :ss_currently_collecting, type: Boolean, desc: 'Whether partner is currently collecting social security benefits' 
            optional :current_earnings_cents, type: Integer, desc: "Partner's current earnings per year"
            optional :final_year_earnings_cents, type: Integer, desc: "Partner's earnings the year before retirement"
            optional :roth_first, type: Boolean, desc: "True = Partner will withdraw from Roth-IRA first, False reverses the order"
            optional :retirement_date, type: Date, desc: "Date partner will retire"
            optional :created_at, type: Date, desc: 'Time partner record was created'
            optional :updated_at, type: Date, desc: 'Time partner record was last updated'
          end

          optional :residences, type: Array do
            optional :name, type: String,  desc: 'Residence Name'
            optional :monthly_payment_cents, type: Integer, desc: "Monthly payment for residence"
            optional :current_value_cents, type: Integer, desc: "Current value of residence"
            optional :mortgage_balance_cents, type: Integer, desc: "Remaining mortgage on residence"
            optional :years_remaining, type: Integer, desc: "Years remaining on residence's mortgage"
            optional :misc_annual_expenses_cents, type: Integer, desc: "Any additional yearly expenses not accounted for in inputs"
            #TODO is it utilities per month or annually?
            optional :utilities_cents, type: Integer, desc: "Utilities annually"
            optional :annual_property_tax_cents, type: Integer, desc: "Annual property tax"
            #TODO is it insurance amount or cost?
            optional :annual_insurance_cents, type: Integer, desc: "Annual Insurance amount"
            optional :owned, type: Boolean, desc: "True = user owns residence, False = user does not own residence"
            optional :created_at, type: Date, desc: 'Time residence record was created'
            optional :updated_at, type: Date, desc: 'Time residence record was last updated'
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
