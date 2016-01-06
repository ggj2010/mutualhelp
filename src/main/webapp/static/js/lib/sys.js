$(function() {

    /*如果访问的地址不是通过iframe直接访问的，会默认加上导航*/
    if (self.frameElement && self.frameElement.tagName == "IFRAME") {
        $("#header").remove();
    } else {
        $("#header").css("display", "block");
    }

    /**
     *表单验证 
     */

    if($.validator!= undefined){


    $.validator.setDefaults({
        highlight : function(element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error').addClass('has-feedback');
            $(element).parent('.col-sm-8').children('span').last().addClass('glyphicon-remove').removeClass('glyphicon-ok');
        },

        success : function(element) {
            $(element).closest('.form-group').removeClass('has-error').addClass('has-success').addClass('has-feedback');
            $(element).closest('span').next('span').removeClass('glyphicon-remove').addClass('glyphicon-ok');
        },
        errorElement : "span",
        errorClass : "control-label",
        validClass : "m-b-none"
    });
    }
})