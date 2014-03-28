AtlasJob.Models.Job = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + '/admin/jobs'
  }
});