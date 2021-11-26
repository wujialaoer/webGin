export const chart1 = {
    title: {
        text: ''
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        //data: ['访问人数','访问人次'],
        data: [],
        right:100,
        icon:'circle'
    },
    toolbox: {
        feature: {
            //saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            boundaryGap: false,
            data: []
        }
    ],
    yAxis: [
        {
            type: 'value',
            "axisLine":{       //y轴
                "show":false

              },
              "axisTick":{       //y轴刻度线
                "show":false
              },
            splitLine:{
                show:false
            }
        }
    ],
    series: [
        {
            name: '访问人数',
            type: 'line',
            label: {
              normal: {
                  show: true,
                  position: 'top'
              }
          },
            areaStyle: {},
            data: []
        },
        {
            name: '问答次数',
            type: 'line',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {},
            data: []
        }
    ]
};

export const chart2 = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            right: 10,
            icon:'circle',
            //data: ['默认分类', '公积金', '公司福利', '公司环境', '团建活动']
            data: []
        },
        color:['#9B3468','#F87E50','#FC6058','#DC4C5D','#C43B67'],
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: true,
                label: {
                    // formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                    // backgroundColor: '#eee',
                    // borderColor: '#aaa',
                    // borderWidth: 1,
                    // borderRadius: 4,
                    // shadowBlur:3,
                    // shadowOffsetX: 2,
                    // shadowOffsetY: 2,
                    // shadowColor: '#999',
                    // padding: [0, 7],
                    rich: {
                        a: {
                            color: '#999',
                            lineHeight: 22,
                            align: 'center'
                        },
                        // abg: {
                        //     backgroundColor: '#333',
                        //     width: '100%',
                        //     align: 'right',
                        //     height: 22,
                        //     borderRadius: [4, 4, 0, 0]
                        // },
                        hr: {
                            borderColor: '#aaa',
                            width: '100%',
                            borderWidth: 0.5,
                            height: 0
                        },
                        b: {
                            fontSize: 16,
                            lineHeight: 33
                        },
                        per: {
                            color: '#eee',
                            backgroundColor: '#334455',
                            padding: [2, 4],
                            borderRadius: 2
                        }
                    }
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: true
                },
                data: []
                // data: [
                //     {value: 335, name: '默认分类'},
                //     {value: 310, name: '公积金'},
                //     {value: 234, name: '公司福利'},
                //     {value: 135, name: '公司环境'},
                //     {value: 1548, name: '团建活动'}
                // ]
            }
        ]
    };

export const table1 = [];
// export const table1 = [{
//     id:"q1",
//     question: '上班迟到怎么办',
//     count: '1'
//   }, {
//       id:"q2",
//     question: '你们公司有一个叫哈哈的人吗',
//     count: '1'
//   }, {
//       id:"q3",
//     question: '公司会有KPI考核吗',
//     count: '1'
//   }, {
//       id:"q4",
//     question: '公司几点上班啊',
//     count: '1'
//   },{
//     id:"q5",
//   question: '请问公司上班迟到怎么办',
//   count: '1'
// }]
