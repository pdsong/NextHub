const Index = () => import('@/pages/panel/IndexPage.vue');
const news = () => import('@/pages/panel/news/news.vue');
const favoriteLink = () => import('@/pages/panel/favoriteLink/favoriteLink.vue')

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
  {
    path: '/favoriteLink',
    name: 'favoriteLink',
    components: {
      default: favoriteLink,
    },
  },
];

export default routes;
