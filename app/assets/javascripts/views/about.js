Atlas.Views.AboutView = Backbone.View.extend({
  template: JST["about/show"],
  fields: JST["about/fields"],

  render: function() {
    var content = this.template(),
        fields = this.fields({
          user: Atlas.user
        });

    this.$el.html(content);
    this.$el.find('.first-fields').append(fields)
    return this;
  }
});