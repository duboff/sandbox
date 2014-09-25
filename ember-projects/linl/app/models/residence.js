import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  name: DS.attr('string'),
  owned: DS.attr('boolean'),
  current_value_cents: DS.attr('number'),
  mortgage_balance_cents: DS.attr('number'),
  monthly_payment_cents: DS.attr('number'),
  utilities_cents: DS.attr('number'),
  years_remaining: DS.attr('number'),
  annual_property_tax_cents: DS.attr('number'),
  annual_insurance_cents: DS.attr('number'),
  misc_annual_cents: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
