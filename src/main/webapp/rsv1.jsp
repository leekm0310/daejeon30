<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto"/>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css"/>
    <!-- Bootstrap CSS
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
 -->
 <title>예약</title>
 
 
 <style>
 
 .ui-datepicker,
.ui-datepicker-material-header {
  font-family: "Roboto";
}

.ui-datepicker-material-header {
  display: block;
  background-color: $main-color;
  color: white;
  text-align: center;
  width: $width;

  .ui-datepicker-material-day {
    background-color: #1f3a58;
    padding: 10px;
    font-size: 1rem;
  }

  .ui-datepicker-material-date {
    padding: 20px;

    .ui-datepicker-material-month,
    .ui-datepicker-material-day-num,
    .ui-datepicker-material-year {
      padding: 5px;
    }
    .ui-datepicker-material-month {
      font-size: 2rem;
      text-transform: uppercase;
    }

    .ui-datepicker-material-day-num {
      font-size: 4.5rem;
    }

    .ui-datepicker-material-year {
      font-size: 1.8rem;
      font-weight: 200;
      color: rgba(255, 255, 255, 0.4);
    }
  }
}

.ui-datepicker {
  padding: 0;
  border: none;
  box-shadow: 0 12px 36px 16px rgba(0, 0, 0, 0.24);
  width: $width;
}

.ui-corner-all {
  border-radius: 0;
}

.ui-widget-header {
  border: 0;
}

.ui-datepicker-header {
  text-align: center;
  background: white;
  padding-bottom: 15px;
  font-weight: 300;

  .ui-datepicker-prev,
  .ui-datepicker-next,
  .ui-datepicker-title {
    border: none;
    outline: none;
    margin: 5px;
  }
}

.ui-datepicker-prev.ui-state-hover,
.ui-datepicker-next.ui-state-hover {
  border: none;
  outline: none;
  background: lighten($main-color, 50%);
}

.ui-datepicker-calendar {
  .ui-state-default {
    background: none;
    border: none;
    text-align: center;
    height: 33px;
    width: 33px;
    line-height: 36px;
  }

  .ui-state-highlight {
    color: $main-color;
  }

  .ui-state-active {
    border-radius: 50%;
    background-color: $main-color;
    color: white;
  }

  thead th {
    color: #999999;
    font-weight: 200;
  }
}

.ui-datepicker-buttonpane {
  border: none;

  .ui-state-default {
    background: white;
    border: none;
  }

  .ui-datepicker-close,
  .ui-datepicker-current {
    background: white;
    color: $main-color;
    text-transform: uppercase;
    border: none;
    opacity: 1;
    font-weight: 200;
    outline: none;

    &:hover {
      background: lighten($main-color, 50%);
    }
  }
}
 
 </style>
</head>
<body>
예약
<form action="rsv2.jsp" name="date-input" method="get">
<input type="text" data-type="date" id="date-input" name="date"/>
<input type="submit" value="확인">
</form>	
<div id="material-header-holder" style="display:none">
  <div class="ui-datepicker-material-header">
    <div class="ui-datepicker-material-day">
    </div>
    <div class="ui-datepicker-material-date">
      <div class="ui-datepicker-material-month">
      </div>
      <div class="ui-datepicker-material-day-num">
      </div>
      <div class="ui-datepicker-material-year">
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

var headerHtml = $("#material-header-holder .ui-datepicker-material-header");

var changeMaterialHeader = function (header, date) {
  var year = date.format("YYYY");
  var month = date.format("MMM");
  var dayNum = date.format("D");
  var isoDay = date.isoWeekday();

  var weekday = new Array(7);
  weekday[1] = "Monday";
  weekday[2] = "Tuesday";
  weekday[3] = "Wednesday";
  weekday[4] = "Thursday";
  weekday[5] = "Friday";
  weekday[6] = "Saturday";
  weekday[7] = "Sunday";

  $(".ui-datepicker-material-day", header).text(weekday[isoDay]);
  $(".ui-datepicker-material-year", header).text(year);
  $(".ui-datepicker-material-month", header).text(month);
  $(".ui-datepicker-material-day-num", header).text(dayNum);
};

$.datepicker._selectDateOverload = $.datepicker._selectDate;
$.datepicker._selectDate = function (id, dateStr) {
  var target = $(id);
  var inst = this._getInst(target[0]);
  inst.inline = true;
  $.datepicker._selectDateOverload(id, dateStr);
  inst.inline = false;
  this._updateDatepicker(inst);

  headerHtml.remove();
  $(".ui-datepicker").prepend(headerHtml);
};

$("input[data-type='date']").on("focus", function () {
  //var date;
  //if (this.value == "") {
  //  date = moment();
  //} else {
  //  date = moment(this.value, 'MM/DD/YYYY');
  //}

  $(".ui-datepicker").prepend(headerHtml);
  //$(this).datepicker._selectDate(this, date);
});

$("input[data-type='date']").datepicker({
  showButtonPanel: true,
  closeText: "OK",
  onSelect: function (date, inst) {
    changeMaterialHeader(headerHtml, moment(date, "MM/DD/YYYY"));
  }
});

changeMaterialHeader(headerHtml, moment());
$("input").datepicker("show");




</script>

</body>
</html>