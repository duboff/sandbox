`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import 'blog-frontend/helpers/json'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: 'blog-frontend', # TODO: loaded via config
  Resolver: Resolver

loadInitializers(App, 'blog-frontend')

`export default App`
