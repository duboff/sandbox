import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),
  name: DS.attr('string'),
  birthdate: DS.attr('date'),
  expected_tuition_cents: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
