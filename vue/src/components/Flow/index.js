/* global $, visoConfig, Mustache, uuid, firstInstance, graphlib */
//import $ from "jquery";
//import data from "./data";
//import {jsPlumb} from "jsplumb";
import store from "@/store";
import visoConfig from "./config";
import { MessageBox } from 'element-ui';

const flow = {};
var flowData = {};
var area = "drop-bg";
var areaId = "#" + area;
var addKey = false;

flow.init = function(nodeData) {
  window.IVR = flow;
  flowData = nodeData?nodeData:flowData;
    var firstInstance = jsPlumb.getInstance();
    flow.firstInstance = firstInstance;
    firstInstance.ready(function(data) {
    main(flowData);
  });
  firstInstance.importDefaults({
    //一般来说拖动创建的链接，可以再次拖动，让链接断开。如果不想触发这种行为，可以设置。
    ConnectionsDetachable: true
  });
  
};

flow.DataDraw = DataDraw;
flow.initSetNode = initSetNode;
flow.addDraggable = addDraggable;
flow.setEnterPoint = setEnterPoint;
flow.getLine = getLine;

// flow.empty = empty;

function empty(){
    jsPlumb.empty();
}

var DataDraw = {
  deleteLine: function(conn) {
    if (confirm("确定删除所点击的链接吗？")) {
      flow.firstInstance.detach(conn);
    }
  },
  draw: function(nodes) {
    // 将Exit节点排到最后
    nodes.sort(function(a, b) {
      if (a.type === "Exit") return 1;
      if (b.type === "Exit") return -1;
      return 0;
    });

    var $container = $(areaId);
    var me = this;

    nodes.forEach(function(item, key) {
      console.log(item);
      console.log(typeof key);
      me.initNode(item);
    });

    this.mainConnect(nodes);
  },
  initNode(node) {
    var config = getBaseNodeConfig();
    var direction = ["Top", "Left", "Right", "Bottom"];
    if (node.type == "Root") {
      // 初始化开始节点属性
      config.isTarget = false;
      //config.maxConnections = 1;
      direction.forEach((item, index) => {
        flow.firstInstance.addEndpoint(
          node.nodeId,
          { anchors: item, uuid: node.nodeId + item + "-out" },
          config
        );
      });
    } else if (node.type == "Exit") {
      // 初始化结束节点属性
      config.isSource = false;
      //config.maxConnections = 1;
      direction.forEach((item, index) => {
        flow.firstInstance.addEndpoint(
          node.nodeId,
          { anchors: item, uuid: node.nodeId + item + "-in" },
          config
        );
      });
    } else {
      // flow.firstInstance.addEndpoint(node.nodeId,{anchors: "Top",uuid: node.nodeId},config);
      // flow.firstInstance.addEndpoint(node.nodeId,{anchors: "Bottom",uuid: node.nodeId},config);
      //条件
      setEnterPoint(node.nodeId, node);
      setExitPoint(node.nodeId, node);
    }
    addDraggable(node.nodeId);
  },
  mainConnect: function(nodes) {
    var me = this;
    nodes.forEach(function(item) {
      if (item.data.nextNode) {
        //if(item.type == "Root"){
        //   me.connectEndpoint(item, item.data.nextNode);
        // }else if(item.type == "Exit"){
        //   me.connectEndpoint(item.id+ "Top-out", item.data.nextNode);
        //}else{
        me.connectEndpoint(item, item.data.nextNode);
        // }
      }
    });
  },
  connectEndpoint: function(from, to) {
    to.forEach(function(item, index) {
      // if(item.sourceAnchor){
      //   flow.firstInstance.connect({ uuids: [from.id + item.sourceAnchor + "-out", item.nodeId + item.sourceAnchor + "-in"]});
      // }
      let nodeId = item.nodeId;
      if (from.type == "Root" && item.type != "Exit") {
        flow.firstInstance.connect({
                            // Root时 父节点id+ 锚点位置 从子节点获取 出    子节点id  入 
          uuids: [from.nodeId + item.sourceAnchor + "-out", item.nodeId + "-in"],
          overlays: createOverlay(from.data.nextNode[index].conditions, nodeId)
        });
      } else if (item.type == "Exit" && from.type != "Root") {
        flow.firstInstance.connect({
          uuids: [from.nodeId + "-out", item.nodeId + item.sourceAnchor + "-in"],
          overlays: createOverlay(from.data.nextNode[index].conditions, nodeId)
        });
      }else if (from.type == "Root" && item.type == "Exit") {
        flow.firstInstance.connect({
          uuids: [from.nodeId + "Right" + "-out", item.nodeId + "Left" + "-in"],
          overlays: createOverlay(from.data.nextNode[index].conditions, nodeId)
        });
      }
       else {
        flow.firstInstance.connect({
          uuids: [from.nodeId + "-out", item.nodeId + "-in"],
          overlays: createOverlay(from.data.nextNode[index].conditions, nodeId)
        });
      }
    });
  }
};

//初始化拖拽生成的
function initSetNode(node) {
    DataDraw.initNode(node);
}

// 让节点可拖动
function addDraggable(nodeId) {
  flow.firstInstance.draggable(nodeId, {
    containment: "parent",
    grid: [5, 5]
  });
}

// 常规节点设置入口点
function setEnterPoint(id, node) {
  var config = getBaseNodeConfig();
  config.isSource = false;
  config.maxConnections = -1;
  //config.connectorOverlays = createOverlay(node.conditions[0]);
  flow.firstInstance.addEndpoint(id, { anchors: "Left", uuid: id + "-in" }, config);
}

// 常规节点设置出口点
function setExitPoint(id, node) {
  var config = getBaseNodeConfig();
  config.isTarget = false;
  config.maxConnections = -1;
  //config.connectorOverlays = createOverlay(node.conditions[0]);
  flow.firstInstance.addEndpoint(id, { anchors: "Right", uuid: id + "-out" }, config);
}

// 编辑常规节点入口点
function editEnterPoint(){

}

/* 放入拖动节点 - store */
function dropNode(ui) {
  ui.position.left -= $(".flow_aside").outerWidth();
  ui.position.generateId = uuid.v1;
  let nodeElement = ui.draggable[0];
  let node = {
    nodeId: uuid.v1(),
    type: nodeElement.dataset.type,
    name:"",
    conditions: "",
    sourceAnchor: "",
    nodeContent: nodeElement.text,
    status: "0",
    guidelist:[{value:''}],
    data: {
      nextNode: {
        nodeId: "",
        type: "",
        name: "",
        conditions: "",
        sourceAnchor: "",
        nodeContent: "",
        status: "0",
      }
    },
    /* 此处宽高不能直接用 需要根据实际ui转换。 */
    top: ui.position.top,               
    left: ui.position.left
  };
  console.warn(node);
  store.commit("addNode", node);
}

/* 连接时添加锚点 子节点等信息  - store */
function connectAnchors(conn) {
  let nextNode = {};
  nextNode.souceAnchorType = conn.sourceEndpoint.anchor.type;
  nextNode.conditions = "";
  nextNode.nodeId = conn.targetId;
  nextNode.type = conn.target.dataset.type;
  let tree = {
    superId: conn.sourceId,
    nextNode: nextNode
  };

  store.commit("addNextNode", tree);
}

// 删除一个节点以及
function emptyNode(id) {
  flow.firstInstance.remove(id);
}

/* 
  创建条件覆盖节点
  拖拽时用
  也许能优化
*/
function createLabel(text, id) {
  let overlayText = [
    "Label",
    {
      label: text,
      id: id,
      cssClass: "overlayTextBg",
      labelStyle: {
        color: "#023e56"
      },
      events: {
        click: function(labelOverlay, originalEvent) {
          console.log("click on label overlay for :" + labelOverlay.component);
          console.log(labelOverlay);
          console.log(originalEvent);
        }
      }
    }
  ];
  return overlayText;
}

/* 
  创建箭头条件覆盖节点
  初始化页面连线时用
  也许能优化
*/
function createOverlay(text, id) {
  var overlay = [
    // [
    //   "Arrow",
    //   {
    //     width: 10,
    //     length: 10,
    //     location: 1
    //   }
    // ],
    // [
    //   "Arrow",
    //   {
    //     width: 10,
    //     length: 10,
    //     location: 0.2
    //   }
    // ],
    [
      "Arrow",
      {
        width: 10,
        length: 10,
        location: 1
      }
    ],
    [
      "Label",
      {
        label: text,
        id: id,
        cssClass: "overlayTextBg",
        labelStyle: {
          color: "#023e56"
        },
        events: {
          click: function(labelOverlay, originalEvent) {
            console.log(
              "click on label overlay for :" + labelOverlay.component
            );
            console.log(labelOverlay);
            console.log(originalEvent);
          }
        }
      }
    ]
  ];
  return overlay;
}

function eventHandler(data) {
  if (data.type === "deleteNode") {
    emptyNode(data.id);
  }
}

// 主要入口
function main(data) {
  flow.firstInstance.setContainer("drop-bg"); //容器 未生效？

  $(".btn-controler").draggable({
    //拖拽
    helper: "clone", //用光标移动 draggable 的副本
    scope: "ss"
  });

  $("#drop-bg").droppable({
    //droppable 拖拽至窗口触发事件
    scope: "ss",
    drop: function(event, ui) {
      //UI包含被拖拽对象，位置信息等
      //$(this).html("Dropped!");
      console.warn("ui", ui);
      dropNode(ui);
    }
  });

//   $("#drop-bg").on("hover",".pa",function(event){
//       console.warn(event);
//     $(this).hide();
//   });

  //监听删除节点
  $("#drop-bg").on("click", function(event) {
    event.stopPropagation();
    event.preventDefault();
    eventHandler(event.target.dataset);
  });

  var timer = null;
  /* 点击事件
   *   单击修改条件overlay，双击删除
   */
  flow.firstInstance.bind("click", function(conn, originalEvent) {
    clearTimeout(timer);

    var label = conn.getOverlay(conn.targetId);
    console.log("Label is currently", label.getLabel());
    
    timer = setTimeout(function() {
      // 这里采用执行自定义事件的方式

      var condition;
      MessageBox.prompt('请输入条件', {
        inputValue:label.getLabel(),
        confirmButtonText: '确定',
        cancelButtonText: '取消',
      }).then(({ value }) => {
          console.log(value);
          condition = value;
          if (condition == null) {
            return;
          }
          label.setLabel(condition);
          console.log("Label is now", label.getLabel());
          store.commit("setCondition", {
            id: conn.sourceId,
            condition: label.getLabel()
          });
      }).catch(() => {
            
      });

      // var condition = window.prompt("请输入条件");
      // if (condition == null) {
      //   return;
      // }

      //conn.setLabel(condition);
    }, 200); // 延迟300ms执行单击事件
  });

  /* 单点击了连接线上的X号 - 事件
      待优化  X按钮会被提交
    */
  flow.firstInstance.bind("dblclick", function(conn, originalEvent) {
    originalEvent.stopPropagation();
    clearTimeout(timer);
    DataDraw.deleteLine(conn);
  });

  /* 非手动连接连接事件 */
  flow.firstInstance.bind("connection", function(conn, originalEvent) {
    if (conn.connection.sourceId == conn.connection.targetId) {
      flow.firstInstance.detach(conn); //节点连接自己的时候自动删除
    }
    //connectAnchors(conn);
  });

  /* 当链接建立之前 - 事件
      处理两点： 节点锚点不能连接自己锚点
                两个节点之间不可重复连接。
      容易引起overlay问题，overlay深度依赖connection。
    */
  flow.firstInstance.bind("beforeDrop", function(info) {
    console.warn("beforeDrop", info);
    let connections = info.dropEndpoint.connections;
    let sourceId = info.connection.sourceId;
    let targetId = info.connection.targetId;
    for (let index = 0; index < connections.length; index++) {
      if (
        connections[index].sourceId == sourceId &&
        connections[index].targetId == targetId
      ) {
        addKey = false;
        return false;
      }
    }

    if (info.connection.sourceId == info.connection.targetId) {
      //flow.firstInstance.detach(info); //节点连接自己的时候自动删除
      addKey = false;
      return connectionBeforeDropCheck(info);
    } else {
      // let labelId = info.connection.targetId;
      // if(info.connection){
      //   info.connection.addOverlay(createLabel("条件",labelId));
      // }
      addKey = true;
      return true;
    }

    //
  });

  /* 手动连接后触发事件
      新建出条件覆盖节点overlay
    */
  flow.firstInstance.bind("connectionDragStop", function(connection, event) {
    if (addKey == false) {
      return;
    }
    addKey = true;
    let labelId = connection.targetId;
    if (connection) {
      connection.addOverlay(createLabel("", labelId));   //条件
    }
    console.warn(event);
    console.warn(connection.getOverlay(labelId).getLabel());
    console.warn(connection);
    //connection.setLabel("123123");
    addKey = false;
  });

  /* 处理移动线条时出现的问题。
      移动线条时，原覆盖overlay id不会变化， 将会影响到最终数据关系。
    */
  flow.firstInstance.bind("connectionMoved", function(connection, originalEvent) {
    console.warn("connectionMoved", connection);
    let originalTargetId = connection.originalTargetId; //原节点
    let newTargetId = connection.newTargetId; //移动到的节点
    let originalTargetText = connection.connection
      .getOverlay(originalTargetId)
      .getLabel(); //源节点文字
    connection.connection.removeOverlay(originalTargetId); //移除原条件
    connection.connection.addOverlay(
      createLabel(originalTargetText, newTargetId)
    ); //创建同名新条件
    addKey = false;
    return false;
  });
  DataDraw.draw([...data.nodeList]);
}

// 链接建立后的检查
// 当出现自连接的情况后，要将链接断开
function connectionBeforeDropCheck(info) {}

// 获取基本配置
function getBaseNodeConfig() {
  return Object.assign({}, visoConfig.baseStyle);
}

/* 
  最终输出的数据，入库
*/
function getLine() {
  let nodelist = [];
  /* 循环页面DOM节点 */
  $("#drop-bg .pa").each((index, value) => {
    let node = {
      nodeId: value.id,
      type: value.dataset.type,
      name:value.dataset.name,
      conditions:"",
      sourceAnchor:"",
      //nodeContent: value.innerText,
      nodeContent: $(value).children(".btn").html(),
      status: "0",
      top: value.offsetTop,
      left: value.offsetLeft,
      data: {
        nextNode: []
      }
    };
    nodelist.push(node);
  });
  /* 循环所有连线节点 connections 里包含条件，锚点等信息*/
  let allConnections = flow.firstInstance.getAllConnections();
  allConnections.forEach((item, index) => {
    let sourceId = item.sourceId;
    nodelist.forEach(element => {
      if (element.nodeId === sourceId) {
        let nextNode = {
          nodeId: item.targetId,
          name:item.target.dataset.name,
          nodeContent: "",
          status: "",
          conditions: item.getOverlay(item.targetId).getLabel(),
          type: item.target.dataset.type,
          sourceAnchor: item.target.dataset.type == "Exit"? item.endpoints[1].anchor.type :item.endpoints[0].anchor.type
        };
        element.data.nextNode.push(nextNode);
      }
    });
  });

  console.warn("保存", nodelist);
  //1。遍历所有节点位置
  //2. nextnode   targetID
  //3  conditions: flow.firstInstance.getAllConnections()[0].getOverlays("2f1a3791-64e0-11e9-9b32-05bf65a23ce0")
  //4   type:   sPlumb.getAllConnections()[0].target.dataset.type
  //5  sourceAnchor: flow.firstInstance.getAllConnections()[0].endpoint[0].anchor.type
  //store.commit("setAllnextNode", nodelist);
  return nodelist;
}

export default flow;
