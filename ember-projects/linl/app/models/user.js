import DS from 'ember-data';

export default DS.Model.extend({
  partner: DS.belongsTo('partner'),
  children: DS.hasMany('child'),
  residences: DS.hasMany('residence'),
  assets: DS.hasMany('asset'),
  assumptions: DS.hasMany('assumption'),
  retirements: DS.hasMany('retirement'),

  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  email: DS.attr('string'),
  marital_status: DS.attr('boolean', {defaultValue: false}),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string'),
  birthdate: DS.attr('date'),
  state: DS.attr('string'),
  current_earnings_cents: DS.attr('number'),
  final_year_earnings_cents: DS.attr('number'),
  ss_currently_collecting: DS.attr('boolean'),
  roth_first: DS.attr('boolean'),
  retirement_date: DS.attr('date'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
