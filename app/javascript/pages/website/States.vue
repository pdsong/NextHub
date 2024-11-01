<template>
  <h2 class="text-center">You are visiting the {{ pageName }} page!</h2>
    <el-button>Default</el-button>
      <el-row :gutter="20">
    <el-col v-for="(item, index) in source" :key="index" :xs="24" :sm="12" :md="8" :lg="6">
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
        <template #footer>
          <span>点击查看详情</span>
        </template>
      </el-card>
    </el-col>
  </el-row>
</template>

<script setup >
const pageName = 'About';
import { onMounted, ref } from 'vue';
import axios from 'axios'

// 定义数据源
const source = ref([
  { name: '百度', enName: 'Baidu', link: 'https://www.baidu.com' }
]);

const fetchData = async () => {
  try {
    const response = await axios.get('http://localhost:3000/api/v1/hackNews/listNow')
    source.value = response.data
  } catch (error) {
    console.error("Error fetching data:", error)
  }
}

onMounted(()=>{
  fetchData()
})
// 打开链接函数
const openLink = (link) => {
  window.open(link, '_blank');
};

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