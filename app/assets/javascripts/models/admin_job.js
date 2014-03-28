AtlasJob.Models.Job = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + '/admin/jobs'
  },

  jobApps: function() {
    if (!this._jobApps) {
      this._jobApps = new AtlasJob.Collections.jobApps({
        job: this
      });
    }

    return this._jobApps
  },

  parse: function(jsonResp) {
    if (jsonResp.applications) {
      this._jobApps.add()
    }
  }
});