/*
* @Author: 596873
* @Date:   2018-12-26 23:01:14
* @Last Modified by:   596873
* @Last Modified time: 2018-12-26 23:07:00
*/

export default{
  bind(el, binding) {
    el.addEventListener('keypress', e => {
      e.returnValue = /[\d]/.test(String.fromCharCode(e.keyCode));
    }, false);
  }
};
