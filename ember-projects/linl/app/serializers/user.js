import DS from 'ember-data';

export default DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    partner: { serialize: 'records', deserialize: 'ids' },
    residences: { serialize: 'records', deserialize: 'ids' }
  }
});
