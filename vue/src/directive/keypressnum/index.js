/*
* @Author: 596873
* @Date:   2018-12-26 23:00:27
* @Last Modified by:   596873
* @Last Modified time: 2018-12-26 23:07:10
*/

import keypressnum from './keypressnum';

const install = function(Vue) {
  Vue.directive('keypressnum', keypressnum);
};

if (window.Vue) {
  window.keypressnum = keypressnum;
  Vue.use(install); // eslint-disable-line
}

keypressnum.install = install;
export default keypressnum;
