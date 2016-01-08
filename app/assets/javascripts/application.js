// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require bootstrap-select
//= require bootstrap-datepicker
//= require bootstrap-tokenfield
//= require select2
//= require select2_locale_es

$(document).on('page:load', UserSelect);
$(document).on('page:load', Tabs);
$(document).on('page:load', EnableSelectPicker);
$(document).on('page:load', DateTimePicker);
$(document).on('page:load', ImageSize);
$(document).on('page:load', Tokenize);
$(document).on('page:load', ResizeText);



$(function(){
  UserSelect();
  Tabs();
  EnableSelectPicker();
  DateTimePicker();
  ImageSize();
  Tokenize();
  ResizeText();
});

function ResizeText()
{
	var size = 14;
	while($('.board-name-p').width() > $('.board-name-div').width() || $('.board-name-p').height() > $('.board-name-div').height())
	{
    	size--;
    	$('.board-name-div').css('font-size', size+'px') 
	}
}
function Tokenize()
{

	//Token para lista de enfermedades
	var left_token_size = $('#diseases-token').width();
	$('#diseases-token').tokenfield({
		minWidth:left_token_size,
	});

	//Token para factores de riesgo
	var left_token_size = $('#patient-risk-token').width();
	$('#patient-risk-token').tokenfield({
		minWidth:left_token_size,
	});
	left_token_size = $('#plan-risk-token').width();
	$('#plan-risk-token').tokenfield({
		minWidth:left_token_size,
	});
	//Token para factores protectores
	var right_token_size = $('#patient-protection-token').width();
	$('#patient-protection-token').tokenfield({
		minWidth:right_token_size,
	});
	//Token para factores protectores
	right_token_size = $('#plan-protection-token').width();
	$('#plan-protection-token').tokenfield({
		minWidth:right_token_size,
	});

	//Token para objectivos de una actividad
	var objective_size = $('#objective-textfield').width();
    $('#objective-textfield').tokenfield({
    	minWidth:objective_size,
    });
}

function UserSelect()
{
	$("select").select2();
	$("#user-activity-select").select2({
    placeholder: "Uno o más responsables"
});
}

function Tabs()
{
    $("#tabs").tabs();
}

function ImageSize()
{
	//Imagen Plan
	var cw = $('.board-item-top img').width();
	$('.board-item-top img').css({'height':cw+'px'});

	//Imagen Actividad
	var cw = $('.left-activity img').width();
	$('.left-activity img').css({'height':cw+'px'});

	//Avatar Paciente
	//Avatar Usuario
	var cw = $('.people-container img').width();
	$('.people-container img').css({'height':cw+'px'});

}

function DateTimePicker()
{
	 $('#datepicker').datepicker({format: 'yyyy-mm-dd'});
}

function EnableSelectPicker(){
  $(".selectpicker").selectpicker();
}

function ShowFirstPlan()
{
	$(".board-wrapper > div").hide();
	$("#board-0").show();
}
function ChangeDisplayPlan()
{
	$('.board-select').on('change', function() {
  	$(".board-wrapper > div").hide();
	$("#board-"+this.value).show();
	$('.board-select').val(this.value);
});
}
