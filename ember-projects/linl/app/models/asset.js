import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  type: DS.attr('string'),
  rate_of_return: DS.attr('number'),
  initial_amount_cents: DS.attr('number'),
  final_amount_cents: DS.attr('number'),
  start_date: DS.attr('date'),
  end_date: DS.attr('date'),

  ownerships: DS.hasMany('ownership'),

  users: function(){
    return this.get('ownerships').then(function(ownerships){
      return ownerships.mapBy('user');
    }
  }.property('ownerships.@each.user'),

  partners: function(){
    return this.get('ownerships').then(function(ownerships){
      return ownerships.mapBy('partner');
    }
  }.property('ownerships.@each.partner')
});
