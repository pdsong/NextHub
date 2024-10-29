import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'http://localhost:3000', // 替换为你的 API 基础 URL
  timeout: 1000,
});

// 设置请求拦截器
apiClient.interceptors.request.use(config => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = token; // 将 token 添加到请求头部
  }
  return config;
});

export default apiClient;
