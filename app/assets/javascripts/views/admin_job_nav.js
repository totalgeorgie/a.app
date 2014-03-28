AtlasJob.Views.Navbar = Backbone.View.extend({
  template: JST["admin/job_nav"],
  
  render: function() {
    var content = this.template();

    this.$el.html(content);

    return this
  }
});