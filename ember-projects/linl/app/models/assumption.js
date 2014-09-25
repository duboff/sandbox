import DS from 'ember-data';

export default DS.model.extend({
  name: DS.attr('string'),
  type: DS.attr('string'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),
  current_percentage: DS.attr('number'),
  future_percentage: DS.attr('number'),
  monthly_cents: DS.attr('number'),

  ownerships: DS.hasMany('ownership'),

  users: function() {
    return this.get('ownerships').then(function(ownerships){
      return ownerships.mapBy('user');
    });
  }.property('ownerships.@each.user'),

  partners: function() {
    return this.get('ownerships').then(function(ownerships){
      return ownerships.mapBy('partner');
    });
  }.property('ownerships.@each.partner')

});
