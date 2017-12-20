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

    $("a#login").click(function () {
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
    var point = $('span.point');
    if (feed_back === 'success') {
        change_error_style($('div.alert'), "remove");
        point.empty();
        point.append(obj.attr("value") + "可以使用");
        return true;
    } else if (feed_back === 'fail') {
        change_error_style($('div.alert'), "add");
        point.empty();
        point.append(obj.attr("value") + "已存在");
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
        point.append('格式正确');
    }
}