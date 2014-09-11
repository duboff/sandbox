`import Ember from 'ember'`

Ember.Handlebars.registerHelper('json', (context) ->
  JSON.stringify(context)
)
