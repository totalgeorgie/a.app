Atlas.Models.User = Backbone.Model.extend({
  url: function() {
    return Atlas.url + "users"
  }
})