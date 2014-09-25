import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  name: DS.attr('string'),
  birthdate: DS.attr('date'),
  state: DS.attr('string'),
  current_earnings_cents: DS.attr('number'),
  final_year_earnings_cents: DS.attr('number'),
  ss_currently_collecting: DS.attr('boolean'),
  roth_first: DS.attr('boolean'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')

});

