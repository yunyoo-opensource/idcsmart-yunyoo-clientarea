!function (s) {
    "use strict";
    var e, t = localStorage.getItem("language"), n = "eng";
    function l () {
        document.webkitIsFullScreen || document.mozFullScreen || document.msFullscreenElement || (console.log("pressed"), s("body").removeClass("fullscreen-enable"))
    }
    s("#side-menu").metisMenu(),
        s("#vertical-menu-btn").on("click", function (e) {
            e.preventDefault(),
                s("body").toggleClass("sidebar-enable"),
                992 <= s(window).width() ? s("body").toggleClass("vertical-collpsed") : s("body").removeClass("vertical-collpsed")
        }),
        s("#sidebar-menu a").each(function () {
            // var e = window.location.href.split(/[?#]/)[0];
            var e = window.location.href.split(/[?#]/);
            var e_href = this.href.split(/[?#]/);
            var hidden_url = {
                '/billing': ['/viewbilling'],
                '/service': ['/servicedetail'],
                '/supporttickets': ['/viewticket'],
                //帮助中心
                '/knowledgebase': ['/knowledgebaseview'],
                '/news': ['/newsview'],
                // 登录日志
                '/systemlog': ['/loginlog']
            };
            var is_hidden_menu = false;
            for (var i in hidden_url) {
                if (e_href[0] == window.location.protocol + '//' + window.location.hostname + i) {
                    if (document.referrer == this.href && hidden_url[i].includes(window.location.pathname)) {
                        // console.log('e_href[0]:' + e_href[0] + ';e_href[1]:' + e_href[1] + ';e[0]:' + e[0] + ';e[1]:' + e[1] + ';哈哈哈哈哈');
                        is_hidden_menu = true;
                        break;
                    }
                }
            }
            if (window.location.href.includes("keywords") || window.location.href.includes("domain_status")) {
                var is_searchMenu = window.location.href.includes(this.href + "&");
            } else if (window.location.href == this.href) {
                var is_searchMenu = true;
            } else {
                var is_searchMenu = false;
            }
            // console.log('e_href[0]:' + e_href[0] + ';e_href[1]:' + e_href[1] + ';e[0]:' + e[0] + ';e[1]:' + e[1] + ';');
            // var is_searchMenu = window.location.href.includes(this.href);
            if ((e_href[0] == e[0] && !e_href[1]) || (e_href[0] == e[0] && e_href[1] == e[1]) || is_hidden_menu || is_searchMenu) {
                (s(this).addClass("active"), s(this).parent().siblings().find('a').removeClass('active'), s(this).parent().addClass("mm-active").siblings().removeClass('mm-active'), s(this).parent().parent().addClass("mm-show"), s(this).parent().parent().prev().addClass("mm-active"), s(this).parent().parent().parent().addClass("mm-active"), s(this).parent().parent().parent().parent().addClass("mm-show"), s(this).parent().parent().parent().parent().parent().addClass("mm-active"))
                return false;
            }
        }),

        s(document).ready(function () {
            var e;
            0 < s("#sidebar-menu").length && 0 < s("#sidebar-menu .mm-active .active").length && (300 < (e = s("#sidebar-menu .mm-active .active").offset().top) && (e -= 300, s(".simplebar-content-wrapper").animate({
                scrollTop: e
            },
                "slow")))
        }),
        s(".navbar-nav a").each(function () {
            var e = window.location.href.split(/[?#]/)[0];
            this.href == e && (s(this).addClass("active"), s(this).parent().addClass("active"), s(this).parent().parent().addClass("active"), s(this).parent().parent().parent().addClass("active"), s(this).parent().parent().parent().parent().addClass("active"), s(this).parent().parent().parent().parent().parent().addClass("active"))
        }),
        s('[data-toggle="fullscreen"]').on("click",
            function (e) {
                e.preventDefault(),
                    s("body").toggleClass("fullscreen-enable"),
                    document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement ? document.cancelFullScreen ? document.cancelFullScreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitCancelFullScreen && document.webkitCancelFullScreen() : document.documentElement.requestFullscreen ? document.documentElement.requestFullscreen() : document.documentElement.mozRequestFullScreen ? document.documentElement.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT)
            }),
        document.addEventListener("fullscreenchange", l),
        document.addEventListener("webkitfullscreenchange", l),
        document.addEventListener("mozfullscreenchange", l),
        s(".right-bar-toggle").on("click", function (e) {
            s("body").toggleClass("right-bar-enabled")
        }),
        s(document).on("click", "body",
            function (e) {
                0 < s(e.target).closest(".right-bar-toggle, .right-bar").length || s("body").removeClass("right-bar-enabled")
            }),
        s(".dropdown-menu a.dropdown-toggle").on("click",
            function (e) {
                return s(this).next().hasClass("show") || s(this).parents(".dropdown-menu").first().find(".show").removeClass("show"),
                    s(this).next(".dropdown-menu").toggleClass("show"),
                    !1
            }),
        s(function () {
            s('[data-toggle="tooltip"]').tooltip()
        }),
        s(function () {
            s('[data-toggle="popover"]').popover()
        }),
        s(".language").on("click",
            function (e) {
                a(s(this).attr("data-lang"))
            }),
        s(window).on("load",
            function () {
                s("#status").fadeOut(),
                    s("#preloader").delay(350).fadeOut("slow")
            }),
        Waves.init()
}(jQuery);

(function () {
    if (window.location.host == "market.idcsmart.com") {
        var webUrl = window.location.origin;
        $.ajax({
            type: 'GET',
            url: 'developer/developer',
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success: function (res, textStatus, jqXHR) {
                if (res.status == 200) {
                    console.log(res)
                    var status = res.data.developer.status || 'null'
                    var devType = res.data.developer.type
                    console.log('status', status)
                    console.log('devType', devType)
                    //啥也不是先入驻
                    if (status === 'null' || status === 'Pending' || status === 'Cancelled' || status === 'Suspended') {
                        // 删除入驻之外的菜单
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === webUrl + '/developerInfo' || $(this).children("a").attr('href') === webUrl + '/appManageList' || $(this).children("a").attr('href') === webUrl + '/serverManageList' || $(this).children("a").attr('href') === webUrl + '/dataCenetr' || $(this).children("a").attr('href') === webUrl + '/ActivityList' || $(this).children("a").attr('href') === webUrl + '/taskManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/developerInfo' || $(this).children("a").attr('href') === webUrl + '/development/#/appManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/serverManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/dataCenetr' || $(this).children("a").attr('href') === webUrl + '/development/#/ActivityList' || $(this).children("a").attr('href') === webUrl + '/development/#/taskManageList'
                                || $(this).children("a").attr('href') === 'developerInfo' || $(this).children("a").attr('href') === 'appManageList' || $(this).children("a").attr('href') === 'serverManageList' || $(this).children("a").attr('href') === 'dataCenetr' || $(this).children("a").attr('href') === 'ActivityList' || $(this).children("a").attr('href') === 'taskManageList' || $(this).children("a").attr('href') === 'development/#/developerInfo' || $(this).children("a").attr('href') === 'development/#/appManageList' || $(this).children("a").attr('href') === 'development/#/serverManageList' || $(this).children("a").attr('href') === 'development/#/dataCenetr' || $(this).children("a").attr('href') === 'development/#/ActivityList' || $(this).children("a").attr('href') === 'development/#/taskManageList'
                            ) {
                                $(this).remove()
                            }
                        })
                    } else {
                        // 开发者
                        $('li').each(function () {
                            if ((status === 'Active' || status === 'Review' || status === 'Failed') && devType == 1) {
                                if ($(this).children("a").attr('href') === webUrl + '/developerSettleIn' || $(this).children("a").attr('href') === webUrl + '/serverManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/developerSettleIn' || $(this).children("a").attr('href') === webUrl + '/development/#/serverManageList'
                                    || $(this).children("a").attr('href') === 'developerSettleIn' || $(this).children("a").attr('href') === 'serverManageList' || $(this).children("a").attr('href') === 'development/#/developerSettleIn' || $(this).children("a").attr('href') === 'development/#/serverManageList'
                                ) {
                                    $(this).remove()
                                }
                            }
                        })
                        // 服务商
                        $('li').each(function () {
                            if ((status === 'Active' || status === 'Review' || status === 'Failed') && devType == 2) {
                                if ($(this).children("a").attr('href') === webUrl + '/developerSettleIn' || $(this).children("a").attr('href') === webUrl + '/appManageList' || $(this).children("a").attr('href') === webUrl + '/taskManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/developerSettleIn' || $(this).children("a").attr('href') === webUrl + '/development/#/appManageList' || $(this).children("a").attr('href') === webUrl + '/development/#/taskManageList'
                                    || $(this).children("a").attr('href') === 'developerSettleIn' || $(this).children("a").attr('href') === 'appManageList' || $(this).children("a").attr('href') === 'taskManageList' || $(this).children("a").attr('href') === 'development/#/developerSettleIn' || $(this).children("a").attr('href') === 'development/#/appManageList' || $(this).children("a").attr('href') === 'development/#/taskManageList'
                                ) {
                                    $(this).remove()
                                }
                            }
                        })
                        // 开发者和服务商
                        $('li').each(function () {
                            if ((status === 'Active' || status === 'Review' || status === 'Failed') && devType == 3) {
                                //http://w5.test.idcsmart.com/development/#/developerSettleIn
                                if ($(this).children("a").attr('href') === webUrl + '/developerSettleIn' || $(this).children("a").attr('href') === webUrl + '/development/#/developerSettleIn'
                                    || $(this).children("a").attr('href') === 'developerSettleIn' || $(this).children("a").attr('href') === 'development/#/developerSettleIn'
                                ) {
                                    $(this).remove()
                                }
                            }
                        })
                    }
                }
            }
        });
    }

    var webUrl = window.location.origin;
	if (window.location.host == "my.doopcloud.com" || window.location.host=="my.doopres.com") {
    // 资源池
    $.ajax({
        type: 'GET',
        url: 'resource/resource',
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success: function (res, textStatus, jqXHR) {
            if (res.status == 200) {
                var userType = "", supplierStatus = "", agentStatus = "";
                if (res.data.agent.id) {
                    userType = "agent"
                    agentStatus = res.data.agent.status
                    sessionStorage.setItem('userType', 'agent')
                    sessionStorage.setItem('status', res.data.agent.status)
                }
                if (res.data.supplier.id) {
                    userType = "supplier"
                    supplierStatus = res.data.supplier.status
                    sessionStorage.setItem('userType', 'supplier')
                    sessionStorage.setItem('status', res.data.supplier.status)
                }
                if (res.data.agent.id && res.data.supplier.id) {
                    userType = "supplier_agent"
                    agentStatus = res.data.agent.status
                    supplierStatus = res.data.supplier.status
                    sessionStorage.setItem('userType', 'supplier_agent')
                    sessionStorage.setItem('agentStatus', res.data.agent.status)
                    sessionStorage.setItem('status', res.data.supplier.status)
                }
                if (!res.data.agent.id && !res.data.supplier.id) {
                    userType = ''
                    supplierStatus = 'register'
                    sessionStorage.setItem('userType', '')
                    sessionStorage.setItem('status', 'register')
                }

                console.log(userType, supplierStatus, agentStatus)

                // 未入驻-删除其他菜单保留入驻菜单
                if (supplierStatus == 'register') {
                    $('li').each(function () {
                        if ($(this).children("a").attr('href') === 'res/#/agentManage' || $(this).children("a").attr('href') === 'res/#/supplierManage') {
                            $(this).remove()
                        }
                    })
                }
                // 代理商-删除供应商菜单
                if (userType == 'agent') {
                    $('li').each(function () {
                        if ($(this).children("a").attr('href') === 'res/#/supplierManage') {
                            $(this).remove()
                        }
                    })
                    if (agentStatus != 'Active') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/agentManage') {
                                $(this).remove()
                            }
                        })
                    }
                }
                // 供应商-删除代理商菜单
                if (userType == 'supplier') {
                    $('li').each(function () {
                        if ($(this).children("a").attr('href') === 'res/#/agentManage') {
                            $(this).remove()
                        }
                    })
                    if (supplierStatus != 'Active') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/supplierManage') {
                                $(this).remove()
                            }
                        })
                    }
                }
                // 供应商-代理商
                if (userType == 'supplier_agent') {
                    if (supplierStatus == 'Active' && agentStatus == 'Active') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/enterpriseSettlement') {
                                $(this).remove()
                            }
                        })
                    }
                    if (supplierStatus == 'Active' && (agentStatus == 'Pending' || agentStatus == 'Wait' || agentStatus == 'Cancelled')) {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/agentManage') {
                                $(this).remove()
                            }
                        })
                    }
                    if ((supplierStatus == 'Pending' || supplierStatus == 'Unpaid' || supplierStatus == 'Wait' || supplierStatus == 'Cancelled') && agentStatus == 'Active') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/supplierManage') {
                                $(this).remove()
                            }
                        })
                    }
                    if (supplierStatus == 'Active' && agentStatus == 'Suspended') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/enterpriseSettlement') {
                                $(this).remove()
                            }
                        })
                    }
                    if (supplierStatus == 'Active' && agentStatus == 'Wait') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/agentManage') {
                                $(this).remove()
                            }
                        })
                    }
                    if (supplierStatus == 'Suspended' && agentStatus == 'Active') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/enterpriseSettlement') {
                                $(this).remove()
                            }
                        })
                    }
                    if (supplierStatus == 'Suspended' && agentStatus == 'Suspended') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/enterpriseSettlement') {
                                $(this).remove()
                            }
                        })
                    }
                    if ((supplierStatus == 'Cancelled' || supplierStatus == 'Unpaid' || supplierStatus == 'Wait') && agentStatus == 'Cancelled') {
                        $('li').each(function () {
                            if ($(this).children("a").attr('href') === 'res/#/agentManage' || $(this).children("a").attr('href') === 'res/#/supplierManage') {
                                $(this).remove()
                            }
                        })
                    }
                }
            }
        }
    });
	}
})()