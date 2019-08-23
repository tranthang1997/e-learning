jQuery(document).on('click', '#sidebarToggle', function(){
  let body = jQuery('body');
  if(body.hasClass('sidebar-toggled')){
    body.removeClass('sidebar-toggled');
    jQuery('#accordionSidebar').removeClass('toggled');
  } else {
    body.addClass('sidebar-toggled');
    jQuery('#accordionSidebar').addClass('toggled');
  }
    return false;
});

jQuery(document).on ('click', '.add_fields', function(){
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  jQuery(this).before($(this).data('fields')).toString().replace(regexp, time);
  return false;
});

function add_fields(link, association, content) {
  let new_id = new Date().getTime();
  let regexp = new RegExp('new_' + association, 'g');
  $(link).before(content.replace(regexp, new_id));
  return false;
}

function removeField(link) {
  $(link).parent().prev().find('input[type=hidden]').val('1');
  $(link).closest(".fields").fadeOut();
}
