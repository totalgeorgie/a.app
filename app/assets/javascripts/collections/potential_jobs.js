Atlas.Collections.PotentialJobs = Backbone.Collection.extend({
  url: function() {
    return Atlas.user.url() + '/potentials'
  },
  
  model: Atlas.Models.PotentialJob
});