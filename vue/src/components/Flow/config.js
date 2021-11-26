var visoConfig = {
    visoTemplate: {}
};

visoConfig.visoTemplate.playAudioNode =
    '<div class="pa" id="{{id}}" style="top:{{top}}px;left:{{left}}px"><a class="btn btn-success" href="#" role="button">放音</a></div>';

// 基本连接线样式
visoConfig.connectorStyle = {
  strokeStyle:"#a3b1bf",
   lineWidth:3,
    //strokeStyle: "#",
    joinstyle: "round",
    fill: null,
    outlineColor: "",
    // outlineStroke:"#61B7CF",
    // outlineWidth: 4
};

// 鼠标悬浮在连接线上的样式
visoConfig.connectorHoverStyle = {
    lineWidth: 5,
    strokeStyle: "#1d92ff",
    outlineWidth: 10,
    outlineColor: ""
};

visoConfig.baseStyle = {
    endpoint: [
        "Dot",
        {
            radius: 8,
            fill: "pink"
        }
    ],
    // endpointStyle: { fill: 'blue', outlineStroke: 'darkgray', outlineWidth: 2 },
    // 端点的形状
    connectorStyle: visoConfig.connectorStyle, // 连接线的颜色，大小样式
    connectorHoverStyle: visoConfig.connectorHoverStyle,
    paintStyle: {                       //锚点样式
        strokeStyle: "#1d92ff",         //stroke:划
        //stroke: "#fff",
        stroke: "#1e8151",                //锚点边框
        strokeWidth:"1",
        fill: "#1e8151",
        fillStyle: "#fff",
        radius: 7,
        lineWidth: 1
    },
    hoverPaintStyle: {
      outlineStroke: 'pink',
      strokeStyle: "#1d92ff",         //stroke:划
        //stroke: "#7AB02C",
        stroke: "",                //锚点边框
        strokeWidth:"1",
        radius: 8,
        lineWidth: 1,
        fillStyle: "#1d92ff",
    },
    isSource: true, // 是否可以拖动（作为连线起点）
    connector: [
        "Flowchart",
        { gap: 10, cornerRadius: 5, alwaysRespectStubs: true }
    ], // 连接线的样式种类有[Bezier],[Flowchart],[StateMachine ],[Straight ]
    isTarget: true, // 是否可以放置（连线终点）
    maxConnections: -1, // 设置连接点最多可以连接几条线
    ReattachConnections: false,
    connectorOverlays: [
        // [
        //     "Arrow",
        //     {
        //         width: 10,
        //         length: 10,
        //         location: 1
        //     }
        // ],
        // [
        //     "Arrow",
        //     {
        //         width: 10,
        //         length: 10,
        //         location: 0.2
        //     }
        // ],
        [
            "Arrow",
            {
                width: 10,
                length: 10,
                location: 1
            }
        ],
        // [
        //     "Label",
        //     {
        //         label: "123123",
        //         cssClass: "overlayTextBg",
        //         labelStyle: {
        //             color: "#023e56"
        //         },
        //         events: {
        //             click: function(labelOverlay, originalEvent) {
        //                 console.log(
        //                     "click on label overlay for :" +
        //                         labelOverlay.component
        //                 );
        //                 console.log(labelOverlay);
        //                 console.log(originalEvent);
        //             }
        //         }
        //     }
        // ]
    ]
};

visoConfig.baseArchors = ["RightMiddle", "LeftMiddle"];



export default visoConfig;
