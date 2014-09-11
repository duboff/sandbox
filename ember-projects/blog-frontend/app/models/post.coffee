`import DS from 'ember-data'`

PostModel = DS.Model.extend {
  user: DS.belongsTo('user')
  title:  DS.attr('string')
  body: DS.attr('string')
}

`export default PostModel`
