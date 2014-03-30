AtlasJob.Models.Job = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + '/admin/jobs'
  },

  jobApps: function() {
    if (!this._jobApps) {
      this._jobApps = new AtlasJob.Collections.jobApps();
    }

    return this._jobApps
  },

  parse: function(jsonResp) {
    if (jsonResp.applications) {
      this.jobApps().add(jsonResp.applications)
      delete jsonResp.applications
    }

    return jsonResp
  }
});