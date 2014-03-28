Atlas.Views.AboutView = Backbone.AppView.extend({
  template: JST["about/show"],
  fields: JST["about/fields"],

  events: {
    'blur .user-field' : 'alterUserInfo',
    'blur .common-app-field' : 'alterCommonAppInfo',
    'change .chosen-select' : 'alterCommonAppInfo',
    'change .file-upload' : 'submitFile'
  },

  submitFile: function(e) {
    var that = this,
        formData = new FormData(),
        $input = $('.file-upload');
    formData.append('common_app[resume]', $input[0].files[0]);
    
    $.ajax({
      url: Atlas.user.commonApp().url(),
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      type: 'PUT',
      success: function() {
        Atlas.user.commonApp().fetch({
          success: function() {
            that.render();
          }
        });
      }
    });
  },

  render: function() {
    var content = this.template(),
        fields = this.fields({
          user: Atlas.user
        });

    this.$el.html(content);
    this.$el.find('.first-fields').append(fields);
    window.setTimeout(this._addSelects.bind(this), 0);
    return this;
  }
});