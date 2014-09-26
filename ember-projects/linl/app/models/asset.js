import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),

  name: DS.attr('string'),
  item_type: DS.attr('string'),
  rate_of_return: DS.attr('number'),
  initial_amount_cents: DS.attr('number'),
  final_amount_cents: DS.attr('number'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  user_owned: DS.attr('boolean'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
