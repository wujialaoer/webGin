import request from "@/utils/request";

const ClassName = "/Conversation";

/**
 * GET /api/v{version}/Conversation/QRCode 二维码
 * @export
 * @returns
 */

export function getQRCode(params) {
  return request({
    url: `${ClassName}/QRCode`,
    method: "get",
    params
  });
}

/**
 * GET /api/v{version}/Conversation/Welcoming 欢迎语
 * @export
 * @param {string} BotManageId
 * @param {string} WelcomingId
 * @param {string} DateTime
 * @returns
 */

export function getWelcoming(params) {
  return request({
    url: `${ClassName}/Welcoming`,
    method: "get",
    params
  });
}

/**
 * POST /api/v{version}/Conversation  会话
 * @export
 * @param {string} botManageId
 * @param {string} userInput
 * @returns
 */

export function sendMsg(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

export function previewSendMsg(data) {
  return request({
    url: `${ClassName}/preview`,
    method: "post",
    data
  });

}
