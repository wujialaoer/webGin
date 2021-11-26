import Mock from 'mockjs'

const data = Mock.mock({
  'items|10': [{
    id: '@id',
    title: '@sentence(5, 10)',
    'status|1': ['published', 'draft', 'deleted'],
    version: '1.1.@id',
    display_time: '@datetime',
    pageviews: '@integer(300, 5000)'
  }]
})

export default [
  {
    url: '/flow/list',
    type: 'get',
    response: config => {
      const items = data.items
      return {
        code: 20000,
        data: {
          total: items.length,
          items: items
        }
      }
    }
  }
]
