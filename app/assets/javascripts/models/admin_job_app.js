AtlasJob.Models.JobApp = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url() + 'admin/applications'
  }
});