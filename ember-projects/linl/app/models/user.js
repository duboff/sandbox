import DS from 'ember-data';
export default DS.Model.extend({
  partner: DS.belongsTo('partner'),
  children: DS.hasMany('child'),
  residences: DS.hasMany('residence'),
  first_name: DS.attr('string'),
  last_name: DS.attr('string'),
  email: DS.attr('string'),
  marital_status: DS.attr('boolean'),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string'),
  birthdate: DS.attr('date'),
  state: DS.attr('string'),
  current_earnings_cents: DS.attr('number'),
  final_year_earnings_cents: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date'),

  ownerships: DS.hasMany('ownership', {asynch: true}),

  reserve_funds: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('asset').filterBy('type', 'reserve');
    });
  }.property('ownerships.@each.asset'),

  regular_assets: function() {
    return this.get('ownerships').then(function(ownerships){
      return ownerships.filterBy('owner_type', 'user').mapBy('asset').filterBy('type', 'regular');
    });
  }.property('ownerships.@each.asset'),

  other_incomes: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('asset').filterBy('other_income');
    });
  }.property('ownerships.@each.asset'),

  special_expenses: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('assumption').filterBy('type', 'special');
    });
  }.property('ownerships.@each.assumption'),

  tax_hikes: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('assumption').filterBy('type', 'tax');
    });
  }.property('ownerships.@each.assumption'),

  inflations: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('assumption').filterBy('type', 'inflation');
    });
  }.property('ownerships.@each.assumption'),

  benefit_cuts: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('assumption').filterBy('type', 'cut');
    });
  }.property('ownerships.@each.assumption'),

  pensions: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('retirement').filterBy('type', 'pension');
    });
  }.property('ownerships.@each.retirement'),

  roths: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('retirement').filterBy('type', 'roth');
    });
  }.property('ownerships.@each.retirement'),

  iras: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('retirement').filterBy('type', 'ira');
    });
  }.property('ownerships.@each.retirement'),

  social_securities: function() {
    return this.get('ownerships').then(function(ownerships) {
      return ownerships.filterBy('owner_type', 'user').mapBy('retirement').filterBy('type', 'ss');
    });
  }.property('ownerships.@each.retirement')

});
