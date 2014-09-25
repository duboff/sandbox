import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  type: DS.attr('string'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  monthly_cents: DS.attr('number'),
  total_cents: DS.attr('number'),
  contributions_cents: DS.attr('number'),
  employer_contributions_cents: DS.attr('number'),
  user_owned: DS.attr('boolean'),

  user: DS.belongsTo('user')

});
