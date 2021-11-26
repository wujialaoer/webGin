import request from "@/utils/request";

/**
 *获取训练集列表
 * @export
 * @returns
 */
export function getTrainingList() {
  return request({
    url: "/utterance/Training",
    method: "get"
  });
}

/**
 *创建训练集
 *
 * @export
 * @param {string} appId
 * @param {string} text
 * @param {string} intentsId
 * @returns
 */
export function createTraining(data) {
  return request({
    url: "/utterance/Training",
    method: "post",
    data
  });
}

/**
 *获取测试集列表
 * @export
 * @returns
 */
export function getTest() {
  return request({
    url: "Utterance/Test",
    method: "get",
  });
}


/**
 *创建测试集
 * @export
 * @param {string} appId
 * @param {string} name
 * @param {string} text
 * @param {string} intentsId
 * @param {number} state
 * @param {string} expectResult
 * @param {string} actualIntents
 * @returns
 */
export function createTest(data) {
    return request({
      url: "Utterance/Test",
      method: "post",
      data
    });
  }