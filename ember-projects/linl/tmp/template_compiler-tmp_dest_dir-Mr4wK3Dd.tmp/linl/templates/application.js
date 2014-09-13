import Ember from 'ember';
export default Ember.Handlebars.template(function anonymous(Handlebars,depth0,helpers,partials,data) {
this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Ember.Handlebars.helpers); data = data || {};
  var buffer = '', stack1, escapeExpression=this.escapeExpression, helperMissing=helpers.helperMissing, self=this;

function program1(depth0,data) {
  
  var buffer = '', helper, options;
  data.buffer.push("\n  <button ");
  data.buffer.push(escapeExpression(helpers.action.call(depth0, "invalidateSession", {hash:{},hashTypes:{},hashContexts:{},contexts:[depth0],types:["STRING"],data:data})));
  data.buffer.push(">Logout</button>\n  <ul>\n    <li>");
  data.buffer.push(escapeExpression((helper = helpers['link-to'] || (depth0 && depth0['link-to']),options={hash:{},hashTypes:{},hashContexts:{},contexts:[depth0,depth0],types:["STRING","STRING"],data:data},helper ? helper.call(depth0, "Home", "user", options) : helperMissing.call(depth0, "link-to", "Home", "user", options))));
  data.buffer.push("</li>\n    <li>");
  data.buffer.push(escapeExpression((helper = helpers['link-to'] || (depth0 && depth0['link-to']),options={hash:{},hashTypes:{},hashContexts:{},contexts:[depth0,depth0],types:["STRING","STRING"],data:data},helper ? helper.call(depth0, "Protected", "user.protected", options) : helperMissing.call(depth0, "link-to", "Protected", "user.protected", options))));
  data.buffer.push("</li>\n    <li>");
  data.buffer.push(escapeExpression((helper = helpers['link-to'] || (depth0 && depth0['link-to']),options={hash:{},hashTypes:{},hashContexts:{},contexts:[depth0,depth0],types:["STRING","STRING"],data:data},helper ? helper.call(depth0, "Setup", "setup.personal", options) : helperMissing.call(depth0, "link-to", "Setup", "setup.personal", options))));
  data.buffer.push("</li>\n  </ul>\n\n");
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = '', helper, options;
  data.buffer.push("\n  ");
  data.buffer.push(escapeExpression((helper = helpers['link-to'] || (depth0 && depth0['link-to']),options={hash:{},hashTypes:{},hashContexts:{},contexts:[depth0,depth0],types:["STRING","STRING"],data:data},helper ? helper.call(depth0, "Login", "login", options) : helperMissing.call(depth0, "link-to", "Login", "login", options))));
  data.buffer.push("\n");
  return buffer;
  }

  data.buffer.push("<h2 id='title'>Linl</h2>\n\n");
  stack1 = helpers['if'].call(depth0, "session.isAuthenticated", {hash:{},hashTypes:{},hashContexts:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),contexts:[depth0],types:["ID"],data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n\n\n\n");
  stack1 = helpers._triageMustache.call(depth0, "outlet", {hash:{},hashTypes:{},hashContexts:{},contexts:[depth0],types:["ID"],data:data});
  if(stack1 || stack1 === 0) { data.buffer.push(stack1); }
  data.buffer.push("\n");
  return buffer;
  
});
