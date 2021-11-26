import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

/* Layout */
import Layout from "@/layout";

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: "/login",
    component: () => import("@/views/login/index"),
    hidden: true
  },
  {
    path: "/404",
    component: () => import("@/views/404"),
    hidden: true
  },

  {
    path: "/chat",
    component: () => import("@/views/bot/chat"),
    hidden: false
  },
{
    path: "/",
    component: Layout,
    redirect: "/dashboard",
    meta: {title: "看板", icon: "dashboard"},
    children: [
      // {
      //   path: '/401',
      //   component: () => import('@/views/error-page/401'),
      //   meta: {title: "权限不足", icon: "dashboard"},
      //   hidden: true
      // },
      {
        path: "dashboard",
        name: "Dashboard",
        component: () => import("@/views/dashboard/index"),
        meta: {title: "看板", icon: "dashboard",}
      },
      {
        path: "logPull",
        name: "logPull",
        component: () => import("@/views/dashboard/logPull"),
        meta: {title: "日志拉取", icon: "dashboard", roles: ['Uadmin', 'Sadmin']}
      }

    ]
  },  {
    path: "/knowledge",
    component: Layout,
    //redirect: "/knowledge/index",
    redirect: "/knowledge/knpackage",
    meta: {title: "知识管理", icon: "tree", roles: ['Uadmin', 'Sadmin']},
    children: [
      {
        path: "index",
        name: "Knowledge",
        hidden: true,
        component: () => import("@/views/knowledge/index"),
        meta: {title: "知识管理", icon: "dashboard"}
      },
      {
        path: "knpackage",
        name: "Knpackage",
        component: () => import("@/views/knowledge/knpackage"),
        meta: {title: "知识包", icon: "dashboard"}
      },
      {
        path: "qa",
        name: "Qa",
        component: () => import("@/views/knowledge/qa"),
        meta: {title: "问答管理", icon: "dashboard"},
      },
      {
        path: "qa/newqa",
        name: "Newqa",
        hidden: true,
        component: () => import("@/views/knowledge/qa/newqa"),
        meta: {title: "新增问答", icon: "dashboard"}
      },
      {
        path: "qa/importdata",
        name: "ImportData",
        hidden: true,
        component: () => import("@/views/knowledge/qa/importdata"),
        meta: {title: "导入问答", icon: "dashboard"}
      },
            {
        path: "qa/importjson",
        name: "importjson",
        hidden: true,
        component: () => import("@/views/knowledge/qa/importjson"),
        meta: {title: "导入FAQ", icon: "dashboard"}
      },

      {
        path: "welcome",
        name: "Welcome",
        component: () => import("@/views/lexicon/welcome"),
        meta: {title: "个性", icon: "dashboard"},
        children: [
            {path: "addwelcome",
            name: "Addwelcome",
            hidden:true,
            component: () => import("@/views/lexicon/welcome/addwelcome"),
            meta: { title: "添加欢迎语", icon: "dashboard" }
        },{
            path: ":personalityId",
            name: "WelcomeDetail",
            hidden:true,
            component: () => import("@/views/lexicon/welcome/welcomedetail"),
            meta: { title:"", icon: "dashboard" }
        },{
          path: "AutoResponselist/:personalityId",
          name: "AutoResponselist",
          hidden:true,
          component: () => import("@/views/lexicon/welcome/autoresponselist"),
          meta: { title:"", icon: "dashboard" }
      }
      ]
      },

      // {
      //   path: "quoteanlay",
      //   name: "Quoteanlay",
      //   component: () => import("@/views/knowledge/quoteanlay"),
      //   meta: { title: "引用分析", icon: "dashboard" }
      // },
      // {
      //   path: "quoteanlay/shootStatement",
      //   name: "ShootStatement",
      //   hidden:true,
      //   component: () => import("@/views/knowledge/quoteanlay/shootStatement"),
      //   meta: { title: "命中语句", icon: "dashboard" }
      // },
      {
        path: "testgather",
        name: "Testgather",
        component: () => import("@/views/knowledge/testgather"),
        meta: {title: "测试集", icon: "dashboard"}
      },
    ]
  },
  // {
  //   path: "/content",
  //   component: Layout,
  //   redirect: "/content/index",
  //   meta: { title: "内容管理", icon: "table" },
  //   children: [
  //     {
  //       path: "index",
  //       name: "ContentManage",
  //       hidden:true,
  //       component: () => import("@/views/content/index"),
  //       meta: { title: "知识管理", icon: "dashboard" }
  //     },
  //     {
  //       path: "tag",
  //       name: "TagManage",
  //       component: () => import("@/views/content/tag"),
  //       meta: { title: "标签管理", icon: "dashboard" }
  //   },
  //     {
  //       path: "literature",
  //       name: "LiteratureManage",
  //       hidden:true,
  //       component: () => import("@/views/content/literature"),
  //       meta: { title: "文献管理", icon: "dashboard" }
  //     },
  //     {
  //       path: "article",
  //       name: "ArticleManage",
  //       component: () => import("@/views/content/article"),
  //       meta: { title: "文章管理", icon: "dashboard" }
  //     },
  //     {
  //       path: "video",
  //       name: "VideoManage",
  //       component: () => import("@/views/content/video"),
  //       meta: { title: "视频管理", icon: "dashboard" }
  //     },
  //   ]
  // },
  {
    path: "/lexicon",
    component: Layout,
    redirect: "/lexicon/filter",
    // redirect: "/lexicon/proper",
    meta: {title: "词典管理", icon: "form", roles: ['Uadmin', 'Sadmin', 'USER']},
    children: [
      {
        path: "index",
        name: "Lexicon",
        hidden: true,
        component: () => import("@/views/lexicon/index"),
        meta: {title: "词典管理", icon: "dashboard"}
      },
      // {
      //   path: "proper",
      //   name: "Proper",
      //   component: () => import("@/views/lexicon/proper"),
      //   meta: {title: "专有词典", icon: "dashboard"}
      // },

      {
        path: "filter",
        name: "Filter",
        component: () => import("@/views/lexicon/filter"),
        meta: {title: "过滤词", icon: "dashboard"}
      },
      {
        path: "alias",
        name: "Alias",
        component: () => import("@/views/lexicon/alias"),
        meta: {title: "别名", icon: "dashboard"}
      },
      //   {
      //     path: "wordgather",
      //     name: "Wordgather",
      //     component: () => import("@/views/lexicon/wordgather"),
      //     meta: { title: "词集合", icon: "dashboard" }
      //   },
      {
        path: "nounexplain",
        name: "Nounexplain",
        component: () => import("@/views/lexicon/nounexplain"),
        meta: {title: "名词解释", icon: "dashboard"}
      },
    ]
  },
  {
    path: "/bot",
    component: Layout,
    redirect: "/bot/index",
    name: "Bot",
    meta: {title: "Bot管理", icon: "user", roles: ['Uadmin', 'Sadmin']},
    children: [
      {
        path: "index",
        name: "BotDashboard",
        component: () => import("@/views/bot/index"),
        meta: {title: "Bot管理", icon: "dashboard"}
      },
      {
        path: "addbot",
        name: "Addbot",
        hidden: true,
        component: () => import("@/views/bot/addbot"),
        meta: {title: "编辑Bot", icon: "dashboard"}
      },
      {
        path: "preview",
        name: "Preview",
        component: () => import("@/views/bot/preview"),
        meta: {title: "实时预览", icon: "dashboard"}
      },
      {
        path: "testresult",
        name: "Testresult",
        hidden: false,
        component: () => import("@/views/bot/testresult"),
        meta: {title: "测试结果", icon: "dashboard"}
      },
      {
        path: "testdetail",
        name: "TestDetail",
        hidden: false,
        component: () => import("@/views/bot/testdetail"),
        meta: {title: "测试详情", icon: "dashboard"}
      },
      // {
      //   path: "trainresult",
      //   name: "Trainresult",
      //   hidden:false,
      //   component: () => import("@/views/bot/trainresult"),
      //   meta: { title: "训练结果", icon: "table" }
      // },

      //   {
      //     path: "publish",
      //     name: "Publish",
      //     component: () => import("@/views/bot/publish"),
      //     meta: { title: "发布", icon: "tree" }
      //   }
    ]
  },
  {
    path: "/system",
    component: Layout,
    redirect: "/system/knappman",
    meta: {title: "系统管理", icon: "nested", roles: ['Sadmin']},
    children: [
      // {
      //   path: "system",
      //   name: "System",
      //   component: () => import("@/views/system/index"),
      //   meta: {title: "系统管理", icon: "dashboard"}
      // },
      {
        path: "knappman",
        name: "knAppMan",
        component: () => import("@/views/system/knAppMan"),
        meta: {title: "知识应用管理", icon: "dashboard"}
      },
      {
        path: "config",
        name: "config",
        component: () => import("@/views/system/config"),
        meta: {title: "系统配置 ", icon: "dashboard"}
      },
      {
        path: "knmanage",
        name: "knManage",
        hidden: true,
        component: () => import("@/views/system/knManage"),
        meta: {title: "知识管理员", icon: "dashboard"}
      },
      {
        path: "updatePassword",
        name: "updatePassword",
        hidden: true,
        component: () => import("@/views/login/updatePassword"),
        meta: {title: "更新密码", icon: "dashboard"}
      },


    ]
  },

//   {
//     path: "/project",
//     component: Layout,
//     children: [
//       {
//         path: "/project",
//         name: "Project",
//         component: () => import("@/views/project/index"),
//         meta: { title: "项目管理", icon: "dashboard" }
//       }
//     ]
//   },
//   {
//     path: "/corpus",
//     component: Layout,
//     redirect: "/corpus/applaction",
//     meta: { title: "语料管理", icon: "example" },
//     children: [
//       {
//         path: "index",
//         name: "Corpus",
//         hidden: true,
//         props: true,
//         component: () => import("@/views/corpus/index"),
//         meta: { title: "语料", icon: "link" }
//       },
//       {
//         path: "/applaction",
//         name: "Applaction",
//         component: () => import("@/views/corpus/applaction"),
//         meta: { title: "语料管理", icon: "link" }
//       },
//     ],
//   },
//   {
//     path: "/flow",
//     component: Layout,
//     redirect: "/flow/list",
//     meta: { title: "流程管理", icon: "example" },
//     children: [
//       {
//         path: "list",
//         name: "Flowlist",
//         component: () => import("@/views/flow/list"),
//         meta: { title: "流程列表", icon: "form" }
//       },
//       {
//         path: "edit",
//         name: "",
//         hidden: true,
//         component: () => import("@/views/flow/edit"),
//         meta: { title: "流程详情", icon: "form" }
//       },
//       {
//         path: "edit/:id",
//         name: "FlowEdit",
//         hidden: true,
//         props: true,
//         noCache: true,
//         component: () => import("@/views/flow/index"),
//         meta: { title: "流程详情", icon: "form" }
//       }
//     ]
//   },
  //   {
  //     path: '/flowlist',
  //     component: Layout,
  //     children: [

  //     ]
  //   },
  //   {
  //     path: '/',
  //     component: Layout,
  //     redirect: '/dashboard',
  //     children: [{
  //       path: 'dashboard',
  //       name: 'Dashboard',
  //       component: () => import('@/views/dashboard/index'),
  //       meta: { title: 'Dashboard', icon: 'dashboard' }
  //     }]
  //   },

  {
    path: "/form",
    component: Layout,
    hidden: true,
    children: [
      {
        path: "index",
        name: "Form",
        component: () => import("@/views/form/index"),
        meta: {title: "Form", icon: "form"}
      }
    ]
  },

  // 404 page must be placed at the end !!!
  {path: "*", redirect: "/404", hidden: true}
];

const createRouter = () =>
  new Router({
    // mode: 'history', // require service support
    scrollBehavior: () => ({y: 0}),
    routes: constantRoutes
  });

const router = createRouter();

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter();
  router.matcher = newRouter.matcher; // reset router
}

router.selfaddRoutes = function (params) {
  router.matcher = new Router().matcher;
  router.addRoutes(params);
};

export default router;
