import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),

  name: DS.attr('string'),
  item_type: DS.attr('string'),
  monthly_cents: DS.attr('number'),
  total_amount_cents: DS.attr('number'),
  contributions_cents: DS.attr('number'),
  employer_contributions_cents: DS.attr('number'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  user_owned: DS.attr('boolean')
});
