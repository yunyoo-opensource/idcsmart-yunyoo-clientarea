$(function () {
  var btnDom = document.getElementsByTagName('button')

  for (var i = 0; i < btnDom.length; i++) {
    $(btnDom[i]).on('click', function () {
      if ($(this).attr("data-throttle") == 'true') {
        // console.log('属性:', $(this).attr("data-throttle"))
        // throttle(function () {
        //   console.log('属性:', $(this).attr("data-throttle"))
        //   $(this).attr('disabled', 'disabled')
        //   $(this).removeAttr('disabled')
        // }, 1000)
      }
    })
  }
})

function throttle (fn, t) {
  let last
  let timer
  const interval = t || 1000
  return function () {
    const args = arguments
    const now = +new Date()
    if (last && now - last < interval) {
      clearTimeout(timer)
      timer = setTimeout(function(){
        last = now
      }, interval)
    } else {
      last = now
      fn.apply(this, args)
    }
  }
}