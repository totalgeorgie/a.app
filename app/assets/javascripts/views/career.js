Atlas.Views.CareerView = Backbone.AppView.extend({
  template: JST["career/show"],
  firstFields: JST["career/first-fields"],
  secondFields: JST["career/second-fields"],

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
    window.setTimeout(this._addSelects.bind(this), 0);
    return this;
  }

});