import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  name: DS.attr('string'),
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
