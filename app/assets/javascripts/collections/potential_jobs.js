Atlas.Collections.PotentialJobs = Backbone.Collection.extend({
  url: function() {
    Atlas.user.url() + 'potentials'
  },
  
  model: Atlas.Models.PotentialJob
});