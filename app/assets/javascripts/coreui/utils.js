$(document).on('click', '.c-header-nav-link', function (e) {
  e.preventDefault();

  if ($(this).attr('aria-expanded') === 'true') {
    $(this).parent().removeClass('show');
    $(this).next().removeClass('show');
  } else {
    $(this).parent().addClass('show');
    $(this).next().addClass('show');
  }
})

$(document).on('click', '.c-class-toggler', function () {
  var data_target = $($(this).data('target'));
  var data_class = $(this).data('class');

  if (data_target.hasClass(data_class)) {
    data_target.removeClass(data_class)
  } else {
    data_target.addClass(data_class);
  }
})


$(document).on('click', '.c-sidebar-nav-dropdown-toggle', function () {
  var data_target = $($(this).parent());
  var data_class = 'c-show';

  if (data_target.hasClass(data_class)) {
    data_target.removeClass(data_class)
  } else {
    data_target.addClass(data_class);
  }
})

toastr.options = {
  "positionClass": "toast-top-center",
};

$(document).on("click", ".go-back", function (e) {
  window.history.back();
  e.preventDefault();
});

$(document).on("click", ".btn-resource", function (e) {
  form = document.querySelector('.form-resource');
  Rails.fire(form, 'submit');
});

$(document).on('ajax:success', '.form-resource', function (e, data, status, xhr) {
  if (e.originalEvent.detail[0].data)
    window.location.replace(e.originalEvent.detail[0].data);
});

$(document).on('ajax:error', '.form-resource', function (e, data, status, xhr) {
  toastr.error(e.originalEvent.detail[0].data, 'Error!')
});

$(document).on("click", ".btn-cocoon", function (e) {
  var depth = parseInt($(this).data('depth'));
  var ele = $(this);
  for (var i = 0; i < depth; i++)
    ele = ele.parent();

  var target = ele.find($(this).data('cocoon-target'));
  var link = $(this).prev().find('a')
  link.trigger('click');
  target.append($(this).prev().prev());
  initFormComponents();
});

$(document).on('cocoon:after-insert', function () {
  initFormComponents()
});


function initFormComponents() {

  $('.sortable').railsSortable({handle: '.sortable-handle'});

  $('.nested-fields').each(function () {
    if ($(this).next().is('input')) {
      $(this).append($(this).next());
    }
  })

  $(document).find('select.select2').not('.select2-hidden-accessible').select2({theme: 'coreui'});

  $('.datepicker').daterangepicker({
    singleDatePicker: true,
    locale: {
      format: "YYYY-MM-DD"
    }
  });

  $('.datetimepicker').daterangepicker({
    singleDatePicker: true,
    timePicker: true,
    timePicker24Hour: true,
    timePickerIncrement: 30,
    locale: {
      format: "YYYY-MM-DD HH:mm"
    }
  });

}

function initSidebar() {

  $('.c-sidebar-nav-link').removeClass('c-active');
  $('.c-sidebar-nav-dropdown').removeClass('c-show');

  $('.c-sidebar-nav-link').each(function () {
    var url = new URL($(this).attr('href'));
    if (url.pathname === window.location.pathname) {
      $(this).addClass('c-active');
      $(this).parents('.c-sidebar-nav-dropdown').addClass('c-show');
    }
  });
}

$(document).on('turbolinks:load', function () {
  initFormComponents();
  initSidebar();

  var clipboard = new ClipboardJS('.btn-clipboard');

  clipboard.on('success', function () {
    toastr.success("Text Copied", 'Success!')
  });

  var body = $('body');
  window.controller_name = body.data('controller-name');
  window.action_name = body.data('action-name');
  window.resource_id = body.data('resource-id');
});

$(document).on('turbolinks:before-cache', function () {
  $("select.select2").select2('destroy');
});

$(document).on('click', '.image-preview', function () {
  var modal = $('#image-preview-modal');
  $(modal).find('img').attr('src', $(this).attr('src'));
  $(modal).modal('show');
})
