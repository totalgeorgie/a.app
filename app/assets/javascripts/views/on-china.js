Atlas.Views.OnChinaView = Backbone.View.extend({
  template: JST["on-china/show"],
  first_fields: JST["on-china/first-fields"],

  render: function() {
    var content = this.template();
    var fields = this.first_fields();

    this.$el.html(content);
    this.$el.find('.first-fields').append(fields)
    return this;
  }
});