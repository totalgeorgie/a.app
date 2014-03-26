
Atlas.Views.OnChinaView = Backbone.AppView.extend({
  template: JST["on-china/show"],
  firstFields: JST["on-china/first-fields"],
  secondFields: JST["on-china/second-fields"],

  events: {
    'blur .user-field' : 'alterUserInfo',
    'blur .common-app-field' : 'alterCommonAppInfo',
    'change .chosen-select' : 'alterCommonAppInfo'
  },
  
  render: function() {
    var content = this.template(),
        firstFields = this.firstFields({
          user: Atlas.user
        }),
        secondFields = this.secondFields({
          user: Atlas.user
        });

    this.$el.html(content);
    this.$el.find('.first-fields').append(firstFields)
    this.$el.find('.second-fields').append(secondFields)
    return this;
  }

});