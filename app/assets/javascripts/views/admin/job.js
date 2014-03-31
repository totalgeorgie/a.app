AtlasJob.Views.Job = Backbone.AppView.extend({
  initialize: function(options) {
    this.shortlisted = options.shortlisted;
    window.setTimeout(CameraTag.setup, 0);
  },

  template: JST['admin/jobs/index'],
  
  events: {
    "click .shortlist" : "shortlist",
    "change .chosen-select" : "alterApp"
  },

  alterApp: function(e) {
    var $input = $(e.target),
        attr = $input.attr('name'),
        appId = $input.data('app-id'),
        value = $input.val(),
        model = AtlasJob.job.jobApps().get(appId);
    model.set(attr, value)
    model.save();
    
    this.fadeCheckmark($input, function(input){
      input.fadeOut();
    });
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
    window.setTimeout(this._addSelects.bind(this), 0);
    return this
  }
});