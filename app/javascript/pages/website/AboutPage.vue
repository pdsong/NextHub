<template>
  <h2 class="text-center">You are visiting the {{ pageName }} page!</h2>
    <el-button>Default</el-button>
    <el-button type="primary">Primary</el-button>
    <el-button type="success">Success</el-button>
    <el-button type="info">Info</el-button>
    <el-button type="warning">Warning</el-button>
    <el-button type="danger">Danger</el-button>
</template>

<script setup lang="ts">
const pageName = 'About';
</script>
