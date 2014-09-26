import DS from 'ember-data';

export default DS.model.extend({
  user: DS.belongsTo('user'),

  name: DS.attr('string'),
  item_type: DS.attr('string'),
  current_percentage: DS.attr('number'),
  future_percentage: DS.attr('number'),
  monthly_cents: DS.attr('number'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  user_owned: DS.attr('boolean'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
