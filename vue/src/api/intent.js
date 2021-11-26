import request from "@/utils/request";


/**
 *获取意图列表
 * @export
 * @returns
 */
export function getIntent() {
    return request({
      url: "/Intent",
      method: "get"
    });
  }



/**
 * @export
 * @param {string} appId
 * @param {string} name
 * @param {string} exampleSentence
 * @param {number} state
 * @returns
 */

export function createIntent(data) {
    return request({
      url: "/Intent",
      method: "post",
      data
    });
  }