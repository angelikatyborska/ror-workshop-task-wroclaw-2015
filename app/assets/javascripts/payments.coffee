$(document).ready(->
  $('.payments table').dataTable({
    'order': [1, 'asc'],
    'columnDefs': [
      { 'orderable': false, 'targets': 3 }
    ]
  });
);