Atlas.Models.CommonApp = Backbone.Model.extend({
  urlRoot: function() {
    return Atlas.url + this.endingUrl
  },

  toJSON: function() {
    var data = Backbone.Model.prototype.toJSON.apply(this)
    
    delete data.id
    delete data.created_at
    delete data.updated_at
    
    return { common_app: data };
  }
});