AtlasUser.Views.UserShow = Backbone.View.extend({
  template: JST['admin/users/show'],
  
  initialize: function() {
    window.setTimeout(CameraTag.setup, 0)
  },

  render: function() {
    var content = this.template({ user: AtlasUser.user })
    this.$el.html(content);
    
    return this;
  }
});