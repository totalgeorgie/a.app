Atlas.Views.AboutView = Backbone.AppView.extend({
  template: JST["about/show"],
  fields: JST["about/fields"],
  
  events: {
    'blur .user-field' : 'alterUserInfo',
    'blur .common-app-field' : 'alterCommonAppInfo',
    'change .chosen-select' : 'alterCommonAppInfo'
  },

  render: function() {
    var content = this.template(),
        fields = this.fields({
          user: Atlas.user
        });

    this.$el.html(content);
    this.$el.find('.first-fields').append(fields)
    return this;
  },

});