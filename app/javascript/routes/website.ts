const Index = () => import('@/pages/website/IndexPage.vue');
const About = () => import('@/pages/website/AboutPage.vue');
const Login = () => import('@/pages/website/LoginPage.vue');
const Signup = () => import('@/pages/website/SignupPage.vue');
const States = () => import('@/pages/website/States.vue');

const routes = [
  {
    path: '/',
    name: 'index',
    components: {
      default: Index,
    },
  },
  {
    path: '/about',
    name: 'about',
    components: {
      default: About,
    },
  },
  {
    path: '/login',
    name: 'login',
    components: {
      default: Login,
    },
  },
  {
    path: '/signup',
    name: 'signup',
    components: {
      default: Signup,
    },
  },
  {
    path: '/states',
    name: 'states',
    components: {
      default: States,
    },
  },
];

export default routes;
