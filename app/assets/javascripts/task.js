// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
$(function() {
  // フォームカウント
  var frm_cnt = 0;

  // clone object
  $(document).on('click', 'span.add', function() {
    var original = $('#form_block\\[' + frm_cnt + '\\]');
    var originCnt = frm_cnt;
    // var originVal = $("input[name='sex\\[" + frm_cnt + "\\]']:checked").val();

    frm_cnt++;

    original
      .clone()
      .hide()
      .insertAfter(original)
      .attr('id', 'form_block[' + frm_cnt + ']') // クローンのid属性を変更。
      .find("input[type='radio'][checked]").prop('checked', true)
      .end() // 一度適用する
      .find('input, textarea').each(function(idx, obj) {
        $(obj).attr({
          id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
          name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
        });
        $(obj).val('');
      });

    // clone取得
    var clone = $('#form_block\\[' + frm_cnt + '\\]');
    clone.children('span.close').show();
    clone.slideDown('slow');

    // originalラジオボタン復元
    // original.find("input[name='sex\\[" + originCnt + "\\]'][value='" + originVal + "']").prop('checked', true);
  });

  // close object
  $(document).on('click', 'span.close', function() {
    var removeObj = $(this).parent();
    removeObj.fadeOut('fast', function() {
      removeObj.remove();
      // 番号振り直し
      frm_cnt = 0;
      $(".form-block[id^='form_block']").each(function(index, formObj) {
        if ($(formObj).attr('id') != 'form_block[0]') {
          frm_cnt++;
          $(formObj)
            .attr('id', 'form_block[' + frm_cnt + ']') // id属性を変更。
            .find('input, textarea').each(function(idx, obj) {
              $(obj).attr({
                id: $(obj).attr('id').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']'),
                name: $(obj).attr('name').replace(/\[[0-9]\]+$/, '[' + frm_cnt + ']')
              });
            });
        }
      });
    });
  });

});

// モーダル

$(function(){
    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        return false;
    });
});





