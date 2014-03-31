AtlasJob.Collections.Potentials = Backbone.Collection.extend({
  url: function() {
    return AtlasJob.job.url() + '/potentials'
  },

  model: AtlasJob.Models.Potential
});