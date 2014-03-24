Atlas.Models.User = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + "users"
  },

  commonApp: function() {
    if (!this._commonApp) {
      this._commonApp = new Atlas.Models.CommonApp();
    }

    return this._commonApp
  },
  
  jobApps: function() {
    if (!this._jobApps) {
      this._jobApps = new Atlas.Collections.JobApps([], {
        user: this
      });
    }

    return this._jobApps
  },
  
  video: function() {
    if (!this._video) {
      this._video = new Atlas.Models.Video({
        user : this
      });
    }

    return this._video
  },

  parse: function(jsonResp) {
    if (jsonResp.common_app) {
      this.commonApp().set(jsonResp.common_app);
      delete jsonResp.common_app
    }

    if (jsonResp.video) {
      this.video().set(jsonResp.video);
      delete jsonResp.video
    }
    
    if (jsonResp.applications) {
      this.jobApps().set(jsonResp.applications);
      delete jsonResp.applications
    }

    return jsonResp
  },
})