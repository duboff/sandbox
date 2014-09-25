import Ember from 'ember';

export default Ember.Model.extend({
  user: DS.belongsTo('user', {asynch: true}),
  partner: DS.belongsTo('partner', {asynch: true}),
  asset: DS.belongsTo('asset', {asynch: true}),
  assumption: DS.belongsTo('assumption', {asynch: true}),
  retirement: DS.belongsTo('retirement', {asynch: true}),

  owner_type: DS.attr('string')
});