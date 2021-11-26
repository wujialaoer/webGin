<template>
    <div class="chartCardBox ele-card-body">
        <div class="chart-card-header">
        <div class="meta">
            <span class="chart-card-title">
            <slot name="title">
                {{ title }}
            </slot>
            </span>
        </div>

        </div>
        <div class="chart-card-content">
            <div class="total">
                <slot name="total">
                <span>{{ typeof total === 'function' && total() || total }}</span>
                </slot>
            </div>
        </div>
        <div class="chart-card-footer">
        <div class="field">
            <slot name="footer">{{percent}}</slot>
        </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'ChartCard',
        props: {
            title: {
            type: String,
            default: ''
            },
            total: {
            type: [Function, Number, String],
            required: true,
            default: null
            },
            percent: {
            type: String,
            default: ''
            }
        }
    }
</script>

<style lang="scss" scoped>
.chartCardBox{
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    color: #000000a6;
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5;
    list-style: none;
    -webkit-font-feature-settings: "tnum";
    font-feature-settings: "tnum";
    position: relative;
    background: #fff;
    border-radius: 2px;
    -webkit-transition: all .3s;
    transition: all .3s;
}

.ele-card-body{
    padding:20px 24px 8px;
    margin-bottom:20px;
}
  .chart-card-header {
    position: relative;
    overflow: hidden;
    width: 100%;

    .meta {
      position: relative;
      overflow: hidden;
      width: 100%;
      color: rgba(0, 0, 0, .45);
      font-size: 14px;
      line-height: 22px;
      margin-bottom:10px;
    }
  }

  .chart-card-action {
    cursor: pointer;
    position: absolute;
    top: 0;
    right: 0;
  }

  .chart-card-footer {
    // border-top: 1px solid #e8e8e8;
    padding-top: 9px;
    margin-top: 8px;

    > * {
      position: relative;
    }

    .field {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      margin: 0;
      margin-bottom:10px;
      color:#4fb047;
    }
  }

  .chart-card-content {
    margin-bottom: 12px;
    position: relative;
    height: 46px;
    width: 100%;

    .content-fix {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
    }
  }

  .total {
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    white-space: nowrap;
    color: #000;
    margin-top: 4px;
    margin-bottom: 0;
    font-size: 30px;
    line-height: 38px;
    height: 38px;
  }
</style>
