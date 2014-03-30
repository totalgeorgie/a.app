AtlasJob.Views.Job = Backbone.View.extend({
  initialize: function(options) {
    this.shortlisted = options.shortlisted;
    window.setTimeout(CameraTag.setup, 0);
  },

  template: JST['admin/jobs/index'],
  
  events: {
    "click .shortlist" : "shortlist"
  },

  shortlist: function(e) {
    e.preventDefault();

    var $shortlist = $(e.currentTarget),
        appId = $shortlist.data('app-id'),
        $content = $shortlist.parent().parent(),
        app = AtlasJob.job.jobApps().get(appId);

    $shortlist.addClass('active');
    
    app.set('shortlisted',!app.get('shortlisted'));
    app.save({},{
      success: function(){
        $content.remove();
      },

      error: function() {
        $shortlist.removeClass('active');
      }
    })
  },

  render: function() {
    var content = this.template({
      jobApps: AtlasJob.job.jobApps(),
      shortlisted: this.shortlisted
    });

    this.$el.html(content);

    return this
  }
});