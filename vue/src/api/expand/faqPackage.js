
import request from "@/utils/request";

const ClassName = "/FaqPackage";
/**
 * GET/api/v{version}/FaqPackage/BuFaqPackage
*/
export function getBuFaqPackageList() {
    return request({
      url: `${ClassName}/BuFaqPackage/`,
      method: "get",
    });
}
