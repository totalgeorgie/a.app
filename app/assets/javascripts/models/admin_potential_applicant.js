AtlasJob.Models.Potential = Backbone.Model.extend({
  urlRoot: function() {
    return AtlasJob.job.url() + '/potentials'
  }
});