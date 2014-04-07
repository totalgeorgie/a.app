Atlas.Models.User = Backbone.UserModel.extend({
  urlRoot: function() {
    return Atlas.url + "api/users"
  }
})