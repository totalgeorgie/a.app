AtlasJob.Models.User = Backbone.UserModel.extend({
  urlRoot: function() {
    return Atlas.url + "api/admin/users"
  }
})