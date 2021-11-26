
/* 
*拼装消息
*/
export function assembleMsg (msg,isSelf){
    return {
        content:msg,
        isSelf:isSelf
    };
}
/**
 * 把消息转换成Html
 */

function convertMsgtoHtml(html,msg) {
    //let html = html,
    var elems, elem, type, content;
    elems = msg.elems; //获取消息包含的元素数组
    var count = elems.length;
    for (var i = 0; i < count; i++) {
        elem = elems[i];
        type = elem.type; //获取元素类型
        content = elem.content; //获取元素对象
        switch (type) {
            case webim.MSG_ELEMENT_TYPE.TEXT:
                html += convertTextMsgToHtml(content);
                //转义，防XSS
                //html = webim.Tool.formatText2Html(html);
                break;
            case webim.MSG_ELEMENT_TYPE.FACE:
                html += convertFaceMsgToHtml(content);
                break;
            case webim.MSG_ELEMENT_TYPE.IMAGE:
                if (i <= count - 2) {
                    var customMsgElem = elems[i + 1]; //获取保存图片名称的自定义消息elem
                    var imgName = customMsgElem.getContent().getData(); //业务可以自定义保存字段，demo中采用data字段保存图片文件名
                    html += convertImageMsgToHtml(content, imgName);
                    i++; //下标向后移一位
                } else {
                    html += convertImageMsgToHtml(content);
                }
                break;
            case webim.MSG_ELEMENT_TYPE.LOCATION:
                html += convertLocationMsgToHtml(content);
                break;
            case webim.MSG_ELEMENT_TYPE.CUSTOM:
                let desc = webim.Tool.formatText2Html(content.desc); //描述信息
                if(desc ==  "reply"){
                    html += convertCustomMsgToHtml(msg, content);
                    return html;
                }else{
                    html += convertCustomMsgToHtml(msg, content);
                }
                // return html;
                //转义，防XSS
                //html = webim.Tool.formatText2Html(html);
                break;
            case webim.MSG_ELEMENT_TYPE.GROUP_TIP:
                html += convertGroupTipMsgToHtml(content);
                //转义，防XSS
                html = webim.Tool.formatText2Html(html);
                break;
            default:
                webim.Log.error('未知消息元素类型: elemType=' + type);
                break;
        }
    }

    return html;
}

//解析文本消息元素
function convertTextMsgToHtml(content) {
    return content.text;
}

//解析表情消息元素
function convertFaceMsgToHtml(content) {
    var faceUrl = null;
    var data = content.data;
    var index = webim.EmotionDataIndexs[data];

    var emotion = webim.Emotions[index];
    if (emotion && emotion[1]) {
        faceUrl = emotion[1];
    }
    if (faceUrl) {
        return "<img src='" + faceUrl + "'/>";
    } else {
        return data;
    }
}
//解析图片消息元素
function convertImageMsgToHtml(content, imageName) {
    var smallImage = content.ImageInfoArray[webim.IMAGE_TYPE.SMALL-1]; //小图
    var bigImage = content.ImageInfoArray[webim.IMAGE_TYPE.LARGE-1]; //大图
    var oriImage = content.ImageInfoArray[webim.IMAGE_TYPE.ORIGIN-1]; //原图
    if (!bigImage) {
        bigImage = smallImage;
    }
    if (!oriImage) {
        oriImage = smallImage;
    }
    return "<img name='" + imageName + "' src='" + smallImage.url + "#" + bigImage.url + "#" + oriImage.url + "' style='cursor: pointer' id='" + content.size + "' bigImgUrl='" + bigImage.url + "' @click='imageClick(this)' />";
}


//解析语音消息元素
function convertSoundMsgToHtml(content) {
    var second = content.getSecond(); //获取语音时长
    var downUrl = content.getDownUrl();
    if (webim.BROWSER_INFO.type == 'ie' && parseInt(webim.BROWSER_INFO.ver) <= 8) {
        return '[这是一条语音消息]demo暂不支持ie8(含)以下浏览器播放语音,语音URL:' + downUrl;
    }
    return '<audio id="uuid_' + content.uuid + '" src="' + downUrl + '" controls="controls" onplay="onChangePlayAudio(this)" preload="none"></audio>';
}
//解析文件消息元素
function convertFileMsgToHtml(content) {
    var fileSize, unitStr;
    fileSize = content.getSize();
    unitStr = "Byte";
    if (fileSize >= 1024) {
        fileSize = Math.round(fileSize / 1024);
        unitStr = "KB";
    }
    // return '<a href="' + content.getDownUrl() + '" title="点击下载文件" ><i class="glyphicon glyphicon-file">&nbsp;' + content.getName() + '(' + fileSize + unitStr + ')</i></a>';

    return '<a href="javascript:;" onclick=\'webim.onDownFile("' + content.uuid + '")\' title="点击下载文件" ><i class="glyphicon glyphicon-file">&nbsp;' + content.name + '(' + fileSize + unitStr + ')</i></a>';
}
//解析位置消息元素
function convertLocationMsgToHtml(content) {
    return '经度=' + content.getLongitude() + ',纬度=' + content.getLatitude() + ',描述=' + content.getDesc();
}

//解析自定义消息元素
function convertCustomMsgToHtml(msg, content) {
    var data = webim.Tool.formatText2Html(content.data); //自定义数据
    var desc = webim.Tool.formatText2Html(content.desc); //描述信息
    var ext = webim.Tool.formatText2Html(content.ext); //扩展信息
    //return "data=" + data + ", desc=" + desc + ", ext=" + ext;
    if (desc == "question") {
        //return "对 <a style='cursor:pointer'>" + ext + "</a>&nbsp<b style='color:orange;'>提问</b>" + "：" + data;
        return "</a>&nbsp<b style='color:#F80005;'>【问】</b>" + "：" + data;
    } else if (desc == "answer") {
        return "对 <a style='cursor:pointer'>" + ext + "</a>&nbsp<b style='color:orange;'>回答</b>" + "：" + data;
    } else if (desc == "important") {
        //console.warn(msg, content);
        return "<b style='color:red;'>★重要★ ：" + "</b>" ;//data + "</b>";
        
    } else if (desc == "top") {
        return "<b style='color:orange;'>【置顶】</b>" + "：" + data + "<span class='closeBtn' style='color:#ccc;'>X</span>";
    } else if (desc == "reply") {
        let extUser = ext.slice(0,ext.indexOf("："));
        let extContent = ext.slice(ext.indexOf("：") + 1);
        return "<div class='msg-question'><span class='username'>" + extUser + "</span><b style='color:#F44336;'>【问】：</b>"+ extContent +"&nbsp&nbsp&nbsp</div>" + "<div class='msg-answer'><span class='username'>" + msg.fromAccountNick + "</span><b style='color:#2196F3;'>【答】</b>：" + data; + "</div>"
    }
    
}

//解析群提示消息元素
function convertGroupTipMsgToHtml(content) {
    var WEB_IM_GROUP_TIP_MAX_USER_COUNT = 10;
    var text = "";
    var maxIndex = WEB_IM_GROUP_TIP_MAX_USER_COUNT - 1;
    var opType, opUserId, userIdList;
    var groupMemberNum;
    console.warn(content);
    opType = content.opType; //群提示消息类型（操作类型）
    opUserId = content.opUserId; //操作人id
    switch (opType) {
        case webim.GROUP_TIP_TYPE.JOIN: //加入群
            userIdList = content.userIdList;
            //text += opUserId + "邀请了";
            for (var m in userIdList) {
                text += userIdList[m] + ",";
                if (userIdList.length > WEB_IM_GROUP_TIP_MAX_USER_COUNT && m == maxIndex) {
                    text += "等" + userIdList.length + "人";
                    break;
                }
            }
            text = text.substring(0, text.length - 1);
            text += "加入该群，当前群成员数：" + content.groupMemberNum;
            break;
        case webim.GROUP_TIP_TYPE.QUIT: //退出群
            text += opUserId + "离开该群，当前群成员数：" + content.groupMemberNum;
            break;
        case webim.GROUP_TIP_TYPE.KICK: //踢出群
            text += opUserId + "将";
            userIdList = content.userIdList;
            for (var m in userIdList) {
                text += userIdList[m] + ",";
                if (userIdList.length > WEB_IM_GROUP_TIP_MAX_USER_COUNT && m == maxIndex) {
                    text += "等" + userIdList.length + "人";
                    break;
                }
            }
            text += "踢出该群";
            break;
        case webim.GROUP_TIP_TYPE.SET_ADMIN: //设置管理员
            text += opUserId + "将";
            userIdList = content.userIdList;
            for (var m in userIdList) {
                text += userIdList[m] + ",";
                if (userIdList.length > WEB_IM_GROUP_TIP_MAX_USER_COUNT && m == maxIndex) {
                    text += "等" + userIdList.length + "人";
                    break;
                }
            }
            text += "设为管理员";
            break;
        case webim.GROUP_TIP_TYPE.CANCEL_ADMIN: //取消管理员
            text += opUserId + "取消";
            userIdList = content.userIdList;
            for (var m in userIdList) {
                text += userIdList[m] + ",";
                if (userIdList.length > WEB_IM_GROUP_TIP_MAX_USER_COUNT && m == maxIndex) {
                    text += "等" + userIdList.length + "人";
                    break;
                }
            }
            text += "的管理员资格";
            break;

        case webim.GROUP_TIP_TYPE.MODIFY_GROUP_INFO: //群资料变更
            text += opUserId + "修改了群资料：";
            var groupInfoList = content.groupInfoList;
            var type, value;
            for (var m in groupInfoList) {
                type = groupInfoList[m].type;
                value = groupInfoList[m].value;
                switch (type) {
                    case webim.GROUP_TIP_MODIFY_GROUP_INFO_TYPE.FACE_URL:
                        text += "群头像为" + value + "; ";
                        break;
                    case webim.GROUP_TIP_MODIFY_GROUP_INFO_TYPE.NAME:
                        text += "群名称为" + value + "; ";
                        break;
                    case webim.GROUP_TIP_MODIFY_GROUP_INFO_TYPE.OWNER:
                        text += "群主为" + value + "; ";
                        break;
                    case webim.GROUP_TIP_MODIFY_GROUP_INFO_TYPE.NOTIFICATION:
                        text += "群公告为" + value + "; ";
                        break;
                    case webim.GROUP_TIP_MODIFY_GROUP_INFO_TYPE.INTRODUCTION:
                        text += "群简介为" + value + "; ";
                        break;
                    default:
                        text += "未知信息为:type=" + type + ",value=" + value + "; ";
                        break;
                }
            }
            break;

        case webim.GROUP_TIP_TYPE.MODIFY_MEMBER_INFO: //群成员资料变更(禁言时间)
            text += opUserId + "修改了群成员资料:";
            var memberInfoList = content.memberInfoList;
            console.warn(content);
            var userId, shutupTime;
            for (var m in memberInfoList) {
                userId = memberInfoList[m].userId;
                shutupTime = memberInfoList[m].shutupTime;
                text += userId + ": ";
                if (shutupTime != null && shutupTime !== undefined) {
                    if (shutupTime == 0) {
                        text += "取消禁言; ";
                    } else {
                        text += "禁言" + shutupTime + "秒; ";
                    }
                } else {
                    text += " shutupTime为空";
                }
                if (memberInfoList.length > WEB_IM_GROUP_TIP_MAX_USER_COUNT && m == maxIndex) {
                    text += "等" + memberInfoList.length + "人";
                    break;
                }
            }
            break;
        default:
            text += "未知群提示消息类型：type=" + opType;
            break;
    }
    return text;
}
