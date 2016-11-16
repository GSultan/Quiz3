// 1)
$("a:contains('eal')").css("color", "red");

// 2)
$(document).ready(function(){
        $("a").on('click',function(event) {
            event.preventDefault();
            $(this).fadeOut(1000);
          })
      ;
    });
// 3)
function isEven(x) {
  return x % 2 == 0;
}

console.log([1, 2, 3, 4].filter(isEven));

