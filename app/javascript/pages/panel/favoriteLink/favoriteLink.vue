<template>
    <div @wheel="handleScroll">
       <p>当前第{{ currentPage }}页，共{{ totalPage }}页，共{{ totalLink }}个链接  [滑轮换页]</p>
        <el-row :gutter="20">
    <el-col v-for="(item, index) in data" :key="index" :xs="24" :sm="12" :md="8" :lg="4">
      <el-icon><Box /></el-icon>
      <el-card
        style="max-width: 480px; cursor: pointer;"
         @click="openLink(item.link)"
      >
        <template #header>
          <div class="card-header">
            <span>{{ item.cn_title }}</span>
          </div>     
        </template>
        <p class="text item">{{ item.en_title }}</p>
      </el-card>
    </el-col>
  </el-row>

      
    </div>
</template>

<script setup >
import { ref, onMounted } from 'vue';
import apiClient from '@/services/apiClent';
import { ElMessage } from 'element-plus';

const currentPage = ref(1); // 当前页数
const totalLink = ref(1); // 当前页数
const totalPage = ref(1); // 当前页数
const data = ref([]); // 存储数据


const fetchData = async (page) => {
  try {
    // const response = await axios.get(`/api/data?page=${page}`);
    // data.value = response.data; // 更新数据
    const response = await apiClient.get('/api/v1/user_hack_news',{
          params: {
            page: currentPage.value,
            per_page: 12,
          },
        }); 
    data.value = response.data.data
    totalPage.value=response.data.pagy.pages 
    totalLink.value=response.data.pagy.count 
  } catch (error) {
    console.error('Error fetching data:', error);
  }
};

const handleScroll = (event) => {
  if (event.deltaY > 0) {
    nextPage();
  } else {
    previousPage();
  }
};

// 打开链接函数
const openLink = (link) => {
  window.open(link, '_blank');
};

const nextPage = () => {
  if( currentPage.value>=totalPage.value){
    console.log("-------------------------->max")
    ElMessage.info("已超过最大页数")
    return
  }
  currentPage.value += 1;
  fetchData(currentPage.value);
};

const previousPage = () => {
  if (currentPage.value > 1) {
    currentPage.value -= 1;
    fetchData(currentPage.value);
  }
};

// 组件挂载时加载第一页数据
onMounted(() => {
  fetchData(currentPage.value);
});

</script>
<style scoped>
.card-header {
  font-weight: bold;
  font-size: 18px;
}
.text.item {
  margin: 10px 0;
  color: #606266;
}
</style>