Atlas.Collections.PotentialJobs = Backbone.Collection.extend({
  initialize: function(values, options) {
  	this.user = options.user;
  },

  url: function() {
    return Atlas.url + 'api/users/' + this.user.id + '/potentials'
  },
  
  model: Atlas.Models.PotentialJob
});