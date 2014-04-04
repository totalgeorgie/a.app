Atlas.Views.AboutView = Backbone.AppView.extend({
  template: JST["about/show"],
  firstFields: JST["about/first-fields"],
  secondFields: JST["about/second-fields"],
  

  events: {
    'blur .user-field' : 'alterUserInfo',
    'blur .common-app-field' : 'alterCommonAppInfo',
    'change .chosen-select' : 'alterCommonAppInfo',
    'change .file-upload' : 'submitFile',
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

  _addFilestyle: function() {
    $(":file").filestyle({
      input:false,
      icon: true,
      classButton: 'btn btn-danger',
      buttonText: 'Upload Resume'
    });
  },

  render: function() {
    var content = this.template(),
        firstFields = this.firstFields({
          user: Atlas.user
        }),
        secondFields = this.secondFields({
          user: Atlas.user
        })

    this.$el.html(content);
    this.$el.find('.first-fields').append(firstFields);
    this.$el.find('.second-fields').append(secondFields)

    window.setTimeout(this._addSelects.bind(this), 0);
    window.setTimeout(this._addFilestyle.bind(this), 0);
    return this;
  }
});