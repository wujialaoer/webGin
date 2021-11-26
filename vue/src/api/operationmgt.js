import request from '@/utils/request';

// 获取集群信息总接口
export function getOperationList(params) {
  return request({
    url: '/install/',
    method: 'get',
    params
  });
}

// 运维单个日志执行详情信息
export function getOperationDetailList(params) {
  return request({
    url: '/operation/optlogdetail/',
    method: 'get',
    params
  });
}

// 运维获取zk集群详情信息
export function getZkInfo(params) {
  return request({
    url: '/zookeeper/',
    method: 'get',
    params
  });
}

// 初始化外链数据
export function getOuterChain(params) {
  return request({
    url: '/middleware/',
    method: 'get',
    params
  });
}

// 运维日志列表
export function getOperateLogList(params) {
  return request({
    url: '/operate/',
    method: 'get',
    params
  });
}

// 运维获取jb集群详情信息
export function getJBInfo(params) {
  return request({
    url: '/jboss/',
    method: 'get',
    params
  });
}

/** 获取zk节点信息接口
 *
 *  @data: {
 *    "clustername": "",
 *    "type": ""
 *  }
 **/
export function getZkOperationNode(data) {
  return request({
    url: '/operation/node/',
    method: 'post',
    data
  });
}

/** 获取codis集群信息接口
 *
 *  @data: {
 *    "clustername": "",
 *    "type": ""
 *  }
 **/
export function getCodisOperationNode(data) {
  return request({
    url: '/codis/detail/',
    method: 'post',
    data
  });
}

// 获取zk或者codis信息接口（待废弃）
export function getOperationNode(type, clustername) {
  const data = {
    clustername,
    type
  };
  return request({
    url: '/operation/node/',
    method: 'post',
    data
  });
}

/** 获取zk集群配置接口
 *
 *  @data: {
 *    "middleware_type":"",
 *    "cluster_name":"",
 *    "component_type":"",
 *    "operator":""
 *  }
 **/
export function getZkClusterConf(data) {
  return request({
    url: '/zk/zkclsconf/',
    method: 'post',
    data
  });
}

/** 获取codis集群配置接口
 *
 *  @data: {
 *    "middleware_type":"",
 *    "cluster_name":"",
 *    "component_type":"",
 *    "operator":""
 *  }
 **/
export function getCodisClusterConf(data) {
  return request({
    url: '/codis/getconf/',
    method: 'post',
    data
  });
}

// 获取zk或者codis集群配置接口（待废弃）
export function getClusterConf(middleware_type, cluster_name, component_type) {
  const data = {
    middleware_type, cluster_name, component_type
  };
  return request({
    url: '/operation/getclsconf/',
    method: 'post',
    data
  });
}

/** 操作zk集群接口 启停刷新
 *
 *  @data: {
 *    "cluster_detail": [{ip: "10.230.28.166", client_port: "2181", quorum_port: "2888", election_port: "3888",…}],
 *    "cluster_name": "ZK_159",
 *    "middleware_type": "zookeeper",
 *    "operation": "start",
 *    "operator": "deppon",
 *  }
 **/
export function zkClusterOperate(data) {
  return request({
    url: '/zkclusteropt/',
    method: 'post',
    data
  });
}

/** 操作codis 集群接口 启停刷新
 *
 *  @data: {
 *    "cluster_detail": [{ip: "10.230.28.166", client_port: "2181", quorum_port: "2888", election_port: "3888",…}],
 *    "cluster_name": "ZK_159",
 *    "middleware_type": "zookeeper",
 *    "operation": "start",
 *    "operator": "deppon",
 *  }
 **/
export function codisClusterOperate(data) {
  return request({
    url: '/codis/clusteroperate/',
    method: 'post',
    data
  });
}

/** 操作zk集群 单个节点接口 开启/停止
 *
 *  @data: {
 *    "client_port": "2181",
 *    "cluster_name": "ZK_159",
 *    "election_port": "3888",
 *    "ip": "10.230.28.166",
 *    "middleware_type": "zookeeper",
 *    "operation": "start",
 *    "operator": "deppon",
 *    "quorum_port": "2888",
 *    "status": "Stopped",
 *    "tick_time": "2000",
 *  }
 **/
export function zkNodeOperate(data) {
  return request({
    url: '/zknodeoperate/',
    method: 'post',
    data
  });
}

/** 操作codis集群 单个节点接口 开启/停止
 *
 *  @data: {
 *    "client_port": "2181",
 *    "cluster_name": "ZK_159",
 *    "election_port": "3888",
 *    "ip": "10.230.28.166",
 *    "middleware_type": "zookeeper",
 *    "operation": "start",
 *    "operator": "deppon",
 *    "quorum_port": "2888",
 *    "status": "Stopped",
 *    "tick_time": "2000",
 *  }
 **/
export function codisNodeOperate(data) {
  return request({
    url: '/codis/nodeoperate/',
    method: 'post',
    data
  });
}

/** 保存运维配置修改数据
 *
 *  @data: {
 *    "middleware_type":'',
 *    "cluster_name":'',
 *    "owner":'',
 *    "creater":'',
 *    "create_time":'',
 *    "reviser":'',
 *    "revise_time":'',
 *    "remark":'',
 *    "component_type":'',
 *    "config":''
 * }
 **/
export function saveClusterConf(data) {
  return request({
    url: '/clusterconf/',
    method: 'post',
    data
  });
}

/** zk 配置修改下发，滚动重启
 *
 *  @data: {
 *     "middleware_type": '',
 *     "cluster_name": '',
 *     "component_type": '',
 *     "config": ''
 *  };
 **/
export function zkRollRestart(data) {
  return request({
    url: '/zkmodifyconf/',
    method: 'post',
    data
  });
}

/** codis 配置修改下发，滚动重启
 *
 *  @data: {
 *     "middleware_type": '',
 *     "cluster_name": '',
 *     "component_type": '',
 *     "config": ''
 *  };
 **/
export function codisRollRestart(data) {
  return request({
    url: '/codis/deployconf/',
    method: 'post',
    data
  });
}

/** zookeeper 扩容缩容接口
 *
 * @data: {
 *     "middleware_type":"zookeeper",
 *     "cluster_name":"ZKGN_158",
 *     "node_type":"zookeeper",
 *     "capacity_type":"dilatation", // 扩容
 *     "capacity_type":"reduction", // 缩容
 *     "iplist":["10.230.28.159","10.230.28.167"],
 *     "operator":"guonan001",
 *     "task_id":"ZKGN_158-dilatation-20190110-0942"
 *   }
 */
export function zkCapacityChange(data) {
  return request({
    url: '/zkcmanager/',
    method: 'post',
    data
  });
}

/** zookeeper 卸载接口
 *
 * @data:{
 *   "middleware_type":"zookeeper",
 *   "cluster_name":"ZKGN_158",
 *   "operator":"deppon",
 *   "task_id":""
 * }
 *
 */
export function zkUninstall(data) {
  return request({
    url: '/zk/delzkcluster/',
    method: 'post',
    data
  });
}

// codis 卸载接口
export function codisUninstall(data) {
  return request({
    url: '/codis/delcluster/',
    method: 'post',
    data
  });
}

/**
 * jboss 节点接口
 */
export function getJbossOperationNode(data) {
  return request({
    url: '/jboss/clusternodes/',
    method: 'post',
    data
  });
}

/**
 * jboss 操作节点接口
 */
export function jbossOperate(data) {
  return request({
    url: '/jboss/multisoper/',
    method: 'post',
    data
  });
}

/**
 * jboss 可扩容ip
 */
export function jbossAvailableIp(params) {
  return request({
    url: '/cmdb/agents/',
    method: 'get',
    params
  });
}

/** jboss 扩容, 缩容接口
 *
 * @data: {
 *     "cluster_id": "this.cluster_id",
 *     "middleware_type":"jboss",
 *     "cluster_name":"ZKGN_158",
 *     "capacity_type":"dilatation/reduction", // 扩容/缩容
 *     "iplist":["10.230.28.159","10.230.28.167"],
 *     "operator":"guonan001",
 *     "task_id":"ZKGN_158-dilatation-20190110-0942"
 *   }
 */
export function jbCapacityChange(data) {
  return request({
    url: '/jboss/cmanager/',
    method: 'post',
    data
  });
}

/** jboss 获取日志
 *
 * @data: {
 *     capacity_type:"getlog"
 *     cluster_name:"accprocess-web_test"
 *     iplist:["10.230.34.65"]
 *     key_word:"123"
 *     middleware_type:"jboss"
 *     operator:"admin"
 *     task_id:"2019-04-25 15:08:22_jb_get_log_accprocess-web_test"
 *     time_interval:"5"
 *   }
 */
export function jbPullLog(data) {
  return request({
    url: '/jboss/pulllog/',
    method: 'post',
    data
  });
}

export function jbossGrey(data) {
  return request({
    url: '/jboss/greyopt/',
    method: 'post',
    data
  });
}

export function postDumpLog(data) {
  return request({
    url: '/jboss/getdumplog/',
    method: 'post',
    data
  });
}
// 运维dump日志列表
export function getAllDump(params) {
  return request({
    url: '/dump/',
    method: 'get',
    params
  });
}

/**
 *
 * @param data 例如, data={
 *   cluster_id: '5d849814ddbf4'
 * }
 * @returns {AxiosPromise}
 */
export function jbossPauseCluster(data) {
  return request({
    url: '/jboss/pausecluster/',
    method: 'post',
    data
  });
}

export function NodeStatus(data) {
  return request({
    url: '/jboss/nodestatus/',
    method: 'post',
    data
  });
}

