<style>
    .chartbox {
      width: 50%!important;
    }
    @media screen and (max-width: 1367px) {
      .chartbox {
        width: 100%!important;
      }
    }
</style>
<div class="row">
{foreach $Detail.module_chart as $key=>$item}

  <div class="chartbox">
    <div class="module_chart module_chart_{$item.type}" data-type="{$item.type}" data-title="{$item.title}">
      <div style="height: 60px;">
        <h4 style="float: left;">{$item.title}</h4>
        {if $item.select}
        <div style="width:200px;float: right;margin-right: 20px;">
          <select class="module_chart_select_{$item.type} form-control selectpicker_refresh" onchange="getChartDataFn('','{$key}')">
            {foreach $item.select as $item2}
            <option value="{$item2.value}">{$item2.name}</option>
            {/foreach}
          </select>
        </div>
        {/if}
      </div>
      <div class="module_chart_date">
        <input class="form-control startTime" type="datetime-local" onchange="getChartDataFn('','{$key}')">
        <span class="ml-1 mr-1">{$Lang.reach}</span>
        <input class="form-control endTime mr-3" type="datetime-local" onchange="getChartDataFn('','{$key}')">
      </div>

    </div>

    <div class="w-100 h-100 ">

      <div style="height: 500px" class="chart_content_box w-100" id="module_chart_{$item.type}"></div>

    </div>
  </div>
{/foreach}

</div>

  




<script>
  // 图表tabs
  $(document).ready(function () {
    var arr = JSON.parse('{:json_encode($Detail.module_chart)}')
    setTimeout(function(){
      arr.forEach(function(item){
        getChartDataFn(item)
      })
    }, 0);
    
  });

  let switch_id = []
  let chartsData = []
  let timeArray = []
  let name = []
  let typeArray = []
  let myChart = null

  $('#chartLi').on('click', function () {
    setTimeout(function(){
      myChart.resize()
    }, 0);
  });


  // line
  function lineChartOption (type, xAxisData, seriesData0, seriesData1, unit, label) {
    // 硬盘IO
    const myChart = echarts.init(document.getElementById('module_chart_'+type))
    myChart.setOption({
      backgroundColor: '#fff',
      title: {
        subtext: (!xAxisData.length) ? '暂无数据' : '',
        left: 'center',
        textAlign: 'left',
        subtextStyle: {
          lineHeight: 250
        }
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'line',
          lineStyle: {
            color: '#7dcb8f'
          }
        },
        backgroundColor: '#fff',
        textStyle: {
          color: '#333',
          fontSize: 12
        },
        padding: [10, 10],
        extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);',
        formatter: function (params, ticket, callback) {
          // console.log('line:', params)
          const res = `<div>
                        <div>${params[0].marker} ${params[0].seriesName}：${params[0].value}${unit}</div>
                        <div>${params[1] ? params[1].marker : ''} ${params[1] ? params[1].seriesName : ''}${params[1] ? '：' : ''}${params[1] ? params[1].value : ''}${params[1] ? unit : ''}</div>
                        <div style="color: #999999;">${params[0].axisValue}</div>
                      </div>`
          return res
        }
      },
      grid: {
        left: '80',
        top: 30,
        x: 50,
        x2: 50,
        y2: 80
      },
      dataZoom: [ // 缩放
        {
          type: 'inside',
          throttle: 50
        }
      ],
      xAxis: [{
        offset: 15,
        type: 'category',
        boundaryGap: false,
        // 改变x轴颜色
        axisLine: {
          lineStyle: {
            type: 'dashed',
            color: '#ddd',
            width: 1
          }
        },
        // data: ['2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00'].map(function (str) {
        //   return str.replace(' ', '\n')
        // }),
        data: xAxisData,
        // 轴刻度
        axisTick: {
          show: false
        },
        // 轴网格
        splitLine: {
          show: false
        },
        axisLabel: {
          show: true,
          textStyle: {
            color: '#999999'
          }
        }
      }],
      yAxis: [{
        type: 'value',
        axisTick: {
          show: false
        },
        axisLine: {
          show: false
        },
        axisLabel: {
          formatter: '{value}' + unit,
          textStyle: {
            color: '#556677'
          }
        },
        splitLine: {
          lineStyle: {
            type: 'dashed'
          }
        }
      }],
      series: [{
        name: label[0],
        type: 'line',
        // data: [5, 12, 11, 14, 25, 16, 10, 18, 6],
        data: seriesData0,
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        showSymbol: false,
        lineStyle: {
          width: 2
        },
        itemStyle: {
          normal: {
            color: '#75db16',
            borderColor: '#75db16'
          }
        }
      }, {
        name: label[1],
        type: 'line',
        // data: [10, 10, 30, 12, 15, 3, 7, 20, 15000],
        data: seriesData1,
        symbolSize: 1,
        symbol: 'circle',
        smooth: true,
        showSymbol: false,
        lineStyle: {
          width: 3,
          shadowColor: 'rgba(92, 102, 255, 0.3)',
          shadowBlur: 10,
          shadowOffsetY: 20
        },
        itemStyle: {
          normal: {
            color: '#5c66ff',
            borderColor: '#5c66ff'
          }
        }
      }
      ]
    })

    window.addEventListener('resize', function () {
      myChart.resize()
    })
  }
  // area
  function areaChartOption (type, xAxisData, seriesData, unit, label) {
    // CPU使用率
    const myChart = echarts.init(document.getElementById('module_chart_'+type ))
    myChart.setOption({
      grid: {
        left: '80',
        top: 30,
        x: 50,
        x2: 50,
        y2: 80
      },
      backgroundColor: '#fff',
      title: {
        subtext: (!xAxisData.length) ? '暂无数据' : '',
        left: 'center',
        textAlign: 'left',
        subtextStyle: {
          lineHeight: 250
        }
      },
      tooltip: {
        backgroundColor: '#fff',
        padding: [10, 20, 10, 8],
        textStyle: {
          color: '#333',
          fontSize: 12
        },
        trigger: 'axis',
        axisPointer: {
          type: 'line',
          lineStyle: {
            color: '#7dcb8f'
          }
        },
        formatter: function (params, ticket, callback) {
          // console.log(params, '')
          const res = `<div>
                        <div>${params[0].seriesName}：${params[0].value}${unit} </div>
                        <div style="color: #999999;">${params[0].axisValue}</div>
                      </div>`
          return res
        },
        extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);'
      },
      dataZoom: [ // 缩放
        {
          type: 'inside',
          throttle: 50
        }
      ],
      xAxis: {
        offset: 15,
        type: 'category',
        boundaryGap: false,
        // 改变x轴颜色
        axisLine: {
          lineStyle: {
            color: '#999999',
            width: 1
          }
        },
        // data: ['2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00'].map(function (str) {
        //   return str.replace(' ', '\n')
        // }),
        data: xAxisData,
        // 轴刻度
        axisTick: {
          show: false
        },
        // 轴网格
        splitLine: {
          show: false
        },
        axisLabel: {
          show: true,
          // interval: 0, // 横轴信息全部显示
          textStyle: {
            color: '#999999'
          }
        }
      },
      yAxis: {
        axisTick: {
          show: false // 轴刻度不显示
        },
        max: 100,
        min: 0,
        // 改变y轴颜色
        axisLine: {
          show: false
        },
        // 轴网格
        splitLine: {
          show: true,
          lineStyle: {
            color: '#ddd',
            type: 'dashed'
          }
        },
        // 坐标轴文字样式
        axisLabel: {
          show: true,
          formatter: '{value}' + unit,
          textStyle: {
            color: '#999999'
          }
        }
      },
      series: [{
        name: label,
        type: 'line',
        areaStyle: {
          opacity: 1,
          color: '#737dff'
        },
        symbol: 'none', // 折线无拐点
        lineStyle: {
          normal: {
            width: 0 // 折线宽度
          }
        },
        smooth: true,
        // data: [5, 25, 20, 50, 10, 40, 18, 25, 0]
        data: seriesData

      }]
    })

    window.addEventListener('resize', function () {
      myChart.resize()
    })
  }

  // bar
  function barChartOption (type, xAxisData, seriesData0, seriesData1, unit, label) {
    // 内存用量
    const myChart = echarts.init(document.getElementById('module_chart_'+type))
    myChart.setOption({
      backgroundColor: '#fff',
      title: {
        subtext: (!xAxisData.length) ? '暂无数据' : '',
        left: 'center',
        textAlign: 'left',
        subtextStyle: {
          lineHeight: 250
        }
      },
      tooltip: {
        backgroundColor: '#fff',
        padding: [10, 20, 10, 8],
        textStyle: {
          color: '#000',
          fontSize: 12
        },
        trigger: 'axis',
        axisPointer: {
          type: 'line',
          lineStyle: {
            color: '#7dcb8f'
          }
        },
        formatter: function (params, ticket, callback) {
          // console.log('bar:', params)
          const res = `
          <div>
              <div>${params[0].marker}${params[0].seriesName}：${params[0].value}${unit} </div>                
              <div>${params[1] ? params[1].marker : ''} ${params[1] ? params[1].seriesName : ''}${params[1] ? '：' : ''}${params[1] ? params[1].value : ''}${params[1] ? unit : ''}</div>
              <div>${params[0].axisValue}</div>
          </div>`
          return res
        },
        extraCssText: 'box-shadow: 0px 4px 13px 1px rgba(1, 24, 167, 0.1);'
      },
      grid: {
        left: '80',
        top: 30,
        x: 70,
        x2: 50,
        y2: 80
      },
      dataZoom: [ // 缩放
        {
          type: 'inside',
          throttle: 50
        }
      ],
      xAxis: {
        offset: 15,
        axisLabel: {
          show: true,
          textStyle: {
            color: '#999'
          }
        },
        type: 'category',
        // 改变x轴颜色
        axisLine: {
          lineStyle: {
            type: 'dashed',
            color: '#ddd',
            width: 1
          }
        },
        // data: ['2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00', '2020-08-11 11:30:00'].map(function (str) {
        //   return str.replace(' ', '\n')
        // })
        data: xAxisData
      },
      yAxis: {
        axisTick: {
          show: false // 轴刻度不显示
        },
        axisLine: {
          show: false
        },
        axisLabel: {
          show: true,
          textStyle: {
            color: '#999'
          },
          formatter: '{value}' + unit
        },
        // 轴网格
        splitLine: {
          show: true,
          lineStyle: {
            color: '#ddd',
            type: 'dashed'
          }
        }

      },
      series: [{
        name: label[1],
        type: 'bar',
        stack: '总量',
        barGap: '-100%',
        // data: [136, 132, 101, 134, 90, 230, 210, 100, 300],
        data: seriesData1,
        itemStyle: {
          barBorderRadius: [5, 5, 0, 0],
          color: '#737dff'
        }
      },
      {
        name: label[0],
        type: 'bar',
        stack: '可用',
        // data: [964, 182, 191, 234, 290, 330, 310, 100, 500],
        data: seriesData0,
        itemStyle: {
          barBorderRadius: [5, 5, 0, 0],
          color: '#ccc',
          opacity: 0.3
        }
      } 
      ]
    })

    window.addEventListener('resize', function () {
      myChart.resize()
    })
  }



  async function getChartDataFn(e,index) {
    

    var arr = JSON.parse('{:json_encode($Detail.module_chart)}')
    if(index){e = arr[index]}
    var echartTT = echarts.init(document.getElementById('module_chart_'+e.type))
    echartTT.showLoading({
      text: '数据正在加载...',
      color: '#999',
      textStyle: {
        fontSize: 30,
        color: '#444'
      },
      effectOption: {
        backgroundColor: 'rgba(0, 0, 0, 0)'
      }
    })
    const queryObj = {
      id: '{$Think.get.id}',
      type: e.type,
      start: new Date($('.module_chart_'+e.type+' .startTime').val()).getTime(),
      end:new Date($('.module_chart_'+e.type+' .endTime').val()).getTime(),
      select: $('.module_chart_select_' + e.type).val(),
    }
    $.ajax({
      type: "GET",
      url: '' + '/provision/chart/{$Think.get.id}',
      data: queryObj,
      success: function (data) {
        echartTT.hideLoading()
      if (data.status !== 200) return false

      const xAxisData = []
      const seriesData0 = []
      const seriesData1 = [];

      (data.data.list || []).forEach((item, index) => {
        (item || []).forEach(innerItem => {
          if (index === 0) {
            xAxisData.push(innerItem.time)
            seriesData0.push(innerItem.value)
          } else if (index === 1) {
            seriesData1.push(innerItem.value)
          }
        })
      })

       if (data.data.chart_type === 'area') {
          areaChartOption(e.type, xAxisData, seriesData0, data.data.unit, data.data.label)
        } else if (data.data.chart_type === 'line') {
          lineChartOption(e.type, xAxisData, seriesData0, seriesData1, data.data.unit, data.data.label)
        } else if (data.data.chart_type === 'bar') {
          barChartOption(e.type, xAxisData, seriesData0, seriesData1, data.data.unit, data.data.label)
        }

        // 如果初始查询没有时间, 则设置默认时间为返回数据的第一个和最后一个时间
        if (!$('.module_chart_'+e.type+' .startTime').val() || !$('.module_chart_'+e.type+' .endTime').val()) {
          if (data.data.list[0].length) {
            var start = new Date(data.data.list[0][0].time).getTime()
            var end = new Date(data.data.list[0][data.data.list[0].length - 1].time).getTime()
            $('.module_chart_'+e.type+' .startTime').val(moment(start).format('YYYY-MM-DDTHH:mm'))
            $('.module_chart_'+e.type+' .endTime').val(moment(end).format('YYYY-MM-DDTHH:mm'))
          }
        }
      }
    });
  }





</script>