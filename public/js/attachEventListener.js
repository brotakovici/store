/* Cross-browser way to listen for an event.
   — Phyramid (phyramid.com)
*/
var attachEventListener = function(elem, type, handler) {
  if (elem == null || typeof elem === 'undefined') return;
  if (elem.addEventListener) {
    elem.addEventListener(type, handler, false);
  } else if (elem.attachEvent) {
    elem.attachEvent("on" + type, handler);
  } else {
    elem['on' + type] = handler;
  }
};
