$(function () {
  $('.main-form').parsley().on('form:validate', function (formInstance) {
    var ok = formInstance.isValid({group: 'block1', force: true}) || formInstance.isValid({group: 'block2', force: true});
    $('.invalid-form-error-message')
      .html(ok ? '' : 'You must correctly fill *at least one of these two blocks!')
      .toggleClass('filled', !ok);
    if (!ok)
      formInstance.validationResult = false;
  });
});