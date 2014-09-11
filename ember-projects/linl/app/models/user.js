import DS from 'ember-data';

export default DS.Model.extend({
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  email: DS.attr('string'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date')
});
