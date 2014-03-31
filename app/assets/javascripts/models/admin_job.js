AtlasJob.Models.Job = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + '/admin/jobs'
  },

  jobApps: function() {
    if (!this._jobApps) {
      this._jobApps = new AtlasJob.Collections.JobApps();
    }

    return this._jobApps
  },
  
  potentials: function() {
    if(!this._potentials) {
      this._potentials = new AtlasJob.Collections.Potentials();
    }

    return this._potentials
  },

  parse: function(jsonResp) {
    if (jsonResp.applications) {
      this.jobApps().add(jsonResp.applications)
      delete jsonResp.applications
    }

    return jsonResp
  }
});