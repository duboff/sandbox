`import DS from 'ember-data'`

UserModel = DS.Model.extend {
  posts: DS.hasMany('post')
  email: DS.attr('string')
  password: DS.attr('string')
  passwordConfirmation: DS.attr('string')
  updatedAt: DS.attr('date')
  createdAt: DS.attr('date')
}

`export default UserModel`
