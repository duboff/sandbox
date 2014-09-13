import Ember from 'ember';

export default Ember.ObjectController.extend({
  marital_statuses: [
    {value: true, label: 'Yes'},
    {value: false, label: 'No'}
  ]
});
