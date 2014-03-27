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
    debugger
    formData.append('common_app[resume]', $input[0].files[0]);
    
    $.ajax({
      url: Atlas.user.commonApp().url(),
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      type: 'PUT',
      success: function() {
        that.render();
        Atlas.user.commonApp().fetch();
      }
    });

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