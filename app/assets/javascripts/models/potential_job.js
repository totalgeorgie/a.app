Atlas.Models.PotentialJob = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + 'api/jobs'
  }
})