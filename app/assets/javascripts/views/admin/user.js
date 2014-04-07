AtlasUser.Views.UserShow = Backbone.View.extend({
  template: JST['admin/users/show'],
  
  render: function() {
    var content = this.template({ user: AtlasJob.user })
  }
});