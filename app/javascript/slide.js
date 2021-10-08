function slide() {
  const CLASSNAME = "-visible";
  const TIMEOUT = 1500;
  const DELAY = 100;
  const $target1 = $(".event-add-top")
  const $target2 = $(".event-add-sentence")
  
  setInterval(() => {
    $target1.addClass(CLASSNAME);
    setTimeout(() => {
      $target2.addClass(CLASSNAME);
    }, DELAY);
  
    setTimeout(() => {
      $target1.removeClass(CLASSNAME);
      setTimeout(() => {
        $target2.removeClass(CLASSNAME);
      }, DELAY);
    }, TIMEOUT);
  }, TIMEOUT * 2);
}

window.addEventListener('load', slide)