/*
	Copyright (C) 2009 - 2012
	WebSite:	Http://wangking717.javaeye.com/
	Author:		wangking
*/
$(function () {

    //input action
    $("[reg],[url]:not([reg]),[tip]").focus(
        function (e) {
            if ($(this).attr('tip') !== undefined) {
                var top = ($(this).offset().top + $(this).height() + 15);
                var left = ($(this).offset().left + 30);
                $('body').append( '<p id="vtip" style="top: ' + top + 'px;left: ' + left + 'px;"><img id="vtipArrow" src="../img/vtip_arrow.png"/>' + $(this).attr('tip') + '</p>' );
            }
        },
        function () {
            if ($(this).attr('tip') !== undefined) {
                $("span.point").empty();
            }
        }
    ).blur(function () {
        if($(this).attr('tip') !== undefined){
            $("p#vtip").remove();
        }
        if ($(this).attr("reg") !== undefined) {
            validate($(this));
        }
    });

    $("a.login").click(function () {
        var isSubmit = true;
        $("[reg],[url]:not([reg])").each(function () {
            if ($(this).attr("reg") === undefined) {
                if (!ajax_validate($(this))) {
                    isSubmit = false;
                }
            } else {
                if (!validate($(this))) {
                    isSubmit = false;
                }
            }
        });
        if (typeof(isExtendsValidate) !== "undefined") {
            if (isSubmit && isExtendsValidate) {
                return extendsValidate();
            }
        }
        return isSubmit;
    });

});

function validate(obj) {
    var reg = new RegExp(obj.attr("reg"));
    var objValue = obj.attr("value");

    var point = $('span.point');
    point.empty();
    point.append(obj.attr('tip'));
    
    if (!reg.test(objValue)) {
        change_error_style($('div.alert'), "add");
        return false;
    } else {
        if (obj.attr("url") === undefined) {
            change_error_style($('div.alert'), "remove");
            return true;
        } else {
            return ajax_validate(obj);
        }
    }
}

function ajax_validate(obj) {

    var url_str = obj.attr("url");
    if (url_str.indexOf("?") !== -1) {
        url_str = url_str + "&" + obj.attr("name") + "=" + obj.attr("value");
    } else {
        url_str = url_str + "?" + obj.attr("name") + "=" + obj.attr("value");
    }
    var feed_back = $.ajax({url: url_str, cache: false, async: false}).responseText;
    feed_back = feed_back.replace(/(^\s*)|(\s*$)/g, "");
    if (feed_back === 'success') {
        change_error_style(obj, "remove");
        change_tip(obj, null, "remove");
        return true;
    } else {
        change_error_style(obj, "add");
        change_tip(obj, feed_back, "add");
        return false;
    }
}

function change_error_style(obj, action_type) {
    if (action_type === "add") {
        obj.removeClass("alert-info");
        obj.addClass("alert-error");
    } else {
        obj.removeClass("alert-error");
        obj.addClass("alert-info");
        var point = $('span.point');
        point.empty();
    }
}

$.fn.validate_callback = function (msg, action_type, options) {
    this.each(function () {
        if (action_type === "failed") {
            change_error_style($(this), "add");
            change_tip($(this), msg, "add");
        } else {
            change_error_style($(this), "remove");
            change_tip($(this), null, "remove");
        }
    });
};
