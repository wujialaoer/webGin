import request from "@/utils/request";

const ClassName = "/PreView";
/**
 * POST /api/v{version}/PreView 实时预览
 * @export
 * @param {string} BotManageId
 * @param {string} WelcomingId
 * @param {string} DateTime
 * @returns
*/

export  function previewPub(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
  }
