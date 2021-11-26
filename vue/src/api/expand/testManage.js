import request from "@/utils/request";

const ClassName = "/TestManage";

/**
 * POST  /api/v{version}/TestManage  FAQ 测试
 *   "botManageId": "string",
  "botManageName": "string",
  "faqPackages": [
    {
      "faqPackageId": "string",
      "faqPackageName": "string"
    }
  ]
*/
export function submitFAQTest(data) {
    return request({
      url: `${ClassName}/`,
      method: "POST",
      data
    });
}

export function TrainStatusALL(data) {
    return request({
      url: `trainStatus/`,
      method: "POST",
      data
    });
}
