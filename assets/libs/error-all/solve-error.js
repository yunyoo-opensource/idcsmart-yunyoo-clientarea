window.onload=function(){
    // $("html").on('click',function(){
    //     console.log(1111);
    //     console.log($(this).find(".dropdown-toggle"));
    //     $(this).find('.dropdown-toggle').click(function(){
    //         console.log(12222);
    //         $(this).siblings(".dropdown-menu").css("opacity",0)
    //         let then = $(this);
    //         setTimeout(function(){
    //             then.siblings(".dropdown-menu").css("opacity",1)
    //         },300)
    //     })
    // })
    // setTimeout(function(){
    //     $("html").click();
    // },100)
    $("html").on('click','.dropdown-toggle',function(){
        console.log(11111);
    })
}
function allSelectClick(e) {
    console.log(e);
    console.log(222);
}