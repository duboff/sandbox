import DS from 'ember-data';

export default DS.Model.extend({
  partner: DS.hasOne('partner'),
  children: DS.hasMany('child'),
  residences: DS.hasMany('residence'),
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string'),
  birthdate: DS.attr('date'),
  marital_status: DS.attr('boolean'),
  state: DS.attr('string'),
  ss_currently_collecting: DS.attr('boolean'),
  ss_monthly_benefits_cents: DS.attr('number'),
  current_earnings_cents: DS.attr('number'),
  final_year_earnings_cents: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
