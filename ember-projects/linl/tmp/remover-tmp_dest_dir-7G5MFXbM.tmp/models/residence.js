import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  name: DS.attr('string'),
  kind: DS.attr('string'),
  monthly_payment_cents: DS.attr('number'),
  value_cents: DS.attr('number'),
  mortgage_balance_cents: DS.attr('number'),
  years_remaining: DS.attr('number'),
  misc_annual_expenses: DS.attr('number'),
  utilities_cents: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
