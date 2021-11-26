import request from "@/utils/request";

const ClassName = "/BotManage";

/**
 * GET/api/v{version}/BotManage/BotCount bot管理-Bot 统计
*/
export function getBotCountList() {
    return request({
      url: `${ClassName}/BotCount/`,
      method: "get"
    });
}

/**
 * post /api/v{version}/BotManage/Train bot管理-Bot 训练
*/
export function trainBot(data) {
    return request({
      url: `${ClassName}/Train`,
      method: "post",
      data
    });
}

/**
 * post /api/v{version}/BotManage/Publish bot管理-Bot 发布
*/
export function publishBot(data) {
    return request({
      url: `${ClassName}/Publish`,
      method: "post",
      data
    });
}

/**
 * PATCH /api/v{version}/BotManage/{id}  bot管理-Bot 发布
*/
export function train(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "post"
    });
}
