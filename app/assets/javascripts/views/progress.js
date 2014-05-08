Atlas.Views.Progress = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(Atlas.user.commonApp(), "sync", this.updateProgress);
  },

  template: JST['progress'],

  updateProgress: function() {
    this.render();
    _cio.track('progress',{ 
      percent: this.calculateProgress()
    });
  },
  
  calculateProgress: function() {
    return Atlas.user.commonApp().escape('progress');
  },

  render: function() {
    var content = this.template({
      progress: this.calculateProgress()
    });

    this.$el.html(content);
    this._setFileInput();
    return this
  },
  
  _setFileInput: function(){
    $(":file").filestyle({
      input:false,
      icon: true,
      classButton: 'btn btn-danger',
      buttonText: 'Upload Resume'
    });
  }
});