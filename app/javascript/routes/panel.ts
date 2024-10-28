const Index = () => import('@/pages/panel/IndexPage.vue');
const news = () => import('@/pages/panel/news/news.vue');

const routes = [
  {
    path: '/',
    name: 'index',
    components: {
      default: Index,
    },
  },
  {
    path: '/news',
    name: 'news',
    components: {
      default: news,
    },
  },
];

export default routes;
