import DS from 'ember-data';

export default DS.Model.extend({
  user: DS.belongsTo('user'),

  name: DS.attr('string'),
  birthdate: DS.attr('date'),
  expected_tuition_cents: DS.attr('number'),
  college_entry_date: DS.attr('date'),
  college_exit_date: DS.attr('date'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
